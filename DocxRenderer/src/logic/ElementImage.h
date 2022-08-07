﻿#pragma once
#include "BaseItem.h"
#include "ImageManager.h"

namespace NSDocxRenderer
{
    class CImage : public CBaseItem
	{
	public:
         CImageInfo m_oImageInfo;

         std::wstring m_strPath {L""};

         bool m_bIsNoFill {true};
         bool m_bIsNoStroke {true};
         bool m_bIsBehindDoc {true};

         double m_dRotate {0.0};

	public:
        CImage();
        CImage(const CImage& oSrc);
        CImage(const CImageInfo& oInfo, const std::wstring& strDstMedia);
        void Clear() override final;

        CImage& operator=(const CImage& oSrc);
        void ToXml(NSStringUtils::CStringBuilder& oWriter) override final;
	};
}
