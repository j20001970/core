#pragma once

#ifdef _WIN32
#include "../../Common/BaseThread.h"

#include <wininet.h>
#pragma comment(lib, "Wininet")

//------------------------------------------------------------------------------------------------------

// ��������� ��� ������������� ����� �������� � ������
#define	MAX_SIZE						256
// ��������� ��� ������������� ����� ����������� ����
#define DOWNLOAD_FILE_SIZE				32768
#define MAX_SINGLE_DOWNLOAD_FILE_SIZE 524288


// ��������� ��� ��������� ������� �����
#define CONTENT_RANGE		_T("bytes 0-0/")
// ��������� ��� ����������� �������� � CONTENT_RANGE
#define CONTENT_RANGE_SIZE	( 11/*sizeof ( CONTENT_RANGE )*/ - 1 )


//------------------------------------------------------------------------------------------------------
// ����� ��� ������� ����� �� ���� �� ��������� ���� 
//------------------------------------------------------------------------------------------------------

class CFileDownloader : public CBaseThread
{
public :

	CFileDownloader (CString sFileUrl, BOOL bDelete = TRUE) : CBaseThread(0)
	{
		m_pFile     = NULL;
		m_sFilePath = _T("");
		m_sFileUrl  = sFileUrl;
		m_bComplete = FALSE;
		m_bDelete   = bDelete;
	}
	~CFileDownloader ()
	{
		if ( m_pFile )
		{
			::fclose( m_pFile );
			m_pFile = NULL;
		}
		if ( m_sFilePath.GetLength() > 0 && m_bDelete )
		{
			DeleteFileW( m_sFilePath.GetBuffer() );
			m_sFilePath = _T("");
		}

	}


	CString GetFilePath()
	{
		return m_sFilePath;
	}
	BOOL    IsFileDownloaded()
	{
		return m_bComplete;
	}
protected :

	unsigned int DownloadFile(CString sFileUrl)
	{
		// ��������� ��������� ����������
		if ( FALSE == InternetGetConnectedState ( 0, 0 ) )
			return S_FALSE;

		char sTempPath[MAX_PATH], sTempFile[MAX_PATH];
		if ( 0 == GetTempPathA( MAX_PATH, sTempPath ) )
			return S_FALSE;

		if ( 0 == GetTempFileNameA( sTempPath, "CSS", 0, sTempFile ) )
			return S_FALSE;

		m_pFile = ::fopen( sTempFile, "wb" );
		if ( !m_pFile )
			return S_FALSE;

		m_sFilePath = CString( sTempFile );

		// ��������� ������
		HINTERNET hInternetSession = InternetOpen ( _T ("Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)"), INTERNET_OPEN_TYPE_PRECONFIG, NULL, NULL, 0 );
		if ( NULL == hInternetSession )
			return S_FALSE;

		// ��������� ������� ( ���� �������� 0 ���� ( ���������� ��� �������� ) )
		CString sHTTPHdr = _T ("Range: bytes=0-0");
		// ��������� ������ ��� �������� �� �� �������������, � ����� �� ����������� ������ �������
		HINTERNET hInternetOpenURL = InternetOpenUrl ( hInternetSession, sFileUrl, sHTTPHdr, -1, INTERNET_FLAG_RESYNCHRONIZE, 0 );
		if ( NULL != hInternetOpenURL )
		{
			// �������� ���������, ��������� �����
			if ( TRUE == QueryStatusCode ( hInternetOpenURL, TRUE ) )
			{
				// ������ ������ ������, ��������� ����������� ������ ������� � �������� ������ ������
				LONGLONG nFileSize = IsAccept_Ranges ( hInternetOpenURL );
				// ��������� �����
				InternetCloseHandle ( hInternetOpenURL );
				if ( -1 == nFileSize )
				{
					// ������ ������� ����������
					// ��������� ����� ����������
					InternetCloseHandle ( hInternetSession );
					// ��������� ���� (��������� �� DownloadAll)
					// ��������� �������� ��� �������
					return S_FALSE;
				}
				else
				{
					// ������ ������� ��������
					LONGLONG nStartByte = 0;
					while ( m_bRunThread )
					{
						// ���� �������� ���� ���� - �� �������
						if ( nStartByte == nFileSize - 1 )
						{
							// ��������� ����� ����������
							InternetCloseHandle ( hInternetSession );
							return S_OK;
						}
						LONGLONG nEndByte = nStartByte + DOWNLOAD_FILE_SIZE;
						// ���� ���� �������������, �� ��������� ������� ����������� ���� ( �� 1 ������, ��� ������, �.�. ���������� � 0 )
						if ( nEndByte >= nFileSize )
							nEndByte = nFileSize - 1;

						// ������ ��� �������
						BYTE arrBuffer [ DOWNLOAD_FILE_SIZE ] = { 0 };
						DWORD dwBytesDownload = DownloadFilePath ( hInternetSession, arrBuffer, nStartByte, nEndByte, sFileUrl );

						nStartByte = nEndByte;
						if ( -1 == dwBytesDownload )
						{
							// ������ �� ����������� - ��� �����!!!!
							// ��������� ����� ����������
							InternetCloseHandle ( hInternetSession );
							// ��������� ���� (��������� �� DownloadAll)
							// ��������� �������� ��� �������
							return S_FALSE;
						}

						// ����� � ����
						::fwrite( (BYTE*)arrBuffer, 1, dwBytesDownload, m_pFile );
						::fflush( m_pFile );
						// �������� �� ������������
						CheckSuspend ();
					}
				}
			}
			else
			{
				// ��������� ����� ����������
				InternetCloseHandle ( hInternetSession );
				// ��������� ���� (��������� �� DownloadAll)
				// ��������� �������� ��� �������
				return S_FALSE;
			}
		}
		else
		{
			// ��������� ����� ����������
			InternetCloseHandle ( hInternetSession );
			// ��������� ���� (��������� �� DownloadAll)
			// ��������� �������� ��� �������
			return S_FALSE;
		}

		// ��������� ����� ����������
		InternetCloseHandle ( hInternetSession );

		return S_OK;
	}
	DWORD DownloadFilePath ( HINTERNET hInternet, LPBYTE pBuffer, LONGLONG nStartByte, LONGLONG nEndByte, CString sFileURL )
	{
		// ���������� ������
		if ( NULL == hInternet )
			return -1;

		// ������ ���������� ���������
		if ( nStartByte > nEndByte || !pBuffer )
			return -1;

		// ��������� ������� ( �������� nEndByte - nStartByte ���� )
		CString sHTTPHdr = _T (""); sHTTPHdr.Format ( _T ("Range: bytes=%lld-%lld"), nStartByte, nEndByte );
		// ��������� ������ ��� �������
		HINTERNET hInternetOpenURL = InternetOpenUrl ( hInternet, sFileURL, sHTTPHdr, -1, INTERNET_FLAG_RESYNCHRONIZE, 0 );
		if ( NULL == hInternetOpenURL )
			return -1;
		// �������� ���������, ��������� �����
		if ( FALSE == QueryStatusCode ( hInternetOpenURL, TRUE ) )
		{
			// ��������� ����� ����������
			InternetCloseHandle ( hInternetOpenURL );
			return -1;
		}

		// ����� ����������� ���� ���������
		DWORD dwBytesRead = 0;
		// ������ ����
		if ( FALSE == InternetReadFile ( hInternetOpenURL, pBuffer, DOWNLOAD_FILE_SIZE, &dwBytesRead ) )
		{
			// ��������� ����� ����������
			InternetCloseHandle ( hInternetOpenURL );
			return -1;
		}

		// ��������� ����� ����������
		InternetCloseHandle ( hInternetOpenURL );

		return dwBytesRead;
	}
	virtual      DWORD ThreadProc ()
	{
		m_bComplete = FALSE;

		CoInitialize ( NULL );

		if ( S_OK != DownloadFile ( m_sFileUrl ) )
		{
			HRESULT hrResultAll = DownloadFileAll(m_sFileUrl, m_sFilePath);

			if (S_OK != hrResultAll)
			{
				m_bRunThread = FALSE;
				CoUninitialize ();
				return 0;
			}
		}

		m_bRunThread = FALSE;
		CoUninitialize ();

		m_bComplete = TRUE;
		return 0;
	}

	BOOL QueryStatusCode ( HINTERNET hInternet, BOOL bIsRanges )
	{
		// ����� ��������� � ���������� ������ ���-��
		if ( NULL == hInternet )
			return FALSE;

		// ��������� ������
		INT nResult = 0;
		// ������ ������ ������ ( ������ ���� = 4 )
		DWORD dwLengthDataSize = 4;

		// ������ ������, ���� �� �������� - �� ���������� FALSE
		if ( FALSE == HttpQueryInfo ( hInternet, HTTP_QUERY_STATUS_CODE | HTTP_QUERY_FLAG_NUMBER, &nResult, &dwLengthDataSize, NULL ) )
			return FALSE;

		// ������ ������, ������ ��������� ��� ������
		if ( HTTP_STATUS_NOT_FOUND == nResult )
		{
			// ������ �� ������, ������ ������ ��� ���-�� ���
			return FALSE;
		}
		else if ( ( HTTP_STATUS_OK != nResult && FALSE == bIsRanges ) || ( HTTP_STATUS_PARTIAL_CONTENT != nResult && TRUE == bIsRanges ) )
		{
			// ������ �� ������ �� �����-�� �������
			return FALSE;
		}

		// ��� �������, ������ ������
		return TRUE;
	}
	// ���������, �������� �� ��� ������� ������ ������� � ���������� -1 ���� �� �������� � ������ ������, ���� ��������
	LONGLONG IsAccept_Ranges ( HINTERNET hInternet )
	{
		// ����� ��������� � ���������� ������ ���-��
		if ( NULL == hInternet )
			return -1;

		// ��������� ������
		char arrResult [ MAX_SIZE ] = { 0 };
		// ������ ������ ������
		DWORD dwLengthDataSize = sizeof ( arrResult );

		// ������ ������, ���� �� �������� - �� ���������� FALSE
		if ( FALSE == HttpQueryInfoA ( hInternet, HTTP_QUERY_CONTENT_RANGE, &arrResult, &dwLengthDataSize, NULL ) )
		{
			// �������� ��������� ������
			DWORD dwLastError = GetLastError ();
			if ( dwLastError == ERROR_HTTP_HEADER_NOT_FOUND )
			{
				// �� ������ ���������, ������ ������ �� ������������ ������ �������
				return -1;
			}

			// �������� �����-�� ������ ������ - ���������� FALSE
			return -1;
		}

		// ���� ������ 0, �� ��������� ���
		if ( 0 >= dwLengthDataSize )
			return -1;

		// �������� � CString
		CString strResult ( arrResult );

		// �������� ������ ������
		LONGLONG nFileSize = 0;

		try
		{
			// ���� ������ ������� ������ � ������
			INT nStartIndex = strResult.Find ( CONTENT_RANGE );
			if ( -1 == nStartIndex )
				return -1;

			// ��������� � ������ ������ ������ ������
			strResult = strResult.Mid ( nStartIndex + CONTENT_RANGE_SIZE );
			// ������ ������� ������ ������, �������� ������ � LONGLONG
			nFileSize = _wtoi64 ( strResult.GetBuffer () );
			// �.�. ������� ��������� � 0 ( ������� ��������� ��� 1 ���� )
			if ( 0 < nFileSize )
				nFileSize += 1;
		}
		catch ( ... )
		{
			// �� ����� ���������� ������
			return -1;
		}

		// ��� �������, ������ ������������ ������ �������, ���������� ������
		return nFileSize;
	}

	HRESULT DownloadFileAll(CString sFileURL, CString strFileOutput)
	{
		if ( m_pFile )
		{
			::fclose( m_pFile );
			m_pFile = NULL;
		}
		// ��������� ����
		return URLDownloadToFile (NULL, sFileURL, strFileOutput, NULL, NULL);
	}

public:
	static bool IsNeedDownload(CString FilePath)
	{
		int n1 = FilePath.Find(_T("www."));
		int n2 = FilePath.Find(_T("http://"));
		int n3 = FilePath.Find(_T("ftp://"));
		int n4 = FilePath.Find(_T("https://"));

		if (((n1 >= 0) && (n1 < 10)) || ((n2 >= 0) && (n2 < 10)) || ((n3 >= 0) && (n3 < 10)) || ((n4 >= 0) && (n4 < 10)))
			return true;
		return false;
	}

protected :

	FILE    *m_pFile;           // ����� �� ��������� ����
	CString  m_sFilePath;       // ���� � ������������ ����� �� �����
	CString  m_sFileUrl;        // ������ �� ���������� �����

	BOOL     m_bComplete;       // ��������� ���� ��� ���
	BOOL     m_bDelete;         // ������� �� ���� � �����������

};
#else

// not win32
//#include <boost/network/protocol/http/client.hpp>
#include <iostream>
#include <unistd.h>
#include "./DocxFormat/Source/Base/ASCString.h"
#include "./DocxFormat/Source/SystemUtility/FileSystem/Directory.h"

#include<fcntl.h>
#include <string>

#include <stdio.h>

#if defined(__APPLE__)
#include "/usr/include/curl/curl.h"
#include "/usr/include/curl/easy.h"
#else
#include "3dParty/curl/include/curl/curl.h"
#include "3dParty/curl/include/curl/easy.h"
#endif

static void Sleep (unsigned int mSec)
{
    usleep(1000 * mSec);
}

class CFileDownloader
{
public :

    CFileDownloader (CString sFileUrl, BOOL bDelete = TRUE)
    {

        char filename[L_tmpnam];
        std::tmpnam(filename);

        m_sFilePath;
        m_sFileUrl  = sFileUrl;
        m_bComplete = FALSE;
        m_bDelete   = bDelete;
    }
    ~CFileDownloader ()
    {
        if (m_bDelete && !m_sFilePath.IsEmpty())
            unlink(stringWstingToUtf8String (m_sFilePath).c_str());
    }

    static size_t write_data(void *ptr, size_t size, size_t nmemb, int fd) {
        size_t written = write(fd, ptr, size * nmemb);
        return written;
    }


    void Start (int n)
    {
        CURL *curl;
           int fp;
           CURLcode res;
           std::string sUrl = stringWstingToUtf8String (m_sFileUrl);
           std::string sOut;
           const char *url = sUrl.c_str();
           curl = curl_easy_init();
           if (curl) {
               fp = createUniqueTempFile(sOut);
               curl_easy_setopt(curl, CURLOPT_URL, url);
               curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
               curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
#if defined(__linux__)
               //� linux ��� ���������� � ������� �������� ������������, ������� ��������� ��������
               //http://curl.haxx.se/docs/sslcerts.html
               curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
#endif
               /* some servers don't like requests that are made without a user-agent field, so we provide one */
               curl_easy_setopt(curl, CURLOPT_USERAGENT, "libcurl-agent/1.0");
               res = curl_easy_perform(curl);
               /* always cleanup */
               curl_easy_cleanup(curl);
               close(fp);
           }

           m_bComplete = CURLE_OK == res;
           if (m_bComplete)
               m_sFilePath = sOut;
        //int nRes = execl("/usr/bin/wget", stringWstingToUtf8String (m_sFileUrl).c_str(), "-P", stringWstingToUtf8String (m_sFilePath).c_str(), (char *)NULL);
        //m_bComplete = nRes >= 0;
    }

    bool IsRunned()
    {
        return false;
    }

    CString GetFilePath()
    {
        return m_sFilePath;
    }
    BOOL    IsFileDownloaded()
    {
        return m_bComplete;
    }
protected :

    unsigned int DownloadFile(CString sFileUrl)
    {
        return S_OK;
    }


    int createUniqueTempFile (std::string &filename)
    {
        std::string sTempPath = stringWstingToUtf8String (FileSystem::Directory::GetTempPath());
        sTempPath += "/fileXXXXXX";
        int fd = mkstemp(const_cast <char *> (sTempPath.c_str()));
        if (-1 != fd)
            filename = sTempPath;
        return fd;
    }



public:
    static bool IsNeedDownload(CString FilePath)
    {
        int n1 = FilePath.Find(_T("www."));
        int n2 = FilePath.Find(_T("http://"));
        int n3 = FilePath.Find(_T("ftp://"));
        int n4 = FilePath.Find(_T("https://"));

        if (((n1 >= 0) && (n1 < 10)) || ((n2 >= 0) && (n2 < 10)) || ((n3 >= 0) && (n3 < 10)) || ((n4 >= 0) && (n4 < 10)))
            return true;
        return false;
    }
protected :

    CString  m_sFilePath;       // ���� � ������������ ����� �� �����
    CString  m_sFileUrl;        // ������ �� ���������� �����

    BOOL     m_bComplete;       // ��������� ���� ��� ���
    BOOL     m_bDelete;         // ������� �� ���� � �����������

};

#endif