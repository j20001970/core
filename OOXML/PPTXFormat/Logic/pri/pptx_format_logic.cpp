/*
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

#include "../Media/WavAudioFile.cpp"
#include "../Media/AudioCD.cpp"
#include "../Media/MediaFile.cpp"

#include "../Path2D/ArcTo.cpp"
#include "../Path2D/Close.cpp"
#include "../Path2D/CubicBezTo.cpp"
#include "../Path2D/LineTo.cpp"
#include "../Path2D/MoveTo.cpp"
#include "../Path2D/PathBase.cpp"
#include "../Path2D/QuadBezTo.cpp"

#include "../Colors/SchemeClr.cpp"
#include "../Colors/ColorBase.cpp"
#include "../Colors/ColorModifier.cpp"
#include "../Colors/PrstClr.cpp"
#include "../Colors/SrgbClr.cpp"
#include "../Colors/SysClr.cpp"

#include "../Fills/Blip.cpp"
#include "../Fills/BlipFill.cpp"
#include "../Fills/GradFill.cpp"
#include "../Fills/NoFill.cpp"
#include "../Fills/PattFill.cpp"
#include "../Fills/SolidFill.cpp"
#include "../Fills/Stretch.cpp"
#include "../Fills/Tile.cpp"

#include "../Table/TableCell.cpp"
#include "../Table/Table.cpp"
#include "../Table/TableCellProperties.cpp"
#include "../Table/TableCol.cpp"
#include "../Table/TableProperties.cpp"
#include "../Table/TableRow.cpp"

#include "../Timing/BuildNodeBase.cpp"
#include "../Timing/TimeNodeBase.cpp"
#include "../Timing/Anim.cpp"
#include "../Timing/AnimClr.cpp"
#include "../Timing/AnimEffect.cpp"
#include "../Timing/AnimMotion.cpp"
#include "../Timing/AnimRot.cpp"
#include "../Timing/AnimScale.cpp"
#include "../Timing/AnimVariant.cpp"
#include "../Timing/AttrName.cpp"
#include "../Timing/AttrNameLst.cpp"
#include "../Timing/Audio.cpp"
#include "../Timing/BldDgm.cpp"
#include "../Timing/BldGraphic.cpp"
#include "../Timing/BldLst.cpp"
#include "../Timing/BldOleChart.cpp"
#include "../Timing/BldP.cpp"
#include "../Timing/BldSub.cpp"
#include "../Timing/CBhvr.cpp"
#include "../Timing/ChildTnLst.cpp"
#include "../Timing/Cmd.cpp"
#include "../Timing/CMediaNode.cpp"
#include "../Timing/Cond.cpp"
#include "../Timing/CondLst.cpp"
#include "../Timing/CTn.cpp"
#include "../Timing/Excl.cpp"
#include "../Timing/GraphicEl.cpp"
#include "../Timing/Iterate.cpp"
#include "../Timing/Par.cpp"
#include "../Timing/Seq.cpp"
#include "../Timing/Set.cpp"
#include "../Timing/SpTgt.cpp"
#include "../Timing/Tav.cpp"
#include "../Timing/TavLst.cpp"
#include "../Timing/TgtEl.cpp"
#include "../Timing/Timing.cpp"
#include "../Timing/Tmpl.cpp"
#include "../Timing/TmplLst.cpp"
#include "../Timing/TnLst.cpp"
#include "../Timing/TxEl.cpp"
#include "../Timing/Video.cpp"

#include "../Transitions/TransitionBase.cpp"
#include "../Transitions/CornerDirectionTransition.cpp"
#include "../Transitions/EightDirectionTransition.cpp"
#include "../Transitions/EmptyTransition.cpp"
#include "../Transitions/OptionalBlackTransition.cpp"
#include "../Transitions/OrientationTransition.cpp"
#include "../Transitions/SideDirectionTransition.cpp"
#include "../Transitions/SndAc.cpp"
#include "../Transitions/SplitTransition.cpp"
#include "../Transitions/StSnd.cpp"
#include "../Transitions/Transition.cpp"
#include "../Transitions/WheelTransition.cpp"
#include "../Transitions/ZoomTransition.cpp"

#include "../Bg.cpp"
#include "../CNvGrpSpPr.cpp"
#include "../CxnSp.cpp"
#include "../EffectDag.cpp"
#include "../EffectLst.cpp"
#include "../EffectProperties.cpp"
#include "../EffectStyle.cpp"
#include "../Geometry.cpp"
#include "../GraphicFrame.cpp"
#include "../HeadingVariant.cpp"
#include "../GrpSpPr.cpp"
#include "../Hyperlink.cpp"
#include "../NvGraphicFramePr.cpp"
#include "../NvGrpSpPr.cpp"
#include "../Pic.cpp"
#include "../Shape.cpp"
#include "../SmartArt.cpp"
#include "../SpPr.cpp"
#include "../SpTree.cpp"
#include "../SpTreeElem.cpp"
#include "../TxBody.cpp"
#include "../UniColor.cpp"
#include "../UniEffect.cpp"
#include "../UniFill.cpp"
#include "../Controls.cpp"

#include "../Runs/MathParaWrapper.cpp"
#include "../Runs/Br.cpp"
#include "../Runs/Fld.cpp"
#include "../Runs/Run.cpp"
#include "../Runs/RunBase.cpp"

#include "../Ah.cpp"
#include "../AhBase.cpp"
#include "../AhPolar.cpp"
#include "../AhXY.cpp"
#include "../Backdrop.cpp"
#include "../Bevel.cpp"
#include "../BgPr.cpp"
#include "../BodyPr.cpp"
#include "../Camera.cpp"
#include "../Cell3D.cpp"
#include "../ClrMap.cpp"
#include "../ClrMapOvr.cpp"
#include "../CNvCxnSpPr.cpp"
#include "../CNvGraphicFramePr.cpp"
#include "../CNvPicPr.cpp"
#include "../CNvPr.cpp"
#include "../CNvSpPr.cpp"
#include "../CSld.cpp"
#include "../CustGeom.cpp"
#include "../Cxn.cpp"
#include "../DefaultShapeDefinition.cpp"
#include "../ExtP.cpp"
#include "../FillStyle.cpp"
#include "../FontCollection.cpp"
#include "../FontRef.cpp"
#include "../Gd.cpp"
#include "../Gs.cpp"
#include "../Hf.cpp"
#include "../LightRig.cpp"
#include "../Lin.cpp"
#include "../LineEnd.cpp"
#include "../LineJoin.cpp"
#include "../LineStyle.cpp"
#include "../Ln.cpp"
#include "../NvCxnSpPr.cpp"
#include "../NvPicPr.cpp"
#include "../NvPr.cpp"
#include "../NvSpPr.cpp"
#include "../Paragraph.cpp"
#include "../PartTitle.cpp"
#include "../Path.cpp"
#include "../Path2D.cpp"
#include "../Ph.cpp"
#include "../PrstDash.cpp"
#include "../PrstGeom.cpp"
#include "../PrstTxWarp.cpp"
#include "../Rect.cpp"
#include "../Rot.cpp"
#include "../RunElem.cpp"
#include "../RunProperties.cpp"
#include "../Scene3d.cpp"
#include "../ShapeStyle.cpp"
#include "../Sp3d.cpp"
#include "../StyleRef.cpp"
#include "../SupplementalFont.cpp"
#include "../Tab.cpp"
#include "../TableBgStyle.cpp"
#include "../TablePartStyle.cpp"
#include "../TableStyle.cpp"
#include "../TcBdr.cpp"
#include "../TcStyle.cpp"
#include "../TcTxStyle.cpp"
#include "../TextFit.cpp"
#include "../TextFont.cpp"
#include "../TextListStyle.cpp"
#include "../TextParagraphPr.cpp"
#include "../TextSpacing.cpp"
#include "../TxStyles.cpp"
#include "../UniMedia.cpp"
#include "../UniPath2D.cpp"
#include "../Xfrm.cpp"
#include "../XmlId.cpp"

#include "../Bullets/BuAutoNum.cpp"
#include "../Bullets/BuBlip.cpp"
#include "../Bullets/BuChar.cpp"
#include "../Bullets/BuClr.cpp"
#include "../Bullets/BuClrTx.cpp"
#include "../Bullets/BuFontTx.cpp"
#include "../Bullets/Bullet.cpp"
#include "../Bullets/BulletColor.cpp"
#include "../Bullets/BulletSize.cpp"
#include "../Bullets/BulletTypeface.cpp"
#include "../Bullets/BuNone.cpp"
#include "../Bullets/BuSzPct.cpp"
#include "../Bullets/BuSzPts.cpp"
#include "../Bullets/BuSzTx.cpp"

#include "../Effects/AlphaBiLevel.cpp"
#include "../Effects/AlphaCeiling.cpp"
#include "../Effects/AlphaFloor.cpp"
#include "../Effects/AlphaInv.cpp"
#include "../Effects/AlphaMod.cpp"
#include "../Effects/AlphaModFix.cpp"
#include "../Effects/AlphaOutset.cpp"
#include "../Effects/AlphaRepl.cpp"
#include "../Effects/BiLevel.cpp"
#include "../Effects/Blend.cpp"
#include "../Effects/Blur.cpp"
#include "../Effects/ClrChange.cpp"
#include "../Effects/ClrRepl.cpp"
#include "../Effects/Duotone.cpp"
#include "../Effects/EffectElement.cpp"
#include "../Effects/FillEffect.cpp"
#include "../Effects/FillOverlay.cpp"
#include "../Effects/Glow.cpp"
#include "../Effects/Grayscl.cpp"
#include "../Effects/HslEffect.cpp"
#include "../Effects/InnerShdw.cpp"
#include "../Effects/LumEffect.cpp"
#include "../Effects/OuterShdw.cpp"
#include "../Effects/PrstShdw.cpp"
#include "../Effects/Reflection.cpp"
#include "../Effects/RelOff.cpp"
#include "../Effects/SoftEdge.cpp"
#include "../Effects/TintEffect.cpp"
#include "../Effects/XfrmEffect.cpp"

#include "../../../PPTXFormat/Presentation.cpp"
#include "../../../PPTXFormat/FileContainer.cpp"
#include "../../../PPTXFormat/FileTypes.cpp"
#include "../../../PPTXFormat/FileFactory.cpp"
#include "../../../PPTXFormat/FileMap.cpp"
#include "../../../PPTXFormat/Folder.cpp"
#include "../../../PPTXFormat/WrapperFile.cpp"
#include "../../../PPTXFormat/ViewProps.cpp"
#include "../../../PPTXFormat/Theme.cpp"
#include "../../../PPTXFormat/TableStyles.cpp"
#include "../../../PPTXFormat/SlideMaster.cpp"
#include "../../../PPTXFormat/SlideLayout.cpp"
#include "../../../PPTXFormat/Slide.cpp"
#include "../../../PPTXFormat/PresProps.cpp"
#include "../../../PPTXFormat/NotesSlide.cpp"
#include "../../../PPTXFormat/NotesMaster.cpp"
#include "../../../PPTXFormat/Namespaces.cpp"
#include "../../../PPTXFormat/LegacyDiagramText.cpp"
#include "../../../PPTXFormat/HandoutMaster.cpp"
#include "../../../PPTXFormat/Core.cpp"
#include "../../../PPTXFormat/App.cpp"
#include "../../../PPTXFormat/WrapperWritingElement.cpp"
#include "../../../PPTXFormat/Comments.cpp"
#include "../../../PPTXFormat/CommentAuthors.cpp"
