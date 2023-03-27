﻿/*
 * (c) Copyright Ascensio System SIA 2010-2023
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
 * You can contact Ascensio System SIA at 20A-6 Ernesta Birznieka-Upish
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

#include  "../../../../../ASCOfficeXlsFile2/source/XlsFormat/Logic/Biff_structures/BiffAttribute.h"

namespace XLSB
{

class DataConsolidationFunction : public XLS::BiffAttributeSimple<_UINT32>
{
public:
        XLS::BiffStructurePtr clone();
		DataConsolidationFunction& operator= (const _UINT32& other_val);
	enum
	{
            SUM              = 0x00000000,
            COUNT            = 0x00000001,
            AVERAGE          = 0x00000002,
            MAX              = 0x00000003,
            MIN              = 0x00000004,
            PRODUCT          = 0x00000005,
            COUNTNUM         = 0x00000006,
            STDDEV           = 0x00000007,
            STDDEVP          = 0x00000008,
            STDVAR           = 0x00000009,
            STDVARP          = 0x0000000A
	};
};

} // namespace XLS

