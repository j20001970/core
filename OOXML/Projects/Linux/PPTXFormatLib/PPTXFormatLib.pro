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

core_windows {
    QMAKE_CXXFLAGS_RELEASE += -Ob0
}

#BOOST
include($$PWD/../../../../Common/3dParty/boost/boost.pri)

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

core_release {
SOURCES += \
	pptx_format_logic.cpp
}

core_debug {
SOURCES += \
	../../../PPTXFormat/Logic/Media/WavAudioFile.cpp \
	../../../PPTXFormat/Logic/Colors/SchemeClr.cpp \
	../../../PPTXFormat/Logic/Fills/Blip.cpp \
	../../../PPTXFormat/Logic/Fills/BlipFill.cpp \
	../../../PPTXFormat/Logic/Table/TableCell.cpp \
	../../../PPTXFormat/Logic/Timing/BuildNodeBase.cpp \
	../../../PPTXFormat/Logic/Timing/TimeNodeBase.cpp \
	../../../PPTXFormat/Logic/Transitions/TransitionBase.cpp \
	../../../PPTXFormat/Logic/Bg.cpp \
	../../../PPTXFormat/Logic/CNvGrpSpPr.cpp \
	../../../PPTXFormat/Logic/ContentPart.cpp \
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
	../../../PPTXFormat/Logic/Runs/MathParaWrapper.cpp \
	../../../PPTXFormat/Logic/Controls.cpp \
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
	../../../PPTXFormat/Comments.cpp \
	../../../PPTXFormat/CommentAuthors.cpp
}

SOURCES += \
	pptx_format.cpp \
	../../../../MsBinaryFile/Common/Vml/BaseShape.cpp \
	../../../../MsBinaryFile/Common/Vml/toVmlConvert.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptFormula.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PptShape.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxFormula.cpp \
	../../../../MsBinaryFile/Common/Vml/PPTXShape/PptxShape.cpp \
	\
	../../../../MsBinaryFile/PptFile/Drawing/TextAttributesEx.cpp \
	../../../../MsBinaryFile/PptFile/Drawing/Elements.cpp \
	\
	../../../PPTXFormat/DrawingConverter/ASCOfficeDrawingConverter.cpp \
	../../../PPTXFormat/DrawingConverter/ASCOfficePPTXFileRealization.cpp \
	\
	../../../Binary/Presentation/imagemanager.cpp \
	../../../Binary/Presentation/FontPicker.cpp \
	../../../Binary/Presentation/BinaryFileReaderWriter.cpp \
	../../../Binary/Presentation/PPTXWriter.cpp \
	../../../Binary/Presentation/DefaultNotesTheme.cpp \
	../../../Binary/Presentation/DefaultNotesMaster.cpp \
	../../../Binary/Presentation/Converter.cpp \
	../../../Binary/Presentation/CalculatorCRC32.cpp \
	../../../Binary/Presentation/FontCutter.cpp \
	\
	../../../../HtmlRenderer/src/ASCSVGWriter.cpp

HEADERS += \
	../../../PPTXFormat/DrawingConverter/ASCOfficeDrawingConverter.h \
	../../../PPTXFormat/DrawingConverter/ASCOfficePPTXFile.h \
	../../../PPTXFormat/FileTypes.h \
	../../../PPTXFormat/Namespaces.h \
	../../../PPTXFormat/WritingVector.h \
	../../../PPTXFormat/Limit/AlbumLayout.h \
	../../../PPTXFormat/Limit/AnimationDgmBuild.h \
	../../../PPTXFormat/Limit/BaseLimit.h \
	../../../PPTXFormat/Limit/BevelType.h \
	../../../PPTXFormat/Limit/BlendMode.h \
	../../../PPTXFormat/Limit/BlipCompression.h \
	../../../PPTXFormat/Limit/BWMode.h \
	../../../PPTXFormat/Limit/CameraType.h \
	../../../PPTXFormat/Limit/ChartBuild.h \
	../../../PPTXFormat/Limit/ChartBuildType.h \
	../../../PPTXFormat/Limit/ColorSchemeIndex.h \
	../../../PPTXFormat/Limit/CompoundLine.h \
	../../../PPTXFormat/Limit/Conformance.h \
	../../../PPTXFormat/Limit/ContentStatus.h \
	../../../PPTXFormat/Limit/CornerDirectionVal.h \
	../../../PPTXFormat/Limit/DgmBuild.h \
	../../../PPTXFormat/Limit/DgmBuildType.h \
	../../../PPTXFormat/Limit/EffectContainerType.h \
	../../../PPTXFormat/Limit/EightDirectionVal.h \
	../../../PPTXFormat/Limit/FillPath.h \
	../../../PPTXFormat/Limit/Flip.h \
	../../../PPTXFormat/Limit/FontAlign.h \
	../../../PPTXFormat/Limit/FontStyleIndex.h \
	../../../PPTXFormat/Limit/FrameShape.h \
	../../../PPTXFormat/Limit/HorzOverflow.h \
	../../../PPTXFormat/Limit/InOutDirectionVal.h \
	../../../PPTXFormat/Limit/IterateType.h \
	../../../PPTXFormat/Limit/LastView.h \
	../../../PPTXFormat/Limit/LightRigType.h \
	../../../PPTXFormat/Limit/LineCap.h \
	../../../PPTXFormat/Limit/LineEndSize.h \
	../../../PPTXFormat/Limit/LineEndType.h \
	../../../PPTXFormat/Limit/Material.h \
	../../../PPTXFormat/Limit/OnOff.h \
	../../../PPTXFormat/Limit/Orient.h \
	../../../PPTXFormat/Limit/ParaBuildType.h \
	../../../PPTXFormat/Limit/PathFillMode.h \
	../../../PPTXFormat/Limit/PattFillVal.h \
	../../../PPTXFormat/Limit/PenAlign.h \
	../../../PPTXFormat/Limit/PlaceholderSize.h \
	../../../PPTXFormat/Limit/PlaceholderType.h \
	../../../PPTXFormat/Limit/PresetShadowVal.h \
	../../../PPTXFormat/Limit/PrstClrVal.h \
	../../../PPTXFormat/Limit/PrstDashVal.h \
	../../../PPTXFormat/Limit/RectAlign.h \
	../../../PPTXFormat/Limit/SchemeClrVal.h \
	../../../PPTXFormat/Limit/ShapeType.h \
	../../../PPTXFormat/Limit/SideDirectionVal.h \
	../../../PPTXFormat/Limit/SlideLayoutType.h \
	../../../PPTXFormat/Limit/SlideSize.h \
	../../../PPTXFormat/Limit/SplitterBarState.h \
	../../../PPTXFormat/Limit/SysClrVal.h \
	../../../PPTXFormat/Limit/TextAlign.h \
	../../../PPTXFormat/Limit/TextAnchor.h \
	../../../PPTXFormat/Limit/TextAutonumberScheme.h \
	../../../PPTXFormat/Limit/TextCaps.h \
	../../../PPTXFormat/Limit/TextShapeType.h \
	../../../PPTXFormat/Limit/TextStrike.h \
	../../../PPTXFormat/Limit/TextTabAlignType.h \
	../../../PPTXFormat/Limit/TextUnderline.h \
	../../../PPTXFormat/Limit/TextVerticalType.h \
	../../../PPTXFormat/Limit/TextWrap.h \
	../../../PPTXFormat/Limit/TLAccumulate.h \
	../../../PPTXFormat/Limit/TLAdditive.h \
	../../../PPTXFormat/Limit/TLCalcMode.h \
	../../../PPTXFormat/Limit/TLChartSubElement.h \
	../../../PPTXFormat/Limit/TLColorDirection.h \
	../../../PPTXFormat/Limit/TLColorSpace.h \
	../../../PPTXFormat/Limit/TLCommandType.h \
	../../../PPTXFormat/Limit/TLMasterRelation.h \
	../../../PPTXFormat/Limit/TLNextAc.h \
	../../../PPTXFormat/Limit/TLNodeFillType.h \
	../../../PPTXFormat/Limit/TLNodeType.h \
	../../../PPTXFormat/Limit/TLOrigin.h \
	../../../PPTXFormat/Limit/TLOverride.h \
	../../../PPTXFormat/Limit/TLPathEditMode.h \
	../../../PPTXFormat/Limit/TLPresetClass.h \
	../../../PPTXFormat/Limit/TLPrevAc.h \
	../../../PPTXFormat/Limit/TLRestart.h \
	../../../PPTXFormat/Limit/TLRuntimeTrigger.h \
	../../../PPTXFormat/Limit/TLSyncBehavior.h \
	../../../PPTXFormat/Limit/TLTransform.h \
	../../../PPTXFormat/Limit/TLTransition.h \
	../../../PPTXFormat/Limit/TLTriggerEvent.h \
	../../../PPTXFormat/Limit/TLValueType.h \
	../../../PPTXFormat/Limit/TransitionSpeed.h \
	../../../PPTXFormat/Limit/VariantType.h \
	../../../PPTXFormat/Limit/VertOverflow.h \
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
	../../../PPTXFormat/Logic/Colors/ColorBase.h \
	../../../PPTXFormat/Logic/Colors/ColorModifier.h \
	../../../PPTXFormat/Logic/Colors/PrstClr.h \
	../../../PPTXFormat/Logic/Colors/SchemeClr.h \
	../../../PPTXFormat/Logic/Colors/SrgbClr.h \
	../../../PPTXFormat/Logic/Colors/SysClr.h \
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
	../../../PPTXFormat/Logic/Fills/Blip.h \
	../../../PPTXFormat/Logic/Fills/BlipFill.h \
	../../../PPTXFormat/Logic/Fills/GradFill.h \
	../../../PPTXFormat/Logic/Fills/NoFill.h \
	../../../PPTXFormat/Logic/Fills/PattFill.h \
	../../../PPTXFormat/Logic/Fills/SolidFill.h \
	../../../PPTXFormat/Logic/Fills/Stretch.h \
	../../../PPTXFormat/Logic/Fills/Tile.h \
	../../../PPTXFormat/Logic/Media/AudioCD.h \
	../../../PPTXFormat/Logic/Media/MediaFile.h \
	../../../PPTXFormat/Logic/Media/WavAudioFile.h \
	../../../PPTXFormat/Logic/Path2D/ArcTo.h \
	../../../PPTXFormat/Logic/Path2D/Close.h \
	../../../PPTXFormat/Logic/Path2D/CubicBezTo.h \
	../../../PPTXFormat/Logic/Path2D/LineTo.h \
	../../../PPTXFormat/Logic/Path2D/MoveTo.h \
	../../../PPTXFormat/Logic/Path2D/PathBase.h \
	../../../PPTXFormat/Logic/Path2D/QuadBezTo.h \
	../../../PPTXFormat/Logic/Runs/Br.h \
	../../../PPTXFormat/Logic/Runs/Fld.h \
	../../../PPTXFormat/Logic/Runs/MathParaWrapper.h \
	../../../PPTXFormat/Logic/Runs/Run.h \
	../../../PPTXFormat/Logic/Runs/RunBase.h \
	../../../PPTXFormat/Logic/Table/Table.h \
	../../../PPTXFormat/Logic/Table/TableCell.h \
	../../../PPTXFormat/Logic/Table/TableCellProperties.h \
	../../../PPTXFormat/Logic/Table/TableCol.h \
	../../../PPTXFormat/Logic/Table/TableProperties.h \
	../../../PPTXFormat/Logic/Table/TableRow.h \
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
	../../../PPTXFormat/Logic/ContentPart.h \
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
	../../../PPTXFormat/Presentation/EmbeddedFont.h \
	../../../PPTXFormat/Presentation/EmbeddedFontDataId.h \
	../../../PPTXFormat/Presentation/Kinsoku.h \
	../../../PPTXFormat/Presentation/NotesSz.h \
	../../../PPTXFormat/Presentation/PhotoAlbum.h \
	../../../PPTXFormat/Presentation/SldSz.h \
	../../../PPTXFormat/Theme/ClrScheme.h \
	../../../PPTXFormat/Theme/ExtraClrScheme.h \
	../../../PPTXFormat/Theme/FmtScheme.h \
	../../../PPTXFormat/Theme/FontScheme.h \
	../../../PPTXFormat/Theme/ThemeElements.h \
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
	../../../Base/Nullable.h \
	../../../../HtmlRenderer/include/ASCSVGWriter.h \
	../../../../Common/FileDownloader/FileDownloader.h \
	../../../PPTXFormat/ShowPr/Browse.h \
	../../../PPTXFormat/ShowPr/CustShow.h \
	../../../PPTXFormat/ShowPr/Kiosk.h \
	../../../PPTXFormat/ShowPr/Present.h \
	../../../PPTXFormat/ShowPr/ShowPr.h \
	../../../PPTXFormat/ShowPr/SldAll.h \
	../../../PPTXFormat/ShowPr/SldRg.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/AccentBorderCallout2Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/AccentCallout1Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/AccentCallout2Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/AccentCallout3Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/AccentCallout90Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonBack.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonBeginning.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonBlank.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonDocument.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonEnd.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonHelp.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonHome.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonInfo.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonMovie.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonNext.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonReturn.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ActionButtonSound.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BentArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BentConnector.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BentUpArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BevelType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BlockArcType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BorderCallout1Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BorderCallout2Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BorderCallout3Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BorderCallout90Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BracePairType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/BracketPairType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Callout1Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Callout2Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Callout3Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Callout90Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CanType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ChevronType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CircularArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CloudCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CubeType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CurvedConnector.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CurvedDownArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CurvedLeftArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CurvedRightArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/CurvedUpArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/DiamondType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/DonutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/DownArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/DownArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/EllipseRibbon2Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/EllipseRibbonType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/EllipseType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartAlternateProcessType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartCollateType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartConnectorType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartDecisionType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartDelayType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartDisplayType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartDocumentType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartExtractType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartInputOutputType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartInternalStorageType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartMagneticDiskType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartMagneticDrumType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartMagneticTapeType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartManualInputType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartManualOperationType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartMergeType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartMultidocumentType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartOffpageConnectorType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartOnlineStorageType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartOrType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartPredefinedProcessType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartPreparationType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartProcessType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartPunchedCardType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartPunchedTapeType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartSortType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartSummingJunctionType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FlowChartTerminatorType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/FoldedCornerType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/HeartType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/HexagonType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/HomePlateType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/HorisontalScrollType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/IrregularSealOneType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/IrregularSealTwo.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/IsoscelesTriangleType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftBraceType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftBracketType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftRightArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftRightArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftRightUpArrow.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LeftUpArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LightningBoltType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/LineType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/MoonType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/NoSmokingType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/NotchedRightArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/OctagonType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/ParallelogramType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/PentagonType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/PlaqueType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/PlusType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/QuadArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/QuadArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RectangleType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RibbonDownType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RibbonUpType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RightArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RightArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RightBracetype.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RightBracketType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RightTriangleType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/RoundedRectangleType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Seal4Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Seal8Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Seal16Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Seal24Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Seal32Type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/SmileyFaceType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/Startype.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/StraightConnectorType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/StripedRightArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/SunType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/TextboxType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/TrapezoidType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/UpArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/UpArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/UpDownArrowCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/UpDownArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/UturnArrowType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/VerticalScrollType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/WaveDoubleType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/WaveType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/WedgeEllipseCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/WedgeRectCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/WedgeRoundedRectCalloutType.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/accentbordercallout1type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/accentbordercallout3type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/accentbordercallout90type.h \
	../../../../MsBinaryFile/Common/Vml/PPTShape/PPTAutoShapes/arctype.h \
	pptx_format.h
