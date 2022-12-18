#-------------------------------------------------
#
# Project created by QtCreator
#
#-------------------------------------------------

QT       -= core gui

TARGET = PPTXFormatLib
TEMPLATE = lib
CONFIG += staticlib

CORE_ROOT_DIR = $$PWD/../../../..
PWD_ROOT_DIR = $$PWD

CONFIG += core_x2t
include(../../../../Common/base.pri)

#BOOST
include($$PWD/../../../../Common/3dParty/boost/boost.pri)

#LIMITS
include($$PWD/../../../PPTXFormat/Limit/pri/pptx_limits.pri)

#PPTSHAPES
include($$PWD/../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/pri/ppt_shapes.pri)
include($$PWD/../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/pri/ppt_shapes_cpp.pri)

#PPTXSHAPES
include($$PWD/../../../../MsBinaryFile/Common/Vml/PPTXShape/OOXMLShapes/pri/pptx_shapes.pri)

DEFINES += UNICODE \
    _UNICODE \
    AVS_USE_CONVERT_PPTX_TOCUSTOM_VML \
    #DISABLE_FILE_DOWNLOADER \
    DONT_WRITE_EMBEDDED_FONTS

INCLUDEPATH += \
	../../../../Common/ASCDocxFormat/Source/Utility \
	../../../../Common/ASCDocxFormat/Source/XML \
	../../../../Common/ASCDocxFormat/Source \
	../../../../../MsBinaryFile/XlsFile/Format \
	../../../../../MsBinaryFile/Common/common_xls \
	../../../XlsbFormat

#!disable_precompiled_header:CONFIG += precompile_header
#precompile_header {
#    PRECOMPILED_HEADER = precompiled.h
#    HEADERS += precompiled.h
#}

core_release {
SOURCES += \
	pptx_format_logic.cpp
}

core_debug {
SOURCES += \
	../../../PPTXFormat/Logic/Media/WavAudioFile.cpp \
	../../../PPTXFormat/Logic/Media/AudioCD.cpp \
	../../../PPTXFormat/Logic/Media/MediaFile.cpp \
	\
	../../../PPTXFormat/Logic/Path2D/ArcTo.cpp \
	../../../PPTXFormat/Logic/Path2D/Close.cpp \
	../../../PPTXFormat/Logic/Path2D/CubicBezTo.cpp \
	../../../PPTXFormat/Logic/Path2D/LineTo.cpp \
	../../../PPTXFormat/Logic/Path2D/MoveTo.cpp \
	../../../PPTXFormat/Logic/Path2D/PathBase.cpp \
	../../../PPTXFormat/Logic/Path2D/QuadBezTo.cpp \
	\
	../../../PPTXFormat/Logic/Colors/SchemeClr.cpp \
	../../../PPTXFormat/Logic/Colors/ColorBase.cpp \
	../../../PPTXFormat/Logic/Colors/ColorModifier.cpp \
	../../../PPTXFormat/Logic/Colors/PrstClr.cpp \
	../../../PPTXFormat/Logic/Colors/SrgbClr.cpp \
	../../../PPTXFormat/Logic/Colors/SysClr.cpp \
	\
	../../../PPTXFormat/Logic/Fills/Blip.cpp \
	../../../PPTXFormat/Logic/Fills/BlipFill.cpp \
	../../../PPTXFormat/Logic/Fills/GradFill.cpp \
	../../../PPTXFormat/Logic/Fills/NoFill.cpp \
	../../../PPTXFormat/Logic/Fills/PattFill.cpp \
	../../../PPTXFormat/Logic/Fills/SolidFill.cpp \
	../../../PPTXFormat/Logic/Fills/Stretch.cpp \
	../../../PPTXFormat/Logic/Fills/Tile.cpp \
	\
	../../../PPTXFormat/Logic/Table/TableCell.cpp \
	../../../PPTXFormat/Logic/Table/Table.cpp \
	../../../PPTXFormat/Logic/Table/TableCellProperties.cpp \
	../../../PPTXFormat/Logic/Table/TableCol.cpp \
	../../../PPTXFormat/Logic/Table/TableProperties.cpp \
	../../../PPTXFormat/Logic/Table/TableRow.cpp \
	\
	../../../PPTXFormat/Logic/Timing/BuildNodeBase.cpp \
	../../../PPTXFormat/Logic/Timing/TimeNodeBase.cpp \
	../../../PPTXFormat/Logic/Timing/Anim.cpp \
	../../../PPTXFormat/Logic/Timing/AnimClr.cpp \
	../../../PPTXFormat/Logic/Timing/AnimEffect.cpp \
	../../../PPTXFormat/Logic/Timing/AnimMotion.cpp \
	../../../PPTXFormat/Logic/Timing/AnimRot.cpp \
	../../../PPTXFormat/Logic/Timing/AnimScale.cpp \
	../../../PPTXFormat/Logic/Timing/AnimVariant.cpp \
	../../../PPTXFormat/Logic/Timing/AttrName.cpp \
	../../../PPTXFormat/Logic/Timing/AttrNameLst.cpp \
	../../../PPTXFormat/Logic/Timing/Audio.cpp \
	../../../PPTXFormat/Logic/Timing/BldDgm.cpp \
	../../../PPTXFormat/Logic/Timing/BldGraphic.cpp \
	../../../PPTXFormat/Logic/Timing/BldLst.cpp \
	../../../PPTXFormat/Logic/Timing/BldOleChart.cpp \
	../../../PPTXFormat/Logic/Timing/BldP.cpp \
	../../../PPTXFormat/Logic/Timing/BldSub.cpp \
	../../../PPTXFormat/Logic/Timing/CBhvr.cpp \
	../../../PPTXFormat/Logic/Timing/ChildTnLst.cpp \
	../../../PPTXFormat/Logic/Timing/Cmd.cpp \
	../../../PPTXFormat/Logic/Timing/CMediaNode.cpp \
	../../../PPTXFormat/Logic/Timing/Cond.cpp \
	../../../PPTXFormat/Logic/Timing/CondLst.cpp \
	../../../PPTXFormat/Logic/Timing/CTn.cpp \
	../../../PPTXFormat/Logic/Timing/Excl.cpp \
	../../../PPTXFormat/Logic/Timing/GraphicEl.cpp \
	../../../PPTXFormat/Logic/Timing/Iterate.cpp \
	../../../PPTXFormat/Logic/Timing/Par.cpp \
	../../../PPTXFormat/Logic/Timing/Seq.cpp \
	../../../PPTXFormat/Logic/Timing/Set.cpp \
	../../../PPTXFormat/Logic/Timing/SpTgt.cpp \
	../../../PPTXFormat/Logic/Timing/Tav.cpp \
	../../../PPTXFormat/Logic/Timing/TavLst.cpp \
	../../../PPTXFormat/Logic/Timing/TgtEl.cpp \
	../../../PPTXFormat/Logic/Timing/Timing.cpp \
	../../../PPTXFormat/Logic/Timing/Tmpl.cpp \
	../../../PPTXFormat/Logic/Timing/TmplLst.cpp \
	../../../PPTXFormat/Logic/Timing/TnLst.cpp \
	../../../PPTXFormat/Logic/Timing/TxEl.cpp \
	../../../PPTXFormat/Logic/Timing/Video.cpp \
	\
	../../../PPTXFormat/Logic/Transitions/TransitionBase.cpp \
	../../../PPTXFormat/Logic/Transitions/CornerDirectionTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/EightDirectionTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/EmptyTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/OptionalBlackTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/OrientationTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/SideDirectionTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/SndAc.cpp \
	../../../PPTXFormat/Logic/Transitions/SplitTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/StSnd.cpp \
	../../../PPTXFormat/Logic/Transitions/Transition.cpp \
	../../../PPTXFormat/Logic/Transitions/WheelTransition.cpp \
	../../../PPTXFormat/Logic/Transitions/ZoomTransition.cpp \
	\
	../../../PPTXFormat/Logic/Bg.cpp \
	../../../PPTXFormat/Logic/CNvGrpSpPr.cpp \
	../../../PPTXFormat/Logic/CxnSp.cpp \
	../../../PPTXFormat/Logic/EffectDag.cpp \
	../../../PPTXFormat/Logic/EffectLst.cpp \
	../../../PPTXFormat/Logic/EffectProperties.cpp \
	../../../PPTXFormat/Logic/EffectStyle.cpp \
	../../../PPTXFormat/Logic/Geometry.cpp \
	../../../PPTXFormat/Logic/GraphicFrame.cpp \
	../../../PPTXFormat/Logic/HeadingVariant.cpp \
	../../../PPTXFormat/Logic/GrpSpPr.cpp \
	../../../PPTXFormat/Logic/Hyperlink.cpp \
	../../../PPTXFormat/Logic/NvGraphicFramePr.cpp \
	../../../PPTXFormat/Logic/NvGrpSpPr.cpp \
	../../../PPTXFormat/Logic/Pic.cpp \
	../../../PPTXFormat/Logic/Shape.cpp \
	../../../PPTXFormat/Logic/SmartArt.cpp \
	../../../PPTXFormat/Logic/SpPr.cpp \
	../../../PPTXFormat/Logic/SpTree.cpp \
	../../../PPTXFormat/Logic/SpTreeElem.cpp \
	../../../PPTXFormat/Logic/TxBody.cpp \
	../../../PPTXFormat/Logic/UniColor.cpp \
	../../../PPTXFormat/Logic/UniFill.cpp \
	../../../PPTXFormat/Logic/UniEffect.cpp \
	../../../PPTXFormat/Logic/Controls.cpp \
	\
	../../../PPTXFormat/Logic/Runs/MathParaWrapper.cpp \
	../../../PPTXFormat/Logic/Runs/Br.cpp \
	../../../PPTXFormat/Logic/Runs/Fld.cpp \
	../../../PPTXFormat/Logic/Runs/Run.cpp \
	../../../PPTXFormat/Logic/Runs/RunBase.cpp \
	\
	../../../PPTXFormat/Logic/Ah.cpp \
	../../../PPTXFormat/Logic/AhBase.cpp \
	../../../PPTXFormat/Logic/AhPolar.cpp \
	../../../PPTXFormat/Logic/AhXY.cpp \
	../../../PPTXFormat/Logic/Backdrop.cpp \
	../../../PPTXFormat/Logic/Bevel.cpp \
	../../../PPTXFormat/Logic/BgPr.cpp \
	../../../PPTXFormat/Logic/BodyPr.cpp \
	../../../PPTXFormat/Logic/Camera.cpp \
	../../../PPTXFormat/Logic/Cell3D.cpp \
	../../../PPTXFormat/Logic/ClrMap.cpp \
	../../../PPTXFormat/Logic/ClrMapOvr.cpp \
	../../../PPTXFormat/Logic/CNvCxnSpPr.cpp \
	../../../PPTXFormat/Logic/CNvGraphicFramePr.cpp \
	../../../PPTXFormat/Logic/CNvPicPr.cpp \
	../../../PPTXFormat/Logic/CNvPr.cpp \
	../../../PPTXFormat/Logic/CNvSpPr.cpp \
	../../../PPTXFormat/Logic/CSld.cpp \
	../../../PPTXFormat/Logic/CustGeom.cpp \
	../../../PPTXFormat/Logic/Cxn.cpp \
	../../../PPTXFormat/Logic/DefaultShapeDefinition.cpp \
	../../../PPTXFormat/Logic/ExtP.cpp \
	../../../PPTXFormat/Logic/FillStyle.cpp \
	../../../PPTXFormat/Logic/FontCollection.cpp \
	../../../PPTXFormat/Logic/FontRef.cpp \
	../../../PPTXFormat/Logic/Gd.cpp \
	../../../PPTXFormat/Logic/Gs.cpp \
	../../../PPTXFormat/Logic/Hf.cpp \
	../../../PPTXFormat/Logic/LightRig.cpp \
	../../../PPTXFormat/Logic/Lin.cpp \
	../../../PPTXFormat/Logic/LineEnd.cpp \
	../../../PPTXFormat/Logic/LineJoin.cpp \
	../../../PPTXFormat/Logic/LineStyle.cpp \
	../../../PPTXFormat/Logic/Ln.cpp \
	../../../PPTXFormat/Logic/NvCxnSpPr.cpp \
	../../../PPTXFormat/Logic/NvPicPr.cpp \
	../../../PPTXFormat/Logic/NvPr.cpp \
	../../../PPTXFormat/Logic/NvSpPr.cpp \
	../../../PPTXFormat/Logic/Paragraph.cpp \
	../../../PPTXFormat/Logic/PartTitle.cpp \
	../../../PPTXFormat/Logic/Path.cpp \
	../../../PPTXFormat/Logic/Path2D.cpp \
	../../../PPTXFormat/Logic/Ph.cpp \
	../../../PPTXFormat/Logic/PrstDash.cpp \
	../../../PPTXFormat/Logic/PrstGeom.cpp \
	../../../PPTXFormat/Logic/PrstTxWarp.cpp \
	../../../PPTXFormat/Logic/Rect.cpp \
	../../../PPTXFormat/Logic/Rot.cpp \
	../../../PPTXFormat/Logic/RunElem.cpp \
	../../../PPTXFormat/Logic/RunProperties.cpp \
	../../../PPTXFormat/Logic/Scene3d.cpp \
	../../../PPTXFormat/Logic/ShapeStyle.cpp \
	../../../PPTXFormat/Logic/Sp3d.cpp \
	../../../PPTXFormat/Logic/StyleRef.cpp \
	../../../PPTXFormat/Logic/SupplementalFont.cpp \
	../../../PPTXFormat/Logic/Tab.cpp \
	../../../PPTXFormat/Logic/TableBgStyle.cpp \
	../../../PPTXFormat/Logic/TablePartStyle.cpp \
	../../../PPTXFormat/Logic/TableStyle.cpp \
	../../../PPTXFormat/Logic/TcBdr.cpp \
	../../../PPTXFormat/Logic/TcStyle.cpp \
	../../../PPTXFormat/Logic/TcTxStyle.cpp \
	../../../PPTXFormat/Logic/TextFit.cpp \
	../../../PPTXFormat/Logic/TextFont.cpp \
	../../../PPTXFormat/Logic/TextListStyle.cpp \
	../../../PPTXFormat/Logic/TextParagraphPr.cpp \
	../../../PPTXFormat/Logic/TextSpacing.cpp \
	../../../PPTXFormat/Logic/TxStyles.cpp \
	../../../PPTXFormat/Logic/UniMedia.cpp \
	../../../PPTXFormat/Logic/UniPath2D.cpp \
	../../../PPTXFormat/Logic/Xfrm.cpp \
	../../../PPTXFormat/Logic/XmlId.cpp \
	\
	../../../PPTXFormat/Logic/Bullets/BuAutoNum.cpp \
	../../../PPTXFormat/Logic/Bullets/BuBlip.cpp \
	../../../PPTXFormat/Logic/Bullets/BuChar.cpp \
	../../../PPTXFormat/Logic/Bullets/BuClr.cpp \
	../../../PPTXFormat/Logic/Bullets/BuClrTx.cpp \
	../../../PPTXFormat/Logic/Bullets/BuFontTx.cpp \
	../../../PPTXFormat/Logic/Bullets/Bullet.cpp \
	../../../PPTXFormat/Logic/Bullets/BulletColor.cpp \
	../../../PPTXFormat/Logic/Bullets/BulletSize.cpp \
	../../../PPTXFormat/Logic/Bullets/BulletTypeface.cpp \
	../../../PPTXFormat/Logic/Bullets/BuNone.cpp \
	../../../PPTXFormat/Logic/Bullets/BuSzPct.cpp \
	../../../PPTXFormat/Logic/Bullets/BuSzPts.cpp \
	../../../PPTXFormat/Logic/Bullets/BuSzTx.cpp \
	\
	../../../PPTXFormat/Logic/Effects/AlphaBiLevel.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaCeiling.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaFloor.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaInv.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaMod.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaModFix.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaOutset.cpp \
	../../../PPTXFormat/Logic/Effects/AlphaRepl.cpp \
	../../../PPTXFormat/Logic/Effects/BiLevel.cpp \
	../../../PPTXFormat/Logic/Effects/Blend.cpp \
	../../../PPTXFormat/Logic/Effects/Blur.cpp \
	../../../PPTXFormat/Logic/Effects/ClrChange.cpp \
	../../../PPTXFormat/Logic/Effects/ClrRepl.cpp \
	../../../PPTXFormat/Logic/Effects/Duotone.cpp \
	../../../PPTXFormat/Logic/Effects/EffectElement.cpp \
	../../../PPTXFormat/Logic/Effects/FillEffect.cpp \
	../../../PPTXFormat/Logic/Effects/FillOverlay.cpp \
	../../../PPTXFormat/Logic/Effects/Glow.cpp \
	../../../PPTXFormat/Logic/Effects/Grayscl.cpp \
	../../../PPTXFormat/Logic/Effects/HslEffect.cpp \
	../../../PPTXFormat/Logic/Effects/InnerShdw.cpp \
	../../../PPTXFormat/Logic/Effects/LumEffect.cpp \
	../../../PPTXFormat/Logic/Effects/OuterShdw.cpp \
	../../../PPTXFormat/Logic/Effects/PrstShdw.cpp \
	../../../PPTXFormat/Logic/Effects/Reflection.cpp \
	../../../PPTXFormat/Logic/Effects/RelOff.cpp \
	../../../PPTXFormat/Logic/Effects/SoftEdge.cpp \
	../../../PPTXFormat/Logic/Effects/TintEffect.cpp \
	../../../PPTXFormat/Logic/Effects/XfrmEffect.cpp \
	\
	../../../PPTXFormat/Presentation.cpp \
	../../../PPTXFormat/FileContainer.cpp \
	../../../PPTXFormat/FileTypes.cpp \
	../../../PPTXFormat/FileFactory.cpp \
	../../../PPTXFormat/FileMap.cpp \
	../../../PPTXFormat/Folder.cpp \
	../../../PPTXFormat/WrapperFile.cpp \
	../../../PPTXFormat/ViewProps.cpp \
	../../../PPTXFormat/Theme.cpp \
	../../../PPTXFormat/TableStyles.cpp \
	../../../PPTXFormat/SlideMaster.cpp \
	../../../PPTXFormat/SlideLayout.cpp \
	../../../PPTXFormat/Slide.cpp \
	../../../PPTXFormat/PresProps.cpp \
	../../../PPTXFormat/NotesSlide.cpp \
	../../../PPTXFormat/NotesMaster.cpp \
	../../../PPTXFormat/Namespaces.cpp \
	../../../PPTXFormat/LegacyDiagramText.cpp \
	../../../PPTXFormat/HandoutMaster.cpp \
	../../../PPTXFormat/Core.cpp \
	../../../PPTXFormat/App.cpp \
	../../../PPTXFormat/WrapperWritingElement.cpp \
	../../../PPTXFormat/Comments.cpp \
	../../../PPTXFormat/CommentAuthors.cpp
}

SOURCES += \
	pptx_format.cpp \
	../../../../OOXML/Binary/Document/BinWriter/BinEquationWriter.cpp \
	\
	../../../../MsBinaryFile/Common/Vml/BaseShape.cpp \
	../../../../MsBinaryFile/Common/Vml/toVmlConvert.cpp \
	\
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptShape.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptFormula.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/ElementSettings.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/BinaryReader.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/CustomGeomShape.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/Ppt2PptxShapeConverter.cpp \
	\
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxFormula.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxShape.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/Pptx2PptShapeConverter.cpp \
	\
	../../../../MsBinaryFile/PptFile/Drawing/TextAttributesEx.cpp \
	../../../../MsBinaryFile/PptFile/Drawing/Elements.cpp \
	\
	../../../Binary/Presentation/BinaryFileReaderWriter.cpp \
	../../../Binary/Presentation/XmlWriter.cpp \
	../../../Binary/Presentation/FontPicker.cpp \
	../../../Binary/Presentation/imagemanager.cpp \	
	../../../Binary/Presentation/FontPicker.cpp \
	../../../Binary/Presentation/PPTXWriter.cpp \
	../../../Binary/Presentation/DefaultNotesTheme.cpp \
	../../../Binary/Presentation/DefaultNotesMaster.cpp \
	../../../Binary/Presentation/Converter.cpp \
	../../../Binary/Presentation/CalculatorCRC32.cpp \
	../../../Binary/Presentation/FontCutter.cpp	\
	\
	../../../PPTXFormat/DrawingConverter/ASCOfficeDrawingConverter.cpp \
	../../../PPTXFormat/DrawingConverter/ASCOfficePPTXFileRealization.cpp \
	../../../../HtmlRenderer/src/ASCSVGWriter.cpp \
	\
	../../../PPTXFormat/ViewProps/CSldViewPr.cpp \
	../../../PPTXFormat/ViewProps/CViewPr.cpp \
	../../../PPTXFormat/ViewProps/GridSpacing.cpp \
	../../../PPTXFormat/ViewProps/Guide.cpp \
	../../../PPTXFormat/ViewProps/NormalViewPr.cpp \
	../../../PPTXFormat/ViewProps/NotesTextViewPr.cpp \
	../../../PPTXFormat/ViewProps/NotesViewPr.cpp \
	../../../PPTXFormat/ViewProps/Origin.cpp \
	../../../PPTXFormat/ViewProps/OutlineViewPr.cpp \
	../../../PPTXFormat/ViewProps/Ratio.cpp \
	../../../PPTXFormat/ViewProps/Restored.cpp \
	../../../PPTXFormat/ViewProps/Scale.cpp \
	../../../PPTXFormat/ViewProps/Sld.cpp \
	../../../PPTXFormat/ViewProps/SlideViewPr.cpp \
	../../../PPTXFormat/ViewProps/SorterViewPr.cpp \
	\
	../../../PPTXFormat/Theme/ClrScheme.cpp \
	../../../PPTXFormat/Theme/ExtraClrScheme.cpp \
	../../../PPTXFormat/Theme/FmtScheme.cpp \
	../../../PPTXFormat/Theme/FontScheme.cpp \
	../../../PPTXFormat/Theme/ThemeElements.cpp \
	\
	../../../PPTXFormat/ShowPr/ShowPr.cpp \
	../../../PPTXFormat/ShowPr/Present.cpp \
	../../../PPTXFormat/ShowPr/Kiosk.cpp \
	../../../PPTXFormat/ShowPr/CustShow.cpp \
	../../../PPTXFormat/ShowPr/Browse.cpp \
	../../../PPTXFormat/ShowPr/SldRg.cpp \
	../../../PPTXFormat/ShowPr/SldAll.cpp \
	\
	../../../PPTXFormat/Presentation/NotesSz.cpp \
	../../../PPTXFormat/Presentation/PhotoAlbum.cpp \
	../../../PPTXFormat/Presentation/EmbeddedFont.cpp \
	../../../PPTXFormat/Presentation/EmbeddedFontDataId.cpp \
	../../../PPTXFormat/Presentation/Kinsoku.cpp \
	../../../PPTXFormat/Presentation/SectionLst.cpp \
	../../../PPTXFormat/Presentation/SldSz.cpp

HEADERS += \
	pptx_format.h \
	\
	../../../../MsBinaryFile/Common/Vml/BaseShape.h \
	../../../../MsBinaryFile/Common/Vml/toVmlConvert.h \
	../../../../MsBinaryFile/Common/Vml/Path.h \
	../../../../MsBinaryFile/Common/Vml/GraphicsPath.h \
	../../../../MsBinaryFile/Common/Vml/Common.h \
	\
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptShape.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptFormula.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/ElementSettings.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/BinaryReader.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/CustomGeomShape.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/Ppt2PptxShapeConverter.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/Enums.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptShapeEnum.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PresetShapesHeader.h \
	\
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxFormula.h \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxShape.h \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PresetShapesHeader.h \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/Pptx2PptShapeConverter.h \
	\
	../../../PPTXFormat/DrawingConverter/ASCOfficeDrawingConverter.h \
	../../../PPTXFormat/DrawingConverter/ASCOfficePPTXFile.h \
	../../../PPTXFormat/FileTypes.h \
	../../../PPTXFormat/Namespaces.h \
	\
	../../../PPTXFormat/Logic/Bullets/BuAutoNum.h \
	../../../PPTXFormat/Logic/Bullets/BuBlip.h \
	../../../PPTXFormat/Logic/Bullets/BuChar.h \
	../../../PPTXFormat/Logic/Bullets/BuClr.h \
	../../../PPTXFormat/Logic/Bullets/BuClrTx.h \
	../../../PPTXFormat/Logic/Bullets/BuFontTx.h \
	../../../PPTXFormat/Logic/Bullets/Bullet.h \
	../../../PPTXFormat/Logic/Bullets/BulletColor.h \
	../../../PPTXFormat/Logic/Bullets/BulletSize.h \
	../../../PPTXFormat/Logic/Bullets/BulletTypeface.h \
	../../../PPTXFormat/Logic/Bullets/BuNone.h \
	../../../PPTXFormat/Logic/Bullets/BuSzPct.h \
	../../../PPTXFormat/Logic/Bullets/BuSzPts.h \
	../../../PPTXFormat/Logic/Bullets/BuSzTx.h \
	\
	../../../PPTXFormat/Logic/Colors/ColorBase.h \
	../../../PPTXFormat/Logic/Colors/ColorModifier.h \
	../../../PPTXFormat/Logic/Colors/PrstClr.h \
	../../../PPTXFormat/Logic/Colors/SchemeClr.h \
	../../../PPTXFormat/Logic/Colors/SrgbClr.h \
	../../../PPTXFormat/Logic/Colors/SysClr.h \
	\
	../../../PPTXFormat/Logic/Effects/AlphaBiLevel.h \
	../../../PPTXFormat/Logic/Effects/AlphaCeiling.h \
	../../../PPTXFormat/Logic/Effects/AlphaFloor.h \
	../../../PPTXFormat/Logic/Effects/AlphaInv.h \
	../../../PPTXFormat/Logic/Effects/AlphaMod.h \
	../../../PPTXFormat/Logic/Effects/AlphaModFix.h \
	../../../PPTXFormat/Logic/Effects/AlphaOutset.h \
	../../../PPTXFormat/Logic/Effects/AlphaRepl.h \
	../../../PPTXFormat/Logic/Effects/BiLevel.h \
	../../../PPTXFormat/Logic/Effects/Blend.h \
	../../../PPTXFormat/Logic/Effects/Blur.h \
	../../../PPTXFormat/Logic/Effects/ClrChange.h \
	../../../PPTXFormat/Logic/Effects/ClrRepl.h \
	../../../PPTXFormat/Logic/Effects/Duotone.h \
	../../../PPTXFormat/Logic/Effects/EffectElement.h \
	../../../PPTXFormat/Logic/Effects/FillEffect.h \
	../../../PPTXFormat/Logic/Effects/FillOverlay.h \
	../../../PPTXFormat/Logic/Effects/Glow.h \
	../../../PPTXFormat/Logic/Effects/Grayscl.h \
	../../../PPTXFormat/Logic/Effects/HslEffect.h \
	../../../PPTXFormat/Logic/Effects/InnerShdw.h \
	../../../PPTXFormat/Logic/Effects/LumEffect.h \
	../../../PPTXFormat/Logic/Effects/OuterShdw.h \
	../../../PPTXFormat/Logic/Effects/PrstShdw.h \
	../../../PPTXFormat/Logic/Effects/Reflection.h \
	../../../PPTXFormat/Logic/Effects/RelOff.h \
	../../../PPTXFormat/Logic/Effects/SoftEdge.h \
	../../../PPTXFormat/Logic/Effects/TintEffect.h \
	../../../PPTXFormat/Logic/Effects/XfrmEffect.h \
	\
	../../../PPTXFormat/Logic/Fills/Blip.h \
	../../../PPTXFormat/Logic/Fills/BlipFill.h \
	../../../PPTXFormat/Logic/Fills/GradFill.h \
	../../../PPTXFormat/Logic/Fills/NoFill.h \
	../../../PPTXFormat/Logic/Fills/PattFill.h \
	../../../PPTXFormat/Logic/Fills/SolidFill.h \
	../../../PPTXFormat/Logic/Fills/Stretch.h \
	../../../PPTXFormat/Logic/Fills/Tile.h \
	\
	../../../PPTXFormat/Logic/Media/AudioCD.h \
	../../../PPTXFormat/Logic/Media/MediaFile.h \
	../../../PPTXFormat/Logic/Media/WavAudioFile.h \
	\
	../../../PPTXFormat/Logic/Path2D/ArcTo.h \
	../../../PPTXFormat/Logic/Path2D/Close.h \
	../../../PPTXFormat/Logic/Path2D/CubicBezTo.h \
	../../../PPTXFormat/Logic/Path2D/LineTo.h \
	../../../PPTXFormat/Logic/Path2D/MoveTo.h \
	../../../PPTXFormat/Logic/Path2D/PathBase.h \
	../../../PPTXFormat/Logic/Path2D/QuadBezTo.h \
	\
	../../../PPTXFormat/Logic/Runs/Br.h \
	../../../PPTXFormat/Logic/Runs/Fld.h \
	../../../PPTXFormat/Logic/Runs/MathParaWrapper.h \
	../../../PPTXFormat/Logic/Runs/Run.h \
	../../../PPTXFormat/Logic/Runs/RunBase.h \
	\
	../../../PPTXFormat/Logic/Table/Table.h \
	../../../PPTXFormat/Logic/Table/TableCell.h \
	../../../PPTXFormat/Logic/Table/TableCellProperties.h \
	../../../PPTXFormat/Logic/Table/TableCol.h \
	../../../PPTXFormat/Logic/Table/TableProperties.h \
	../../../PPTXFormat/Logic/Table/TableRow.h \
	\
	../../../PPTXFormat/Logic/Timing/Anim.h \
	../../../PPTXFormat/Logic/Timing/AnimClr.h \
	../../../PPTXFormat/Logic/Timing/AnimEffect.h \
	../../../PPTXFormat/Logic/Timing/AnimMotion.h \
	../../../PPTXFormat/Logic/Timing/AnimRot.h \
	../../../PPTXFormat/Logic/Timing/AnimScale.h \
	../../../PPTXFormat/Logic/Timing/AnimVariant.h \
	../../../PPTXFormat/Logic/Timing/AttrName.h \
	../../../PPTXFormat/Logic/Timing/AttrNameLst.h \
	../../../PPTXFormat/Logic/Timing/Audio.h \
	../../../PPTXFormat/Logic/Timing/BldDgm.h \
	../../../PPTXFormat/Logic/Timing/BldGraphic.h \
	../../../PPTXFormat/Logic/Timing/BldLst.h \
	../../../PPTXFormat/Logic/Timing/BldOleChart.h \
	../../../PPTXFormat/Logic/Timing/BldP.h \
	../../../PPTXFormat/Logic/Timing/BldSub.h \
	../../../PPTXFormat/Logic/Timing/BuildNodeBase.h \
	../../../PPTXFormat/Logic/Timing/CBhvr.h \
	../../../PPTXFormat/Logic/Timing/Cmd.h \
	../../../PPTXFormat/Logic/Timing/CMediaNode.h \
	../../../PPTXFormat/Logic/Timing/Cond.h \
	../../../PPTXFormat/Logic/Timing/CondLst.h \
	../../../PPTXFormat/Logic/Timing/CTn.h \
	../../../PPTXFormat/Logic/Timing/Excl.h \
	../../../PPTXFormat/Logic/Timing/GraphicEl.h \
	../../../PPTXFormat/Logic/Timing/Iterate.h \
	../../../PPTXFormat/Logic/Timing/Par.h \
	../../../PPTXFormat/Logic/Timing/Seq.h \
	../../../PPTXFormat/Logic/Timing/Set.h \
	../../../PPTXFormat/Logic/Timing/SpTgt.h \
	../../../PPTXFormat/Logic/Timing/Tav.h \
	../../../PPTXFormat/Logic/Timing/TavLst.h \
	../../../PPTXFormat/Logic/Timing/TgtEl.h \
	../../../PPTXFormat/Logic/Timing/TimeNodeBase.h \
	../../../PPTXFormat/Logic/Timing/Timing.h \
	../../../PPTXFormat/Logic/Timing/Tmpl.h \
	../../../PPTXFormat/Logic/Timing/TmplLst.h \
	../../../PPTXFormat/Logic/Timing/TnLst.h \
	../../../PPTXFormat/Logic/Timing/TxEl.h \
	../../../PPTXFormat/Logic/Timing/Video.h \
	\
	../../../PPTXFormat/Logic/Transitions/CornerDirectionTransition.h \
	../../../PPTXFormat/Logic/Transitions/EightDirectionTransition.h \
	../../../PPTXFormat/Logic/Transitions/EmptyTransition.h \
	../../../PPTXFormat/Logic/Transitions/OptionalBlackTransition.h \
	../../../PPTXFormat/Logic/Transitions/OrientationTransition.h \
	../../../PPTXFormat/Logic/Transitions/SideDirectionTransition.h \
	../../../PPTXFormat/Logic/Transitions/SndAc.h \
	../../../PPTXFormat/Logic/Transitions/SplitTransition.h \
	../../../PPTXFormat/Logic/Transitions/StSnd.h \
	../../../PPTXFormat/Logic/Transitions/Transition.h \
	../../../PPTXFormat/Logic/Transitions/TransitionBase.h \
	../../../PPTXFormat/Logic/Transitions/WheelTransition.h \
	../../../PPTXFormat/Logic/Transitions/ZoomTransition.h \
	\
	../../../PPTXFormat/Logic/Controls.h \
	../../../PPTXFormat/Logic/Ah.h \
	../../../PPTXFormat/Logic/AhBase.h \
	../../../PPTXFormat/Logic/AhPolar.h \
	../../../PPTXFormat/Logic/AhXY.h \
	../../../PPTXFormat/Logic/Backdrop.h \
	../../../PPTXFormat/Logic/Bevel.h \
	../../../PPTXFormat/Logic/Bg.h \
	../../../PPTXFormat/Logic/BgPr.h \
	../../../PPTXFormat/Logic/BodyPr.h \
	../../../PPTXFormat/Logic/Camera.h \
	../../../PPTXFormat/Logic/Cell3D.h \
	../../../PPTXFormat/Logic/ClrMap.h \
	../../../PPTXFormat/Logic/ClrMapOvr.h \
	../../../PPTXFormat/Logic/CNvCxnSpPr.h \
	../../../PPTXFormat/Logic/CNvGraphicFramePr.h \
	../../../PPTXFormat/Logic/CNvGrpSpPr.h \
	../../../PPTXFormat/Logic/CNvPicPr.h \
	../../../PPTXFormat/Logic/CNvPr.h \
	../../../PPTXFormat/Logic/CNvSpPr.h \
	../../../PPTXFormat/Logic/CSld.h \
	../../../PPTXFormat/Logic/CustGeom.h \
	../../../PPTXFormat/Logic/Cxn.h \
	../../../PPTXFormat/Logic/CxnSp.h \
	../../../PPTXFormat/Logic/DefaultShapeDefinition.h \
	../../../PPTXFormat/Logic/EffectDag.h \
	../../../PPTXFormat/Logic/EffectLst.h \
	../../../PPTXFormat/Logic/EffectProperties.h \
	../../../PPTXFormat/Logic/EffectStyle.h \
	../../../PPTXFormat/Logic/ExtP.h \
	../../../PPTXFormat/Logic/FillStyle.h \
	../../../PPTXFormat/Logic/FontCollection.h \
	../../../PPTXFormat/Logic/FontRef.h \
	../../../PPTXFormat/Logic/Gd.h \
	../../../PPTXFormat/Logic/Geometry.h \
	../../../PPTXFormat/Logic/GraphicFrame.h \
	../../../PPTXFormat/Logic/GrpSpPr.h \
	../../../PPTXFormat/Logic/Gs.h \
	../../../PPTXFormat/Logic/HeadingVariant.h \
	../../../PPTXFormat/Logic/Hf.h \
	../../../PPTXFormat/Logic/Hyperlink.h \
	../../../PPTXFormat/Logic/LightRig.h \
	../../../PPTXFormat/Logic/Lin.h \
	../../../PPTXFormat/Logic/LineEnd.h \
	../../../PPTXFormat/Logic/LineJoin.h \
	../../../PPTXFormat/Logic/LineStyle.h \
	../../../PPTXFormat/Logic/Ln.h \
	../../../PPTXFormat/Logic/NvCxnSpPr.h \
	../../../PPTXFormat/Logic/NvGraphicFramePr.h \
	../../../PPTXFormat/Logic/NvGrpSpPr.h \
	../../../PPTXFormat/Logic/NvPicPr.h \
	../../../PPTXFormat/Logic/NvPr.h \
	../../../PPTXFormat/Logic/NvSpPr.h \
	../../../PPTXFormat/Logic/Paragraph.h \
	../../../PPTXFormat/Logic/PartTitle.h \
	../../../PPTXFormat/Logic/Path.h \
	../../../PPTXFormat/Logic/Path2D.h \
	../../../PPTXFormat/Logic/Ph.h \
	../../../PPTXFormat/Logic/Pic.h \
	../../../PPTXFormat/Logic/PrstDash.h \
	../../../PPTXFormat/Logic/PrstGeom.h \
	../../../PPTXFormat/Logic/PrstTxWarp.h \
	../../../PPTXFormat/Logic/Rect.h \
	../../../PPTXFormat/Logic/Rot.h \
	../../../PPTXFormat/Logic/RunElem.h \
	../../../PPTXFormat/Logic/RunProperties.h \
	../../../PPTXFormat/Logic/Scene3d.h \
	../../../PPTXFormat/Logic/Shape.h \
	../../../PPTXFormat/Logic/ShapeStyle.h \
	../../../PPTXFormat/Logic/SmartArt.h \
	../../../PPTXFormat/Logic/Sp3d.h \
	../../../PPTXFormat/Logic/SpPr.h \
	../../../PPTXFormat/Logic/SpTree.h \
	../../../PPTXFormat/Logic/SpTreeElem.h \
	../../../PPTXFormat/Logic/StyleRef.h \
	../../../PPTXFormat/Logic/SupplementalFont.h \
	../../../PPTXFormat/Logic/Tab.h \
	../../../PPTXFormat/Logic/TableBgStyle.h \
	../../../PPTXFormat/Logic/TablePartStyle.h \
	../../../PPTXFormat/Logic/TableStyle.h \
	../../../PPTXFormat/Logic/TcBdr.h \
	../../../PPTXFormat/Logic/TcStyle.h \
	../../../PPTXFormat/Logic/TcTxStyle.h \
	../../../PPTXFormat/Logic/TextFit.h \
	../../../PPTXFormat/Logic/TextFont.h \
	../../../PPTXFormat/Logic/TextListStyle.h \
	../../../PPTXFormat/Logic/TextParagraphPr.h \
	../../../PPTXFormat/Logic/TextSpacing.h \
	../../../PPTXFormat/Logic/TxBody.h \
	../../../PPTXFormat/Logic/TxStyles.h \
	../../../PPTXFormat/Logic/UniColor.h \
	../../../PPTXFormat/Logic/UniEffect.h \
	../../../PPTXFormat/Logic/UniFill.h \
	../../../PPTXFormat/Logic/UniMedia.h \
	../../../PPTXFormat/Logic/UniPath2D.h \
	../../../PPTXFormat/Logic/Xfrm.h \
	../../../PPTXFormat/Logic/XmlId.h \
	\
	../../../PPTXFormat/Presentation/EmbeddedFont.h \
	../../../PPTXFormat/Presentation/EmbeddedFontDataId.h \
	../../../PPTXFormat/Presentation/Kinsoku.h \
	../../../PPTXFormat/Presentation/NotesSz.h \
	../../../PPTXFormat/Presentation/PhotoAlbum.h \
	../../../PPTXFormat/Presentation/SldSz.h \
	\
	../../../PPTXFormat/Theme/ClrScheme.h \
	../../../PPTXFormat/Theme/ExtraClrScheme.h \
	../../../PPTXFormat/Theme/FmtScheme.h \
	../../../PPTXFormat/Theme/FontScheme.h \
	../../../PPTXFormat/Theme/ThemeElements.h \
	\
	../../../PPTXFormat/ViewProps/CSldViewPr.h \
	../../../PPTXFormat/ViewProps/CViewPr.h \
	../../../PPTXFormat/ViewProps/GridSpacing.h \
	../../../PPTXFormat/ViewProps/Guide.h \
	../../../PPTXFormat/ViewProps/NormalViewPr.h \
	../../../PPTXFormat/ViewProps/NotesTextViewPr.h \
	../../../PPTXFormat/ViewProps/NotesViewPr.h \
	../../../PPTXFormat/ViewProps/Origin.h \
	../../../PPTXFormat/ViewProps/OutlineViewPr.h \
	../../../PPTXFormat/ViewProps/Ratio.h \
	../../../PPTXFormat/ViewProps/Restored.h \
	../../../PPTXFormat/ViewProps/Scale.h \
	../../../PPTXFormat/ViewProps/Sld.h \
	../../../PPTXFormat/ViewProps/SlideViewPr.h \
	../../../PPTXFormat/ViewProps/SorterViewPr.h \
	\
	../../../PPTXFormat/App.h \
	../../../PPTXFormat/CommentAuthors.h \
	../../../PPTXFormat/Comments.h \
	../../../PPTXFormat/LegacyDiagramText.h \
	../../../PPTXFormat/Core.h \
	../../../PPTXFormat/FileContainer.h \
	../../../PPTXFormat/FileFactory.h \
	../../../PPTXFormat/FileMap.h \
	../../../PPTXFormat/Folder.h \
	../../../PPTXFormat/HandoutMaster.h \
	../../../PPTXFormat/NotesMaster.h \
	../../../PPTXFormat/NotesSlide.h \
	../../../PPTXFormat/PPTX.h \
	../../../PPTXFormat/PPTXEvent.h \
	../../../PPTXFormat/Presentation.h \
	../../../PPTXFormat/PresProps.h \
	../../../PPTXFormat/Slide.h \
	../../../PPTXFormat/SlideLayout.h \
	../../../PPTXFormat/SlideMaster.h \
	../../../PPTXFormat/TableStyles.h \
	../../../PPTXFormat/Theme.h \
	../../../PPTXFormat/ViewProps.h \
	../../../PPTXFormat/WrapperFile.h \
	../../../PPTXFormat/WrapperWritingElement.h \
	\
	../../../Binary/Presentation/BinaryFileReaderWriter.h \
	../../../Binary/Presentation/BinReaderWriterDefines.h \
	../../../Binary/Presentation/BinWriters.h \
	../../../Binary/Presentation/CalculatorCRC32.h \
	../../../Binary/Presentation/Converter.h \
	../../../Binary/Presentation/FontCutter.h \
	../../../Binary/Presentation/FontPicker.h \
	../../../Binary/Presentation/imagemanager.h \
	../../../Binary/Presentation/PPTXWriter.h \
	../../../Binary/Presentation/WMFToImageConverter.h \
	../../../Binary/Presentation/DefaultNotesMaster.h \
	../../../Binary/Presentation/DefaultNotesTheme.h \
	\
	../../../Base/Nullable.h \
	../../../../HtmlRenderer/include/ASCSVGWriter.h \
	../../../../Common/FileDownloader/FileDownloader.h \
	\
	../../../PPTXFormat/ShowPr/Browse.h \
	../../../PPTXFormat/ShowPr/CustShow.h \
	../../../PPTXFormat/ShowPr/Kiosk.h \
	../../../PPTXFormat/ShowPr/Present.h \
	../../../PPTXFormat/ShowPr/ShowPr.h \
	../../../PPTXFormat/ShowPr/SldAll.h \
	../../../PPTXFormat/ShowPr/SldRg.h
