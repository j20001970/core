﻿#pragma once
#ifndef PPTX_LOGIC_CXNSP_INCLUDE_H_
#define PPTX_LOGIC_CXNSP_INCLUDE_H_

#include "./../WrapperWritingElement.h"
#include "NvCxnSpPr.h"
#include "SpPr.h"
#include "ShapeStyle.h"


namespace PPTX
{
	namespace Logic
	{
		class CxnSp : public WrapperWritingElement
		{
		public:
			CxnSp();
			virtual ~CxnSp();			
			explicit CxnSp(XmlUtils::CXmlNode& node);
			const CxnSp& operator =(XmlUtils::CXmlNode& node);

		public:
			virtual void fromXML(XmlUtils::CXmlNode& node);
			virtual CString toXML() const;
			virtual void GetRect(Aggplus::RECT& pRect)const;

			DWORD GetLine(Ln& line)const;
			DWORD GetFill(UniFill& fill)const;

			virtual void toPPTY(NSBinPptxRW::CBinaryFileWriter* pWriter) const
			{
				pWriter->StartRecord(SPTREE_TYPE_CXNSP);

				pWriter->WriteRecord1(0, nvCxnSpPr);
				pWriter->WriteRecord1(1, spPr);
				pWriter->WriteRecord2(2, style);

				pWriter->EndRecord();
			}

			virtual void toXmlWriter(NSBinPptxRW::CXmlWriter* pWriter) const
			{
                if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_DOCX)
                    pWriter->StartNode(_T("wps:cxnSp"));
                else if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_XLSX)
                    pWriter->StartNode(_T("xdr:cxnSp"));
                else
                    pWriter->StartNode(_T("p:cxnSp"));

                pWriter->EndAttributes();

                nvCxnSpPr.toXmlWriter(pWriter);
                spPr.toXmlWriter(pWriter);

                if (style.is_init())
                {
                    if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_DOCX)
                        style->m_ns = _T("wps");
                    else if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_XLSX)
                        style->m_ns = _T("xdr");

                    pWriter->Write(style);
                }

                if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_DOCX)
                    pWriter->EndNode(_T("wps:cxnSp"));
                else if (pWriter->m_lDocType == XMLWRITER_DOC_TYPE_XLSX)
                    pWriter->EndNode(_T("xdr:cxnSp"));
                else
                     pWriter->EndNode(_T("p:cxnSp"));
			}

			virtual void fromPPTY(NSBinPptxRW::CBinaryFileReader* pReader)
			{
				LONG _end_rec = pReader->GetPos() + pReader->GetLong() + 4;

				while (pReader->GetPos() < _end_rec)
				{
					BYTE _at = pReader->GetUChar();
					switch (_at)
					{
						case 0:
						{
							nvCxnSpPr.fromPPTY(pReader);
							break;
						}
						case 1:
						{
							spPr.fromPPTY(pReader);
							break;
						}
						case 2:
						{
							style = new ShapeStyle();
							style->m_ns = _T("p");
							style->fromPPTY(pReader);
							break;
						}
						default:
						{
							break;
						}
					}
				}

				pReader->Seek(_end_rec);
			}

		public:
			NvCxnSpPr				nvCxnSpPr;
			SpPr					spPr;
			nullable<ShapeStyle>	style;
		protected:
			virtual void FillParentPointersForChilds();
		};
	} // namespace Logic
} // namespace PPTX

#endif // PPTX_LOGIC_CXNSP_INCLUDE_H