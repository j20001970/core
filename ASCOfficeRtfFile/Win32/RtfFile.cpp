// RtfFile.cpp : Implementation of CRtfFile

#include "stdafx.h"

#include "RtfFile.h"
#include "../../Common/OfficeFileErrorDescription.h"

#include "../RtfFormatLib/source/ConvertationManager.h"
#include "../RtfFormatLib/source/Basic.h"

#include "../../Common/DocxFormat/Source/SystemUtility/File.h"

// CRtfFile
STDMETHODIMP CRtfFile::LoadFromFile(BSTR sSrcFileName, BSTR sDstPath, BSTR sXMLOptions)
{
	CString sFilename( sSrcFileName );
	//проверяем входной файл на rtf
	long nError;
	if( FALSE == IsRtfFile( sFilename, nError ) )
	{
		if( NOERROR == nError )
			return AVS_ERROR_FILEFORMAT;
		else
			return nError;
	}

	//проверяем существует ли папка
	DWORD dwDirectoryAttribute = ::GetFileAttributes( sDstPath );
	if( 0 == ( dwDirectoryAttribute & FILE_ATTRIBUTE_DIRECTORY ) )
		return AVS_ERROR_FILEACCESS;
	
	//конвертация
	RtfConvertationManager oConvertationManager;
	
	return oConvertationManager.ConvertRtfToOOX( std::wstring( sSrcFileName ), std::wstring( sDstPath ) );
}


STDMETHODIMP CRtfFile::SaveToFile(BSTR sDstFileName, BSTR sSrcPath, BSTR sXMLOptions)
{
	//проверяем доступен ли для записи файл
	HANDLE hFile = CreateFile (sDstFileName, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL );
	if ( INVALID_HANDLE_VALUE == hFile )
		return AVS_ERROR_FILEACCESS;
	CloseHandle( hFile );

	//проверяем существует ли папка
	DWORD dwDirectoryAttribute = ::GetFileAttributes( sSrcPath );
	if( 0 == ( dwDirectoryAttribute & FILE_ATTRIBUTE_DIRECTORY ) )
		return AVS_ERROR_FILEACCESS;
	
	//конвертация
	RtfConvertationManager oConvertationManager;

	oConvertationManager.ConvertOOXToRtf( std::wstring( sDstFileName ), std::wstring( sSrcPath)  );
	return S_OK;
}

bool CRtfFile::IsRtfFile(CString sFilename, long& nError )
{
	nError = NOERROR;
    BYTE    pBuffer[ 5 ];
    DWORD    dwBytesRead;

	CFile file;

	if (file.OpenFile(sFilename) != S_OK) return false;

	file.ReadFile(pBuffer, 5);
	file.CloseFile();

	if( 5 == dwBytesRead && '{' == pBuffer[0] && '\\' == pBuffer[1] && 'r' == pBuffer[2] && 't' == pBuffer[3] && 'f' == pBuffer[4] )
		return true;

	return false;
}
