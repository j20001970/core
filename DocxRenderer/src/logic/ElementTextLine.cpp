#include "ElementTextLine.h"
#include "../resources/Constants.h"
#include "../resources/SortElements.h"

namespace NSDocxRenderer
{
    CTextLine::CTextLine() : CBaseItem(ElemType::etTextLine)
    {
    }

    void CTextLine::Clear()
    {
        for (auto pCont : m_arConts)
        {
            RELEASEOBJECT(pCont);
        }
        m_arConts.clear();
    }

    CTextLine::~CTextLine()
    {
        Clear();
    }

    CTextLine::CTextLine(const CTextLine& oSrc) : CBaseItem(ElemType::etTextLine), m_arConts()
    {
        *this = oSrc;
    }

    CTextLine& CTextLine::operator=(const CTextLine& oSrc)
    {
        if (this == &oSrc)
        {
            return *this;
        }

        Clear();

        CBaseItem::operator=(oSrc);

        for (auto pCont : oSrc.m_arConts)
        {
            m_arConts.push_back(new CContText(*pCont));
        }

        m_dBaselineOffset = oSrc.m_dBaselineOffset;

        m_eAlignmentType  = oSrc.m_eAlignmentType;
        m_eVertAlignType  = oSrc.m_eVertAlignType;

        m_pDominantShape  = oSrc.m_pDominantShape;
#if USING_DELETE_DUPLICATING_CONTS == 0
        m_pDuplicateLine  = oSrc.m_pDuplicateLine;
#endif
        return *this;
    }

    void CTextLine::AddCont(CContText* pCont)
    {
        m_dBaselineOffset = fabs(m_dBaselineOffset) > fabs(pCont->m_dBaselineOffset) ? m_dBaselineOffset : pCont->m_dBaselineOffset;

        m_dBaselinePos = std::max(m_dBaselinePos, pCont->m_dBaselinePos);

        if ( ( pCont->m_dLeft > 0 ) && ( ( m_dLeft == 0 ) || ( pCont->m_dLeft < m_dLeft ) ) )
            m_dLeft = pCont->m_dLeft;

        if (m_dHeight < pCont->m_dHeight)
            m_dHeight = pCont->m_dHeight;

        if (m_dTop > pCont->m_dTop || m_dTop == 0.0)
            m_dTop = pCont->m_dTop;

        if (pCont->m_pCont && m_eVertAlignType == eVertAlignType::vatUnknown)
        {
            m_eVertAlignType = pCont->m_eVertAlignType;
        }

        m_arConts.push_back(pCont);
    }

    bool CTextLine::IsBigger(const CBaseItem* oSrc)
    {
        return (m_dBaselinePos > dynamic_cast<const CTextLine*>(oSrc)->m_dBaselinePos) ? true : false;
    }

    bool CTextLine::IsBiggerOrEqual(const CBaseItem* oSrc)
    {
        return (m_dBaselinePos >= dynamic_cast<const CTextLine*>(oSrc)->m_dBaselinePos) ? true : false;
    }

    void CTextLine::SortConts()
    {
        // сортировка непрерывных слов по m_dX
        SortElements(m_arConts);
    }

    void CTextLine::Merge(const CTextLine* pTextLine)
    {
        size_t nCount = pTextLine->m_arConts.size();
        if (0 != nCount)
        {
            if (pTextLine->m_dLeft < m_dLeft)
            {
                m_dLeft = pTextLine->m_dLeft;
            }
            if (pTextLine->m_dBaselinePos < m_dBaselinePos)
            {
                m_dHeight = (m_dBaselinePos - pTextLine->m_dBaselinePos + pTextLine->m_dHeight);
            }
            else
            {
                m_dHeight = (pTextLine->m_dBaselinePos - m_dBaselinePos + m_dHeight);
            }

            for (auto pCont : pTextLine->m_arConts)
            {
                m_arConts.push_back(new CContText(*pCont));
            }

            SortConts();
            CalculateWidth();
        }
    }

    void CTextLine::Analyze()
    {
        size_t nCountConts = m_arConts.size();

        if (0 == nCountConts)
            return;

        CContText* pFirst = m_arConts[0];

        for (size_t i = 1; i < nCountConts; ++i)
        {
            CContText* pCurrent = m_arConts[i];

            double dFirstRight = pFirst->m_dLeft + pFirst->m_dLeft;
            double dCurrLeft = pCurrent->m_dLeft;
            double dDelta = dFirstRight - dCurrLeft;

            if (!pFirst->IsEqual(pCurrent) ||
                fabs(dDelta) > c_dTHE_STRING_X_PRECISION_MM)
            {
                if (i < nCountConts - 1)
                {
                    //переходим на
                    pFirst = pCurrent;
                }
                continue;
            }

            // продолжаем слово
            pFirst->m_oText += pCurrent->m_oText;
            pFirst->m_dWidth += pCurrent->m_dWidth + fabs(dDelta);

            m_arConts.erase(m_arConts.begin() + i);
            --i;
            --nCountConts;
        }
    }

    void CTextLine::CalculateWidth()
    {
        if (m_arConts.empty())
        {
            return;
        }

        m_dWidth = m_arConts[0]->m_dWidth;

        for (size_t i = 1; i < m_arConts.size(); ++i)
        {
            m_dWidth += m_arConts[i]->m_dLeft - (m_arConts[i-1]->m_dLeft + m_arConts[i-1]->m_dWidth);
            m_dWidth += m_arConts[i]->m_dWidth;
        }

        m_dRight = m_dLeft + m_dWidth;
    }

    void CTextLine::AddSpaceToEnd()
    {
        if (m_arConts.empty())
        {
            return;
        }

        CContText* pCurrent = m_arConts.back();

        if (pCurrent->m_oText[pCurrent->m_oText.length()-1] != uint32_t(' '))
        {
            pCurrent->AddSpaceToEnd();
            m_dWidth += pCurrent->m_dSpaceWidthMM;
        }
    }

    void CTextLine::DetermineAssumedTextAlignmentType(double dWidthOfPage)
    {
        //рассматриваем строки, которые короче трети ширины страницы
        double maxTextLineWidth = dWidthOfPage/3; //нужна какая-нибудь отправная точка...
        double delta = 2 * c_dCENTER_POSITION_ERROR_MM; //координата m_dWidth/2 +- c_dCENTER_POSITION_ERROR_MM

        if (fabs(dWidthOfPage/2 - m_dLeft - m_dWidth/2) <= delta && //если середины линий по x одинаковы
                m_dWidth < maxTextLineWidth )
        {
            m_eAlignmentType = atatByCenter;
        }
        else if ((m_dLeft + m_dWidth/2) > (dWidthOfPage/2 + c_dCENTER_POSITION_ERROR_MM) && //середина строки правее центра страницы
                 m_dWidth < maxTextLineWidth)
        {
            m_eAlignmentType = atatByRightEdge;
        }
        else if ((m_dLeft + m_dWidth/2) < (dWidthOfPage/2 - c_dCENTER_POSITION_ERROR_MM) && //середина строки левее центра страницы
                 m_dWidth < maxTextLineWidth)
        {
            m_eAlignmentType = atatByLeftEdge;
        }
        else if (fabs(dWidthOfPage/2 - m_dLeft - m_dWidth/2) <= delta &&
                 m_dWidth > maxTextLineWidth + maxTextLineWidth/2 )
        {
            m_eAlignmentType = atatByWidth;
        }
        else
        {
            m_eAlignmentType = atatUnknown;
        }
    }

    bool CTextLine::AreAlignmentsAppropriate(const CTextLine* oSrc)
    {
        if ((m_eAlignmentType == oSrc->m_eAlignmentType && m_eAlignmentType!= atatByLeftEdge) ||
            (m_eAlignmentType == atatByWidth && oSrc->m_eAlignmentType == atatByLeftEdge) ||
            (m_eAlignmentType == atatByWidth && oSrc->m_eAlignmentType == atatUnknown) ||
            (m_eAlignmentType == atatUnknown && oSrc->m_eAlignmentType == atatByWidth))
        {
            return true;
        }
        return false;
    }

    void CTextLine::SetVertAlignType(const eVertAlignType& oType)
    {
        for (auto pCont : m_arConts)
        {
            pCont->m_eVertAlignType = oType;
        }
    }

    double CTextLine::CalculateBeforeSpacing(const double* pPreviousStringOffset)
    {
        return m_dBaselinePos - *pPreviousStringOffset - m_dHeight - m_dBaselineOffset;
    }

    double CTextLine::CalculateStringOffset()
    {
        return m_dBaselinePos - m_dBaselineOffset;
    }

    double CTextLine::CalculateRightBorder(const double& dPageWidth)
    {
        return dPageWidth - (m_dLeft + m_dWidth);
    }

    bool CTextLine::IsForceBlock()
    {
        // линия отсортирована, так что сравниваем только соседние conts
        size_t nCount = m_arConts.size();
        if (nCount <= 1)
            return false;

        for (size_t i = 0; i < nCount; i++)
        {
            for (size_t j = i + 1; j < nCount; j++)
            {
                if (m_arConts[i]->GetIntersect(m_arConts[j]) > 10)
                    return true;
            }
        }
        return false;
    }

    double CTextLine::RightBorderCorrection()
    {
        CContText* pSelectedCont = nullptr;

        for (auto pCont : m_arConts)
        {
            if (!pSelectedCont || pSelectedCont->m_oFont.Size < pCont->m_oFont.Size)
            {
                pSelectedCont = pCont;
            }
            else if (pSelectedCont->m_oFont.Size == pCont->m_oFont.Size)
            {
                //note считаем что обычный < Italic < Bold < Bold-Italic
                if (pSelectedCont->m_oFont.GetTextFontStyle() <
                        pCont->m_oFont.GetTextFontStyle())
                {
                    pSelectedCont = pCont;
                }
            }
        }

        if (!pSelectedCont)
        {
            return c_dRightBorderCorrectionSize[0][0];
        }

        UINT lSize = static_cast<UINT>(2 * pSelectedCont->m_oFont.Size);
        UINT nType = pSelectedCont->m_oFont.GetTextFontStyle();

        if (nType > 3)
        {
            //Error!
            return c_dRightBorderCorrectionSize[0][0];
        }

        if (lSize > 144)
        {
            lSize = 145;
        }

        //note нужно корректировать каждый размер отдельно
        return c_dRightBorderCorrectionSize[lSize][nType];
    }

    void CTextLine::ToXml(NSStringUtils::CStringBuilder& oWriter)
    {
        if (m_bIsNotNecessaryToUse)
        {
            return;
        }

        size_t nCountConts = m_arConts.size();

        if (0 == nCountConts)
            return;

        CContText* pPrev = m_arConts[0];
        double dDelta = 0;

        for (size_t i = 1; i < nCountConts; ++i)
        {
            CContText* pCurrent = m_arConts[i];

            dDelta = pCurrent->m_dLeft - (pPrev->m_dLeft + pPrev->m_dWidth);

            if (dDelta < c_dTHE_STRING_X_PRECISION_MM)
            {
                // просто текст на тексте или сменились настройки (font/brush)
                pPrev->ToXml(oWriter);
                pPrev = pCurrent;
            }
            else
            {
                // расстояние слишком большое. нужно сделать большой пробел
                pPrev->ToXml(oWriter);
                pPrev->AddWideSpaceToXml(dDelta, oWriter, pPrev->IsEqual(pCurrent));
                pPrev = pCurrent;
            }
        }

        pPrev->ToXml(oWriter);
    }
}
