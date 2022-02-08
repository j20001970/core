﻿/*
 * (c) Copyright Ascensio System SIA 2010-2019
 *
 * This program is a free software product. You can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License (AGPL)
 * version 3 as published by the Free Software Foundation. In accordance with
 * Section 7(a) of the GNU AGPL its Section 15 shall be amended to the effect
 * that Ascensio System SIA expressly excludes the warranty of non-infringement
 * of any third-party rights.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR  PURPOSE. For
 * details, see the GNU AGPL at: http://www.gnu.org/licenses/agpl-3.0.html
 *
 * You can contact Ascensio System SIA at 20A-12 Ernesta Birznieka-Upisha
 * street, Riga, Latvia, EU, LV-1050.
 *
 * The  interactive user interfaces in modified source and object code versions
 * of the Program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU AGPL version 3.
 *
 * Pursuant to Section 7(b) of the License you must retain the original Product
 * logo when distributing the program. Pursuant to Section 7(e) we decline to
 * grant you any rights under trademark law for use of our trademarks.
 *
 * All the Product's GUI elements, including illustrations and icon sets, as
 * well as technical writing content are licensed under the terms of the
 * Creative Commons Attribution-ShareAlike 4.0 International. See the License
 * terms at http://creativecommons.org/licenses/by-sa/4.0/legalcode
 *
 */
#pragma once

#include "./../WrapperWritingElement.h"
#include "./../Logic/NvGrpSpPr.h"
#include "./../Logic/GrpSpPr.h"
#include "SpTreeElem.h"

#include "../../../DesktopEditor/graphics/aggplustypes.h"

namespace PPTX
{
	namespace Logic
	{
		class SpTree : public WrapperWritingElement
		{
		public:
			WritingElement_AdditionConstructors(SpTree)

			SpTree(std::wstring ns = L"p") : nvGrpSpPr(ns), grpSpPr(ns)
			{
				m_namespace		= ns;
				m_lGroupIndex	= 0;
			}

			SpTree& operator=(const SpTree& oSrc)
			{
				parentFile		= oSrc.parentFile;
				parentElement	= oSrc.parentElement;

				nvGrpSpPr	= oSrc.nvGrpSpPr;
				grpSpPr		= oSrc.grpSpPr;

				for (size_t i=0; i < oSrc.SpTreeElems.size(); i++)
					SpTreeElems.push_back(oSrc.SpTreeElems[i]);

				m_namespace		= oSrc.m_namespace;
				m_lGroupIndex	= oSrc.m_lGroupIndex;

				return *this;
			}
			virtual OOX::EElementType getType () const
			{
				return OOX::et_p_ShapeTree;
			}
			virtual void fromXML(XmlUtils::CXmlLiteReader& oReader);
			virtual void fromXML(XmlUtils::CXmlNode& node);
			virtual std::wstring toXML() const;

			void toXmlWriterVML(NSBinPptxRW::CXmlWriter* pWriter, smart_ptr<PPTX::Theme>& oTheme, smart_ptr<PPTX::Logic::ClrMap>& oClrMap, const WCHAR* pId = NULL, bool in_group = false);

			virtual void toXmlWriter(NSBinPptxRW::CXmlWriter* pWriter) const;

			void NormalizeRect(Aggplus::RECT& rect)const;

			virtual void toPPTY(NSBinPptxRW::CBinaryFileWriter* pWriter) const;
			virtual void fromPPTY(NSBinPptxRW::CBinaryFileReader* pReader);

		public:
			Logic::NvGrpSpPr		nvGrpSpPr;
			Logic::GrpSpPr			grpSpPr;
			std::vector<SpTreeElem>	SpTreeElems;

			std::wstring			m_namespace;
			int						m_lGroupIndex;
		protected:
			virtual void FillParentPointersForChilds()
			{
				nvGrpSpPr.SetParentPointer(this);
				grpSpPr.SetParentPointer(this);

				for (size_t i = 0; i < SpTreeElems.size(); ++i)
					SpTreeElems[i].SetParentPointer(this);
			}
		};
		class LockedCanvas : public SpTree
		{
		public:
			WritingElement_AdditionConstructors(LockedCanvas)

			LockedCanvas() : SpTree(L"a") 
			{
			}

			LockedCanvas& operator=(const LockedCanvas& oSrc)
			{
				parentFile		= oSrc.parentFile;
				parentElement	= oSrc.parentElement;

				nvGrpSpPr	= oSrc.nvGrpSpPr;
				grpSpPr		= oSrc.grpSpPr;

				for (size_t i=0; i < oSrc.SpTreeElems.size(); i++)
					SpTreeElems.push_back(oSrc.SpTreeElems[i]);

				m_lGroupIndex	= oSrc.m_lGroupIndex;

				return *this;
			}
			virtual OOX::EElementType getType () const
			{
				return OOX::et_lc_LockedCanvas;
			}
			virtual void fromXML(XmlUtils::CXmlLiteReader& oReader)
			{
				SpTree::fromXML(oReader);
			}

			virtual void fromXML(XmlUtils::CXmlNode& node)
			{
				SpTree::fromXML(node);
			}

			virtual std::wstring toXML() const
			{
				XmlUtils::CAttribute oAttr;
				oAttr.Write(L"xmlns:lc", L"http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas");

				XmlUtils::CNodeValue oValue;
				oValue.Write(nvGrpSpPr);
				oValue.Write(grpSpPr);
				
				oValue.WriteArray(SpTreeElems);

				return XmlUtils::CreateNode(L"lc:lockedCanvas", oAttr, oValue);
			}

			virtual void toXmlWriter(NSBinPptxRW::CXmlWriter* pWriter) const
			{
				BYTE lDocType = pWriter->m_lDocType;
				pWriter->m_lDocType = XMLWRITER_DOC_TYPE_GRAPHICS;

				pWriter->StartNode(L"lc:lockedCanvas");
				pWriter->StartAttributes();
				pWriter->WriteAttribute(L"xmlns:lc", L"http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas");

				pWriter->EndAttributes();

				nvGrpSpPr.toXmlWriter(pWriter);
				
				grpSpPr.toXmlWriter(pWriter);
				
				pWriter->m_lGroupIndex++;

				for (size_t i = 0; i < SpTreeElems.size(); ++i)
				{
					SpTreeElems[i].toXmlWriter(pWriter);
				}

				pWriter->m_lGroupIndex--;

				pWriter->EndNode(L"lc:lockedCanvas");

				pWriter->m_lDocType = lDocType;
			}
 			virtual void toPPTY(NSBinPptxRW::CBinaryFileWriter* pWriter) const
			{
				BinDocxRW::CDocxSerializer* docx = pWriter->m_pMainDocument;
				pWriter->m_pMainDocument = NULL;
				
				pWriter->StartRecord(SPTREE_TYPE_LOCKED_CANVAS);

				pWriter->WriteRecord1(0, nvGrpSpPr);
				pWriter->WriteRecord1(1, grpSpPr);
				pWriter->WriteRecordArray(2, 0, SpTreeElems);

				pWriter->EndRecord();
				pWriter->m_pMainDocument = docx;
			}
			virtual void fromPPTY(NSBinPptxRW::CBinaryFileReader* pReader)
			{
				LONG _end_rec = pReader->GetPos() + pReader->GetRecordSize() + 4;

				pReader->Skip(5); // type + len

				BinDocxRW::CDocxSerializer* docx = pReader->m_pMainDocument;
				pReader->m_pMainDocument = NULL;

				while (pReader->GetPos() < _end_rec)
				{
					BYTE _at = pReader->GetUChar();
					switch (_at)
					{
						case 0:
						{
							nvGrpSpPr.fromPPTY(pReader);
							break;
						}
						case 1:
						{
							grpSpPr.fromPPTY(pReader);
							break;
						}
						case 2:
						{
							pReader->Skip(4); // len
							ULONG _c = pReader->GetULong();

							for (ULONG i = 0; i < _c; ++i)
							{
								pReader->Skip(1); // type (0)
								LONG nElemLength = pReader->GetLong(); // len
								//SpTreeElem::fromPPTY сразу делает GetChar, а toPPTY ничего не пишет если не инициализирован
								if(nElemLength > 0)
								{
									SpTreeElem elm;
									elm.fromPPTY(pReader);

                                    if (elm.is_init())
									{
										if (elm.getType() == OOX::et_p_ShapeTree)
										{
                                            smart_ptr<SpTree> e = elm.GetElem().smart_dynamic_cast<SpTree>();
											e->m_lGroupIndex = m_lGroupIndex + 1;
										}
										SpTreeElems.push_back(elm);
									}
								}
							}
						}
						default:
						{
							break;
						}
					}				
				}
				pReader->Seek(_end_rec);
				pReader->m_pMainDocument = docx;
			}

		};
	} // namespace Logic
} // namespace PPTX

