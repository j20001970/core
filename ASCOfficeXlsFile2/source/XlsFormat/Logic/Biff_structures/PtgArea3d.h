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

#include "OperandPtg.h"
#include "CellRangeRef.h"
#include "Logic/GlobalWorkbookInfo.h"
#include "../../../../../Common/DocxFormat/Source/XlsbFormat/Biff12_structures/CellRangeRef.h"

namespace XLS
{

class CFRecord;

class PtgArea3d: public OperandPtg
{
	BASE_STRUCTURE_DEFINE_CLASS_NAME(PtgArea3d)
public:
	PtgArea3d(const unsigned short full_ptg_id, const CellRef& cell_base_ref_init);
	PtgArea3d(const unsigned short ixti, const std::wstring& word, const PtgDataType data_type, const CellRef& cell_base_ref_init);
	
	void set_base_ref(const CellRef& cell_base_ref);
	
	BiffStructurePtr clone();

	virtual void loadFields(CFRecord& record);
	
	virtual void assemble(AssemblerStack& ptg_stack, PtgQueue& extra_data, bool full_ref = false);
	static const unsigned short fixed_id = 0x1B;

	GlobalWorkbookInfoPtr	global_info;

//biff8
	unsigned short			ixti;
	RgceAreaRel				area_rel;
	RgceArea				area;
	CellRef					cell_base_ref;
//biff5
	unsigned short			ixals;
	unsigned short			itabFirst;
	unsigned short			itabLast;
//biff12
    XLSB::RgceArea          areaXlsb;
};

} // namespace XLS

