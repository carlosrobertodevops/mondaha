import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'modal_membros_edit_model.dart';
export 'modal_membros_edit_model.dart';

class ModalMembrosEditWidget extends StatefulWidget {
  const ModalMembrosEditWidget({
    super.key,
    required this.membrosRow,
    required this.membrosFotos,
  });

  final MembrosViewRow? membrosRow;
  final List<String>? membrosFotos;

  @override
  State<ModalMembrosEditWidget> createState() => _ModalMembrosEditWidgetState();
}

class _ModalMembrosEditWidgetState extends State<ModalMembrosEditWidget>
    with TickerProviderStateMixin {
  late ModalMembrosEditModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalMembrosEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MODAL_MEMBROS_EDIT_modal_membros_edit_ON');
      _model.membrosFotoPathEdit =
          widget!.membrosFotos!.toList().cast<String>();
      _model.membrosAlcunhas =
          widget!.membrosRow!.alcunha.toList().cast<String>();
      _model.membrosEnderecos =
          widget!.membrosRow!.membroEndereco.toList().cast<String>();
      _model.membroAlerta = valueOrDefault<bool>(
        widget!.membrosRow?.alerta,
        false,
      );
      _model.membrosFaccaoTresLocais =
          widget!.membrosRow!.tresUltimoLocaisPreso.toList().cast<String>();
      _model.membrosPercetualValidacao = valueOrDefault<double>(
        widget!.membrosRow?.validacaoPrecentual,
        0.0,
      );
      _model.membrosLatLng = functions
          .convertStringsListToLngLatList(
              widget!.membrosRow!.coordenadas.toList())
          .toList()
          .cast<LatLng>();
      _model.uploadImageTemp = false;
      _model.updatePage(() {});
      await _model.googleMapMembrosController.future.then(
        (c) => c.animateCamera(
          CameraUpdate.newLatLng(functions
              .convertDoubleToLatLng(widget!.membrosRow!.membroLngLat.toList())
              .lastOrNull!
              .toGoogleMaps()),
        ),
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 8,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.txtNomeCompletoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.nomeCompleto,
      'não informado',
    ));
    _model.txtNomeCompletoFocusNode ??= FocusNode();

    _model.txtAlcunhaAddTextController ??= TextEditingController();
    _model.txtAlcunhaAddFocusNode ??= FocusNode();

    _model.txtMembroNaturalidadeTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.naturalidade,
      'não informado',
    ));
    _model.txtMembroNaturalidadeFocusNode ??= FocusNode();

    _model.txtNoIdentidadeTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.identidade,
      'não informado',
    ));
    _model.txtNoIdentidadeFocusNode ??= FocusNode();

    _model.txtNoCpfTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.cpf,
      '000.000.000-00',
    ));
    _model.txtNoCpfFocusNode ??= FocusNode();

    _model.txtNoInfopenTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.infopen,
      'não informado',
    ));
    _model.txtNoInfopenFocusNode ??= FocusNode();

    _model.txtFiliacaoMaeTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.filiacaoMae,
      'não informado',
    ));
    _model.txtFiliacaoMaeFocusNode ??= FocusNode();

    _model.txtFiliacaoPaiTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.filiacaoPai,
      'não informado',
    ));
    _model.txtFiliacaoPaiFocusNode ??= FocusNode();

    _model.txtMembrosEnderecosAddTextController ??= TextEditingController();
    _model.txtMembrosEnderecosAddFocusNode ??= FocusNode();

    _model.txtFaccaoBastismoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.batismo,
      'sem informação',
    ));

    _model.txtFacaoLocalBastismoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.batismoLocal,
      'sem informação',
    ));
    _model.txtFacaoLocalBastismoFocusNode ??= FocusNode();

    _model.txtMembrosFaccaoPadrinhoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.padrinho,
      'não  informação',
    ));
    _model.txtMembrosFaccaoPadrinhoFocusNode ??= FocusNode();

    _model.txtMembroFaccaoSenhaTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.faccaoSenha,
      'sem informação',
    ));
    _model.txtMembroFaccaoSenhaFocusNode ??= FocusNode();

    _model.txtFaccaoTresLocaisAddTextController ??= TextEditingController();
    _model.txtFaccaoTresLocaisAddFocusNode ??= FocusNode();

    _model.txtProcedimentoNoTextController ??= TextEditingController();
    _model.txtProcedimentoNoFocusNode ??= FocusNode();

    _model.txtProcedimentoDataTextController ??= TextEditingController();
    _model.txtProcedimentoDataFocusNode ??= FocusNode();

    _model.txtProcessoNoAcaoPenalTextController ??= TextEditingController();
    _model.txtProcessoNoAcaoPenalFocusNode ??= FocusNode();

    _model.txtHistoricoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.historico,
      'sem informação',
    ));
    _model.txtHistoricoFocusNode ??= FocusNode();

    _model.txtMembroAtuacaoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.atuacaoCrime,
      'sem informação',
    ));
    _model.txtMembroAtuacaoFocusNode ??= FocusNode();

    _model.switchAlertaValue = _model.membroAlerta;
    _model.txtMembroAlertaTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.alertaObservacao,
      'sem informação',
    ));
    _model.txtMembroAlertaFocusNode ??= FocusNode();

    _model.txtValidacoesObservacoesTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.membrosRow?.validacaoObservacao,
      'sem informação',
    ));
    _model.txtValidacoesObservacoesFocusNode ??= FocusNode();

    animationsMap.addAll({
      'blurOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.txtProcedimentoDataTextController?.text = dateTimeFormat(
            "d/M/y",
            _model.dataProcedimento,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 4.0,
          ),
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: 1440.0,
                          height: 900.0,
                          constraints: BoxConstraints(
                            minWidth: 1440.0,
                            minHeight: 900.0,
                            maxWidth: 1440.0,
                            maxHeight: 900.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Visibility(
                            visible: responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 0.0, 16.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mrof6r0b' /* Edit Member */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MODAL_MEMBROS_EDIT_close_rounded_ICN_ON_');
                                            Navigator.pop(context);

                                            context.pushNamed('main_membros');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: SafeArea(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.832,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Visibility(
                                                          visible:
                                                              responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment(
                                                                        0.0, 0),
                                                                child: TabBar(
                                                                  isScrollable:
                                                                      true,
                                                                  tabAlignment:
                                                                      TabAlignment
                                                                          .center,
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  unselectedLabelColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  unselectedLabelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                  indicatorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              2.0),
                                                                  tabs: [
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'k9ah28wo' /* Profile */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4ygu27wd' /* Localization */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'cnjcjjo2' /* Facção */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'psmcyd4s' /* Procedimentos */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ea22z8qc' /* Procedures */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'wmjb2mvz' /* Performance */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ms29ykns' /* Alert */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1xvu8k21' /* Validation */,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarController,
                                                                  onTap:
                                                                      (i) async {
                                                                    [
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {},
                                                                      () async {}
                                                                    ][i]();
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarController,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ke0ta3px' /* Upload images about the  membe... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Form(
                                                                                key: _model.formKey2,
                                                                                autovalidateMode: AutovalidateMode.always,
                                                                                child: SingleChildScrollView(
                                                                                  primary: false,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AlignedTooltip(
                                                                                                  content: Padding(
                                                                                                    padding: EdgeInsets.all(12.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '6p82su46' /* Edit one or more images about ... */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  offset: 1.0,
                                                                                                  preferredDirection: AxisDirection.up,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).background,
                                                                                                  elevation: 4.0,
                                                                                                  tailBaseWidth: 34.0,
                                                                                                  tailLength: 18.0,
                                                                                                  waitDuration: Duration(milliseconds: 10),
                                                                                                  showDuration: Duration(milliseconds: 100),
                                                                                                  triggerMode: TooltipTriggerMode.tap,
                                                                                                  child: Visibility(
                                                                                                    visible: _model.uploadedLocalFiles1.length < 1,
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Container_izaisg6b_ON');
                                                                                                        final selectedMedia = await selectMedia(
                                                                                                          maxWidth: 200.00,
                                                                                                          maxHeight: 200.00,
                                                                                                          mediaSource: MediaSource.photoGallery,
                                                                                                          multiImage: true,
                                                                                                        );
                                                                                                        if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                          safeSetState(() => _model.isDataUploading1 = true);
                                                                                                          var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                          try {
                                                                                                            showUploadMessage(
                                                                                                              context,
                                                                                                              'Uploading file...',
                                                                                                              showLoading: true,
                                                                                                            );
                                                                                                            selectedUploadedFiles = selectedMedia
                                                                                                                .map((m) => FFUploadedFile(
                                                                                                                      name: m.storagePath.split('/').last,
                                                                                                                      bytes: m.bytes,
                                                                                                                      height: m.dimensions?.height,
                                                                                                                      width: m.dimensions?.width,
                                                                                                                      blurHash: m.blurHash,
                                                                                                                    ))
                                                                                                                .toList();
                                                                                                          } finally {
                                                                                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                            _model.isDataUploading1 = false;
                                                                                                          }
                                                                                                          if (selectedUploadedFiles.length == selectedMedia.length) {
                                                                                                            safeSetState(() {
                                                                                                              _model.uploadedLocalFiles1 = selectedUploadedFiles;
                                                                                                            });
                                                                                                            showUploadMessage(context, 'Success!');
                                                                                                          } else {
                                                                                                            safeSetState(() {});
                                                                                                            showUploadMessage(context, 'Failed to upload data');
                                                                                                            return;
                                                                                                          }
                                                                                                        }

                                                                                                        _model.uploadImageTemp = true;
                                                                                                        safeSetState(() {});
                                                                                                        _model.membrosFotosFileTemp = _model.uploadedLocalFiles1.toList().cast<FFUploadedFile>();
                                                                                                        _model.updatePage(() {});
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                          border: Border.all(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: SingleChildScrollView(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Icon(
                                                                                                                  Icons.add_outlined,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'ur9hv9dp' /* Add Photos */,
                                                                                                                  ),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Stack(
                                                                                                        children: [
                                                                                                          if (_model.uploadImageTemp == false)
                                                                                                            Builder(
                                                                                                              builder: (context) {
                                                                                                                final fotosMembroPaths = _model.membrosFotoPathEdit.toList().take(6).toList();

                                                                                                                return SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: List.generate(fotosMembroPaths.length, (fotosMembroPathsIndex) {
                                                                                                                      final fotosMembroPathsItem = fotosMembroPaths[fotosMembroPathsIndex];
                                                                                                                      return Visibility(
                                                                                                                        visible: widget!.membrosFotos!.length >= 1,
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: Container(
                                                                                                                            width: 100.0,
                                                                                                                            height: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                              shape: BoxShape.rectangle,
                                                                                                                              border: Border.all(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                width: 2.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            child: SingleChildScrollView(
                                                                                                                              primary: false,
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Container(
                                                                                                                                            height: 100.0,
                                                                                                                                            child: Stack(
                                                                                                                                              children: [
                                                                                                                                                Padding(
                                                                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                                                                  child: InkWell(
                                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                                    onTap: () async {
                                                                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_ON_TAP');
                                                                                                                                                      await Navigator.push(
                                                                                                                                                        context,
                                                                                                                                                        PageTransition(
                                                                                                                                                          type: PageTransitionType.fade,
                                                                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                                                                            image: CachedNetworkImage(
                                                                                                                                                              fadeInDuration: Duration(milliseconds: 10),
                                                                                                                                                              fadeOutDuration: Duration(milliseconds: 10),
                                                                                                                                                              imageUrl: widget!.membrosFotos != null && (widget!.membrosFotos)!.isNotEmpty
                                                                                                                                                                  ? valueOrDefault<String>(
                                                                                                                                                                      fotosMembroPathsItem,
                                                                                                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                                    )
                                                                                                                                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                              fit: BoxFit.contain,
                                                                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                                                                                                'assets/images/error_image.png',
                                                                                                                                                                fit: BoxFit.contain,
                                                                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                            allowRotation: false,
                                                                                                                                                            tag: widget!.membrosFotos != null && (widget!.membrosFotos)!.isNotEmpty
                                                                                                                                                                ? valueOrDefault<String>(
                                                                                                                                                                    fotosMembroPathsItem,
                                                                                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png' + '$fotosMembroPathsIndex',
                                                                                                                                                                  )
                                                                                                                                                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                            useHeroAnimation: true,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      );
                                                                                                                                                    },
                                                                                                                                                    child: Hero(
                                                                                                                                                      tag: widget!.membrosFotos != null && (widget!.membrosFotos)!.isNotEmpty
                                                                                                                                                          ? valueOrDefault<String>(
                                                                                                                                                              fotosMembroPathsItem,
                                                                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png' + '$fotosMembroPathsIndex',
                                                                                                                                                            )
                                                                                                                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                      transitionOnUserGestures: true,
                                                                                                                                                      child: ClipRRect(
                                                                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                                                                        child: CachedNetworkImage(
                                                                                                                                                          fadeInDuration: Duration(milliseconds: 10),
                                                                                                                                                          fadeOutDuration: Duration(milliseconds: 10),
                                                                                                                                                          imageUrl: widget!.membrosFotos != null && (widget!.membrosFotos)!.isNotEmpty
                                                                                                                                                              ? valueOrDefault<String>(
                                                                                                                                                                  fotosMembroPathsItem,
                                                                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                                )
                                                                                                                                                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                                                          width: 100.0,
                                                                                                                                                          height: 68.0,
                                                                                                                                                          fit: BoxFit.contain,
                                                                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                                                                                            'assets/images/error_image.png',
                                                                                                                                                            width: 100.0,
                                                                                                                                                            height: 68.0,
                                                                                                                                                            fit: BoxFit.contain,
                                                                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Align(
                                                                                                                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                                                                    child: InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_COMP_IconAtual_ON_TAP');
                                                                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                                              context: context,
                                                                                                                                                              builder: (alertDialogContext) {
                                                                                                                                                                return AlertDialog(
                                                                                                                                                                  title: Text('Apagar Foto'),
                                                                                                                                                                  content: Text('Deseja apagar esta foto ?'),
                                                                                                                                                                  actions: [
                                                                                                                                                                    TextButton(
                                                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                                                      child: Text('Cancelar'),
                                                                                                                                                                    ),
                                                                                                                                                                    TextButton(
                                                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                                                      child: Text('Confirmar'),
                                                                                                                                                                    ),
                                                                                                                                                                  ],
                                                                                                                                                                );
                                                                                                                                                              },
                                                                                                                                                            ) ??
                                                                                                                                                            false;
                                                                                                                                                        if (confirmDialogResponse) {
                                                                                                                                                          _model.removeFromMembrosFotoPathEdit(_model.membrosFotoPathEdit.elementAtOrNull(fotosMembroPathsIndex)!);
                                                                                                                                                          safeSetState(() {});
                                                                                                                                                        }
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.do_not_disturb_on_rounded,
                                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                                        size: 24.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(height: 1.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }).divide(
                                                                                                                      SizedBox(width: 12.0),
                                                                                                                      filterFn: (fotosMembroPathsIndex) {
                                                                                                                        final fotosMembroPathsItem = fotosMembroPaths[fotosMembroPathsIndex];
                                                                                                                        return widget!.membrosFotos!.length >= 1;
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          if (_model.uploadImageTemp == true)
                                                                                                            Builder(
                                                                                                              builder: (context) {
                                                                                                                final fotosMembroPathsEdit = _model.uploadedLocalFiles1.toList().take(6).toList();

                                                                                                                return SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: List.generate(fotosMembroPathsEdit.length, (fotosMembroPathsEditIndex) {
                                                                                                                      final fotosMembroPathsEditItem = fotosMembroPathsEdit[fotosMembroPathsEditIndex];
                                                                                                                      return Visibility(
                                                                                                                        visible: _model.uploadedLocalFiles1.length >= 1,
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: Container(
                                                                                                                            width: 100.0,
                                                                                                                            height: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                              shape: BoxShape.rectangle,
                                                                                                                              border: Border.all(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                width: 2.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            child: SingleChildScrollView(
                                                                                                                              primary: false,
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Container(
                                                                                                                                            height: 100.0,
                                                                                                                                            child: Stack(
                                                                                                                                              children: [
                                                                                                                                                Padding(
                                                                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                                                                  child: InkWell(
                                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                                    onTap: () async {
                                                                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_edit_ON_T');
                                                                                                                                                      await Navigator.push(
                                                                                                                                                        context,
                                                                                                                                                        PageTransition(
                                                                                                                                                          type: PageTransitionType.fade,
                                                                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                                                                            image: Image.memory(
                                                                                                                                                              fotosMembroPathsEditItem.bytes ?? Uint8List.fromList([]),
                                                                                                                                                              fit: BoxFit.contain,
                                                                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                                                                'assets/images/error_image.png',
                                                                                                                                                                fit: BoxFit.contain,
                                                                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                            allowRotation: false,
                                                                                                                                                            tag: 'membroFotoEditTag',
                                                                                                                                                            useHeroAnimation: true,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      );
                                                                                                                                                    },
                                                                                                                                                    child: Hero(
                                                                                                                                                      tag: 'membroFotoEditTag',
                                                                                                                                                      transitionOnUserGestures: true,
                                                                                                                                                      child: ClipRRect(
                                                                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                                                                        child: Image.memory(
                                                                                                                                                          fotosMembroPathsEditItem.bytes ?? Uint8List.fromList([]),
                                                                                                                                                          width: 100.0,
                                                                                                                                                          height: 68.0,
                                                                                                                                                          fit: BoxFit.contain,
                                                                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                                                            'assets/images/error_image.png',
                                                                                                                                                            width: 100.0,
                                                                                                                                                            height: 68.0,
                                                                                                                                                            fit: BoxFit.contain,
                                                                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Align(
                                                                                                                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                                                                    child: InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_COMP_IconEdit_ON_TAP');
                                                                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                                              context: context,
                                                                                                                                                              builder: (alertDialogContext) {
                                                                                                                                                                return AlertDialog(
                                                                                                                                                                  title: Text('Apagar Foto'),
                                                                                                                                                                  content: Text('Deseja apagar esta foto ?'),
                                                                                                                                                                  actions: [
                                                                                                                                                                    TextButton(
                                                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                                                      child: Text('Cancelar'),
                                                                                                                                                                    ),
                                                                                                                                                                    TextButton(
                                                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                                                      child: Text('Confirmar'),
                                                                                                                                                                    ),
                                                                                                                                                                  ],
                                                                                                                                                                );
                                                                                                                                                              },
                                                                                                                                                            ) ??
                                                                                                                                                            false;
                                                                                                                                                        if (confirmDialogResponse) {
                                                                                                                                                          _model.removeAtIndexFromMembrosFotosFileTemp(fotosMembroPathsEditIndex);
                                                                                                                                                          safeSetState(() {});
                                                                                                                                                        }
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.do_not_disturb_on_rounded,
                                                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                                                        size: 24.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(height: 1.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }).divide(
                                                                                                                      SizedBox(width: 12.0),
                                                                                                                      filterFn: (fotosMembroPathsEditIndex) {
                                                                                                                        final fotosMembroPathsEditItem = fotosMembroPathsEdit[fotosMembroPathsEditIndex];
                                                                                                                        return _model.uploadedLocalFiles1.length >= 1;
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                if (_model.uploadedLocalFiles1.length >= 2)
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Container_csofx8w7_ON');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto(s)'),
                                                                                                                content: Text('Deseja apagar todas às fotos ?'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                    child: Text('Cancelar'),
                                                                                                                  ),
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                    child: Text('Confirmar'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          ) ??
                                                                                                          false;
                                                                                                      if (confirmDialogResponse) {
                                                                                                        safeSetState(() {
                                                                                                          _model.isDataUploading1 = false;
                                                                                                          _model.uploadedLocalFiles1 = [];
                                                                                                        });

                                                                                                        _model.membrosFotosFileTemp = _model.uploadedLocalFiles1.toList().cast<FFUploadedFile>();
                                                                                                        _model.uploadImageTemp = false;
                                                                                                        _model.membrosFotoPathEdit = widget!.membrosFotos!.toList().cast<String>();
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 100.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 2.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Icon(
                                                                                                                Icons.close_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '8o65ypej' /* Apagar Fotos */,
                                                                                                                ),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'e5cdst78' /* ATTENTION: (1) Front Photo, (2... */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 10,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtNomeCompletoTextController,
                                                                                              focusNode: _model.txtNomeCompletoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtNomeCompletoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              textCapitalization: TextCapitalization.words,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'w5sykx0y' /* Nome completo */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'nvqcp8ec' /* Nome completo */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtNomeCompletoTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtNomeCompletoTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtNomeCompletoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 6,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtAlcunhaAddTextController,
                                                                                              focusNode: _model.txtAlcunhaAddFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtAlcunhaAddTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  '1vl7zf7v' /* Alcunha */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  '4kwdolwf' /* Alcunha */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtAlcunhaAddTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtAlcunhaAddTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtAlcunhaAddTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                            icon: Icon(
                                                                                              Icons.add_rounded,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('MODAL_MEMBROS_EDIT_add_rounded_ICN_ON_TA');
                                                                                              if (_model.txtAlcunhaAddTextController.text != '') {
                                                                                                _model.addToMembrosAlcunhas(_model.txtAlcunhaAddTextController.text);
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Informação de Alcunha em branco !',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: AlignedTooltip(
                                                                                              content: Padding(
                                                                                                padding: EdgeInsets.all(12.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'w7cv57v9' /* To add nickname(s) you need to... */,
                                                                                                  ),
                                                                                                  textAlign: TextAlign.justify,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              offset: 1.0,
                                                                                              preferredDirection: AxisDirection.up,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).background,
                                                                                              elevation: 1.0,
                                                                                              tailBaseWidth: 24.0,
                                                                                              tailLength: 12.0,
                                                                                              waitDuration: Duration(milliseconds: 10),
                                                                                              showDuration: Duration(milliseconds: 100),
                                                                                              triggerMode: TooltipTriggerMode.tap,
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                child: Icon(
                                                                                                  Icons.help_outline_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 16,
                                                                                            child: Stack(
                                                                                              children: [
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final tagAlcunhaAtual = _model.membrosAlcunhas.toList().take(4).toList();

                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: List.generate(tagAlcunhaAtual.length, (tagAlcunhaAtualIndex) {
                                                                                                        final tagAlcunhaAtualItem = tagAlcunhaAtual[tagAlcunhaAtualIndex];
                                                                                                        return Expanded(
                                                                                                          child: Container(
                                                                                                            constraints: BoxConstraints(
                                                                                                              minHeight: 40.0,
                                                                                                              maxWidth: 40.0,
                                                                                                              maxHeight: 40.0,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 3.0, 0.0),
                                                                                                                            child: SelectionArea(
                                                                                                                                child: Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                tagAlcunhaAtualItem,
                                                                                                                                'sem informação',
                                                                                                                              ),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                  ),
                                                                                                                            )),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_l66sgap2_ON_TAP');
                                                                                                                            _model.removeAtIndexFromMembrosAlcunhas(tagAlcunhaAtualIndex);
                                                                                                                            safeSetState(() {});
                                                                                                                          },
                                                                                                                          child: Icon(
                                                                                                                            Icons.do_not_disturb_on_rounded,
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }).divide(SizedBox(width: 5.0)),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 7,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtMembroNaturalidadeTextController,
                                                                                              focusNode: _model.txtMembroNaturalidadeFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtMembroNaturalidadeTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  '5g8sploz' /* Naturalidade */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'jtptkah7' /* Naturalidade */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtMembroNaturalidadeTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtMembroNaturalidadeTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtMembroNaturalidadeTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<CargosRow>>(
                                                                                              future: CargosTable().queryRows(
                                                                                                queryFn: (q) => q.order('nome', ascending: true),
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<CargosRow> ddwEstadoCivilCargosRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<String>(
                                                                                                  controller: _model.ddwEstadoCivilValueController ??= FormFieldController<String>(
                                                                                                    _model.ddwEstadoCivilValue ??= valueOrDefault<String>(
                                                                                                      widget!.membrosRow?.estadoCivil,
                                                                                                      '0',
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '3gd33q8z' /* Solteiro */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'erxv49wt' /* Casado */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'jz0yn8g9' /* DIvorciado */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'jysjhv84' /* Viúvo(a) */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'hqhffu5x' /* Separados legalmente */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '97yj96r3' /* União estável */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6xmmx845' /* Nenhuma das opções */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwEstadoCivilValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '376qkuj9' /* Estado civil */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'e0w5gu3g' /* Estado civil */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtNoIdentidadeTextController,
                                                                                              focusNode: _model.txtNoIdentidadeFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtNoIdentidadeTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'mpy26dhu' /* Identidade */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'i89lld2e' /* Identidade */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtNoIdentidadeTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtNoIdentidadeTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: Color(0xFF757575),
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              keyboardType: TextInputType.number,
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtNoIdentidadeTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: FutureBuilder<List<CargosRow>>(
                                                                                              future: CargosTable().queryRows(
                                                                                                queryFn: (q) => q.order('nome', ascending: true),
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<CargosRow> ddwOrgaoExpedidorCargosRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwOrgaoExpedidorValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwOrgaoExpedidorValue ??= 1,
                                                                                                  ),
                                                                                                  options: List<int>.from([
                                                                                                    1,
                                                                                                    2,
                                                                                                    3,
                                                                                                    4,
                                                                                                    5,
                                                                                                    6,
                                                                                                    0
                                                                                                  ]),
                                                                                                  optionLabels: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'f9qpd698' /* SSP-AL */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'igwvj967' /* SSP-SE */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '4mwojz1l' /* SSP-CE */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '2yolvy23' /* SSP-PE */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '7b8nkrcy' /* SSP-BA */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'kofpbic2' /* SSP-RN */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'pb20k4aj' /* None of the options */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwOrgaoExpedidorValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'dajccisl' /* Issuing body */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'j0d9malw' /* Issuing body */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 8.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtNoCpfTextController,
                                                                                              focusNode: _model.txtNoCpfFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtNoCpfTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'q6ctm4ot' /* CPF */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'c3zop9x3' /* CPF */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtNoCpfTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtNoCpfTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              keyboardType: TextInputType.number,
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtNoCpfTextControllerValidator.asValidator(context),
                                                                                              inputFormatters: [
                                                                                                _model.txtNoCpfMask
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtNoInfopenTextController,
                                                                                              focusNode: _model.txtNoInfopenFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtNoInfopenTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'vxoztmy6' /* Infopen Registration */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'j1yyavjl' /* Infopen Registration */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtNoInfopenTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtNoInfopenTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              keyboardType: TextInputType.number,
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtNoInfopenTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 7,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtFiliacaoMaeTextController,
                                                                                              focusNode: _model.txtFiliacaoMaeFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtFiliacaoMaeTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              textCapitalization: TextCapitalization.words,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'krhrhn0s' /* Mother's name */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'tkiz3gkj' /* Mother's name */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtFiliacaoMaeTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtFiliacaoMaeTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtFiliacaoMaeTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FlutterFlowDropDown<String>(
                                                                                              controller: _model.ddwSituacaoMaeValueController ??= FormFieldController<String>(
                                                                                                _model.ddwSituacaoMaeValue ??= valueOrDefault<String>(
                                                                                                  widget!.membrosRow?.situacaoMae,
                                                                                                  'Sem informação',
                                                                                                ),
                                                                                              ),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'bplooifq' /* Alive */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ep6ekmqj' /* Deceased */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'i6z078qt' /* Wheelchair user */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '1bwfl3hj' /* No information */,
                                                                                                )
                                                                                              ],
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwSituacaoMaeValue = val),
                                                                                              height: 60.0,
                                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'xjs8q257' /* Mother's situation */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'irjc2od7' /* Mother's situation */,
                                                                                              ),
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                              borderWidth: 2.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                              hidesUnderline: true,
                                                                                              isOverButton: false,
                                                                                              isSearchable: true,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 7,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtFiliacaoPaiTextController,
                                                                                              focusNode: _model.txtFiliacaoPaiFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtFiliacaoPaiTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              textCapitalization: TextCapitalization.words,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'ouy1c8ur' /* Father's name */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'ix1jiwav' /* Father's name */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtFiliacaoPaiTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtFiliacaoPaiTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtFiliacaoPaiTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FlutterFlowDropDown<String>(
                                                                                              controller: _model.ddwSituacaoPaiValueController ??= FormFieldController<String>(
                                                                                                _model.ddwSituacaoPaiValue ??= valueOrDefault<String>(
                                                                                                  widget!.membrosRow?.situacaoPai,
                                                                                                  'Sem informação',
                                                                                                ),
                                                                                              ),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '9xmfavbn' /* Alive */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'jle1z10y' /* Deceased */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'kb5u39m0' /* Wheelchair user */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '6rfxzdzd' /* No information */,
                                                                                                )
                                                                                              ],
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwSituacaoPaiValue = val),
                                                                                              height: 60.0,
                                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                's6zvdxr8' /* Father's situation */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'ccj1ds3a' /* Father's situation */,
                                                                                              ),
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                              borderWidth: 2.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                              hidesUnderline: true,
                                                                                              isOverButton: false,
                                                                                              isSearchable: true,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FlutterFlowDropDown<String>(
                                                                                              controller: _model.ddwNivelInstrucaoValueController ??= FormFieldController<String>(
                                                                                                _model.ddwNivelInstrucaoValue ??= valueOrDefault<String>(
                                                                                                  widget!.membrosRow?.nivelInstrucao,
                                                                                                  'Sem informação',
                                                                                                ),
                                                                                              ),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '9329nqhh' /* Alfabetizado */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'h82r5ahb' /* illiterate */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'b4hs4oir' /* Completed elementary education */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'bmaqd70i' /* Completed high school */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '84xcyv8t' /* Completed higher education */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'r2u2ao1z' /* Incomplete elementary educatio... */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'lgo3vh2e' /* Incomplete high school */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ti25rp88' /* Incomplete higher education */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ct3cerf6' /* No information */,
                                                                                                )
                                                                                              ],
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwNivelInstrucaoValue = val),
                                                                                              height: 60.0,
                                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'zqm3dbsf' /* Degree or Level of Education */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'tvx59t7r' /* Degree or Level of Education */,
                                                                                              ),
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                              borderWidth: 2.0,
                                                                                              borderRadius: 12.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                              hidesUnderline: true,
                                                                                              isOverButton: false,
                                                                                              isSearchable: true,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 13.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children:
                                                                            [
                                                                          Form(
                                                                            key:
                                                                                _model.formKey4,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowRadioButton(
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'rv30tq8h' /* Nascido no Brasil */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'c7le5m4q' /* Naturalizado Brasileiro */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'dxpi3ilr' /* Estrangeiro */,
                                                                                            )
                                                                                          ].toList(),
                                                                                          onChanged: (val) => safeSetState(() {}),
                                                                                          controller: _model.rbNacionalidadeValueController ??= FormFieldController<String>(valueOrDefault<String>(
                                                                                            widget!.membrosRow?.nacionalidade,
                                                                                            'Nascido no Brasil',
                                                                                          )),
                                                                                          optionHeight: 32.0,
                                                                                          textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          buttonPosition: RadioButtonPosition.left,
                                                                                          direction: Axis.horizontal,
                                                                                          radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                          inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          toggleable: false,
                                                                                          horizontalAlignment: WrapAlignment.start,
                                                                                          verticalAlignment: WrapCrossAlignment.start,
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 4,
                                                                                          child: FutureBuilder<List<EstadosRow>>(
                                                                                            future: EstadosTable().queryRows(
                                                                                              queryFn: (q) => q.order('sigla', ascending: true),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: SpinKitFadingCircle(
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      size: 50.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<EstadosRow> ddwEstadoEstadosRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<int>(
                                                                                                controller: _model.ddwEstadoValueController ??= FormFieldController<int>(
                                                                                                  _model.ddwEstadoValue ??= valueOrDefault<int>(
                                                                                                    widget!.membrosRow?.estadoId,
                                                                                                    27,
                                                                                                  ),
                                                                                                ),
                                                                                                options: List<int>.from(ddwEstadoEstadosRowList.map((e) => e.estadoId).toList()),
                                                                                                optionLabels: ddwEstadoEstadosRowList.map((e) => e.sigla).withoutNulls.toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.ddwEstadoValue = val),
                                                                                                height: 60.0,
                                                                                                searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'cs1z62f2' /* Estado */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  'r00quxoo' /* Search... */,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                borderWidth: 2.0,
                                                                                                borderRadius: 12.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                hidesUnderline: true,
                                                                                                isOverButton: false,
                                                                                                isSearchable: true,
                                                                                                isMultiSelect: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 4,
                                                                                          child: FutureBuilder<List<MunicipiosRow>>(
                                                                                            future: MunicipiosTable().queryRows(
                                                                                              queryFn: (q) => q.eqOrNull(
                                                                                                'estado_id',
                                                                                                valueOrDefault<int>(
                                                                                                  _model.ddwEstadoValue,
                                                                                                  27,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: SpinKitFadingCircle(
                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                      size: 50.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<MunicipiosRow> ddwMunicipioMunicipiosRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<int>(
                                                                                                controller: _model.ddwMunicipioValueController ??= FormFieldController<int>(
                                                                                                  _model.ddwMunicipioValue ??= valueOrDefault<int>(
                                                                                                    widget!.membrosRow?.municipioId,
                                                                                                    1697,
                                                                                                  ),
                                                                                                ),
                                                                                                options: List<int>.from(ddwMunicipioMunicipiosRowList.map((e) => e.id).toList()),
                                                                                                optionLabels: ddwMunicipioMunicipiosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.ddwMunicipioValue = val),
                                                                                                height: 60.0,
                                                                                                searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'ahnx5j5c' /* Municipio */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  '9cu0wlw8' /* Search... */,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                borderWidth: 2.0,
                                                                                                borderRadius: 12.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                hidesUnderline: true,
                                                                                                isOverButton: false,
                                                                                                isSearchable: true,
                                                                                                isMultiSelect: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Container(
                                                                                              height: 60.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 2.0,
                                                                                                ),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 10,
                                                                                                      child: FlutterFlowPlacePicker(
                                                                                                        iOSGoogleMapsApiKey: 'AIzaSyAXl9JxuELU_e72s3EGlFpYxDl9qYfBbhk',
                                                                                                        androidGoogleMapsApiKey: 'AIzaSyBcGx3xp4aFRIyFf4Y_XZkncYwgi0sz0wQ',
                                                                                                        webGoogleMapsApiKey: 'AIzaSyDHKjsC9REXC2lUer2xphTKmRXZNH2p00Q',
                                                                                                        onSelect: (place) async {
                                                                                                          safeSetState(() => _model.placePickerEnderecoValue = place);
                                                                                                        },
                                                                                                        defaultText: FFLocalizations.of(context).getText(
                                                                                                          'hnm8bibm' /*  */,
                                                                                                        ),
                                                                                                        icon: Icon(
                                                                                                          Icons.place_outlined,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                        buttonOptions: FFButtonOptions(
                                                                                                          width: 40.0,
                                                                                                          height: 40.0,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          textStyle: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontWeight: FontWeight.w100,
                                                                                                          ),
                                                                                                          elevation: 0.0,
                                                                                                          borderSide: BorderSide(
                                                                                                            color: Colors.transparent,
                                                                                                            width: 0.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      flex: 5,
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_k0jh7728_ON_TAP');
                                                                                                          if (_model.placePickerEnderecoValue.address != _model.txtMembrosEnderecosAddTextController.text) {
                                                                                                            safeSetState(() {
                                                                                                              _model.txtMembrosEnderecosAddTextController?.text = '${_model.placePickerEnderecoValue.address}';
                                                                                                            });
                                                                                                          }
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.arrow_forward_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 36.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 15,
                                                                                            child: Container(
                                                                                              width: 200.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.txtMembrosEnderecosAddTextController,
                                                                                                focusNode: _model.txtMembrosEnderecosAddFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.txtMembrosEnderecosAddTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () => safeSetState(() {}),
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                textCapitalization: TextCapitalization.sentences,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'ly0oxbkr' /* Endereço Completo */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'rra20pji' /* Endereço Completo */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                  suffixIcon: _model.txtMembrosEnderecosAddTextController!.text.isNotEmpty
                                                                                                      ? InkWell(
                                                                                                          onTap: () async {
                                                                                                            _model.txtMembrosEnderecosAddTextController?.clear();
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.clear,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        )
                                                                                                      : null,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.txtMembrosEnderecosAddTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                            icon: Icon(
                                                                                              Icons.add_rounded,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('MODAL_MEMBROS_EDIT_add_rounded_ICN_ON_TA');
                                                                                              if (_model.txtMembrosEnderecosAddTextController.text != '') {
                                                                                                _model.addToMembrosEnderecos(_model.txtMembrosEnderecosAddTextController.text);
                                                                                                _model.updatePage(() {});
                                                                                                _model.addToMembrosLatLng(_model.placePickerEnderecoValue.latLng);
                                                                                                _model.updatePage(() {});
                                                                                                await _model.googleMapMembrosController.future.then(
                                                                                                  (c) => c.animateCamera(
                                                                                                    CameraUpdate.newLatLng(_model.membrosLatLng.lastOrNull!.toGoogleMaps()),
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Informação de Endereço em branco !',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                          Flex(
                                                                                            direction: Axis.vertical,
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AlignedTooltip(
                                                                                                content: Padding(
                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'oq7cugr2' /* To add the address(es) you nee... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                offset: 4.0,
                                                                                                preferredDirection: AxisDirection.up,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).background,
                                                                                                elevation: 4.0,
                                                                                                tailBaseWidth: 24.0,
                                                                                                tailLength: 12.0,
                                                                                                waitDuration: Duration(milliseconds: 10),
                                                                                                showDuration: Duration(milliseconds: 100),
                                                                                                triggerMode: TooltipTriggerMode.tap,
                                                                                                child: Icon(
                                                                                                  Icons.help_outline_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final listMembrosEnderecos = (widget!.membrosRow?.membroEndereco?.map((e) => e).toList()?.toList() ?? []).take(4).toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(listMembrosEnderecos.length, (listMembrosEnderecosIndex) {
                                                                                              final listMembrosEnderecosItem = listMembrosEnderecos[listMembrosEnderecosIndex];
                                                                                              return Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    shape: BoxShape.rectangle,
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: SingleChildScrollView(
                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 3.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        listMembrosEnderecosItem,
                                                                                                                        'sem informação',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_0zi6c35d_ON_TAP');
                                                                                                                      _model.removeAtIndexFromMembrosEnderecos(listMembrosEnderecosIndex);
                                                                                                                      _model.removeAtIndexFromMembrosLatLng(listMembrosEnderecosIndex);
                                                                                                                      _model.updatePage(() {});
                                                                                                                    },
                                                                                                                    child: Icon(
                                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 10.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              child: Container(
                                                                                                width: 1084.0,
                                                                                                height: 490.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Visibility(
                                                                                                  visible: responsiveVisibility(
                                                                                                    context: context,
                                                                                                    phone: false,
                                                                                                    tablet: false,
                                                                                                    tabletLandscape: false,
                                                                                                  ),
                                                                                                  child: FlutterFlowGoogleMap(
                                                                                                    controller: _model.googleMapMembrosController,
                                                                                                    onCameraIdle: (latLng) => _model.googleMapMembrosCenter = latLng,
                                                                                                    initialLocation: _model.googleMapMembrosCenter ??= LatLng(-8.77, -70.55),
                                                                                                    markers: _model.membrosLatLng
                                                                                                        .map(
                                                                                                          (marker) => FlutterFlowMarker(
                                                                                                            marker.serialize(),
                                                                                                            marker,
                                                                                                          ),
                                                                                                        )
                                                                                                        .toList(),
                                                                                                    markerColor: GoogleMarkerColor.violet,
                                                                                                    mapType: MapType.normal,
                                                                                                    style: GoogleMapStyle.standard,
                                                                                                    initialZoom: 9.0,
                                                                                                    allowInteraction: true,
                                                                                                    allowZoom: true,
                                                                                                    showZoomControls: true,
                                                                                                    showLocation: true,
                                                                                                    showCompass: false,
                                                                                                    showMapToolbar: false,
                                                                                                    showTraffic: false,
                                                                                                    centerMapOnMarkerTap: true,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 13.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'qdml4d4b' /* Informe os dados sobre o membr... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Form(
                                                                                key: _model.formKey6,
                                                                                autovalidateMode: AutovalidateMode.disabled,
                                                                                child: SingleChildScrollView(
                                                                                  primary: false,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 5,
                                                                                            child: FutureBuilder<List<FaccoesRow>>(
                                                                                              future: FaccoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FaccoesRow> ddwMembroFaccaoFaccoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwMembroFaccaoValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwMembroFaccaoValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.faccaoId,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwMembroFaccaoFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                                  optionLabels: ddwMembroFaccaoFaccoesRowList
                                                                                                      .map((e) => valueOrDefault<String>(
                                                                                                            e.nome,
                                                                                                            'nome_faccao',
                                                                                                          ))
                                                                                                      .toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwMembroFaccaoValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'xl2fd0vq' /* Facções */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'aeh7s14i' /* Search... */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 10,
                                                                                            child: Autocomplete<String>(
                                                                                              initialValue: TextEditingValue(
                                                                                                  text: valueOrDefault<String>(
                                                                                                widget!.membrosRow?.batismo,
                                                                                                'sem informação',
                                                                                              )),
                                                                                              optionsBuilder: (textEditingValue) {
                                                                                                if (textEditingValue.text == '') {
                                                                                                  return const Iterable<String>.empty();
                                                                                                }
                                                                                                return [
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'dogrlmh2' /* Option 1 */,
                                                                                                  )
                                                                                                ].where((option) {
                                                                                                  final lowercaseOption = option.toLowerCase();
                                                                                                  return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                                                                                });
                                                                                              },
                                                                                              optionsViewBuilder: (context, onSelected, options) {
                                                                                                return AutocompleteOptionsList(
                                                                                                  textFieldKey: _model.txtFaccaoBastismoKey,
                                                                                                  textController: _model.txtFaccaoBastismoTextController!,
                                                                                                  options: options.toList(),
                                                                                                  onSelected: onSelected,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textHighlightStyle: TextStyle(),
                                                                                                  elevation: 4.0,
                                                                                                  optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  maxHeight: 200.0,
                                                                                                );
                                                                                              },
                                                                                              onSelected: (String selection) {
                                                                                                safeSetState(() => _model.txtFaccaoBastismoSelectedOption = selection);
                                                                                                FocusScope.of(context).unfocus();
                                                                                              },
                                                                                              fieldViewBuilder: (
                                                                                                context,
                                                                                                textEditingController,
                                                                                                focusNode,
                                                                                                onEditingComplete,
                                                                                              ) {
                                                                                                _model.txtFaccaoBastismoFocusNode = focusNode;

                                                                                                _model.txtFaccaoBastismoTextController = textEditingController;
                                                                                                return TextFormField(
                                                                                                  key: _model.txtFaccaoBastismoKey,
                                                                                                  controller: textEditingController,
                                                                                                  focusNode: focusNode,
                                                                                                  onEditingComplete: onEditingComplete,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.txtFaccaoBastismoTextController',
                                                                                                    Duration(milliseconds: 2000),
                                                                                                    () => safeSetState(() {}),
                                                                                                  ),
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'xjptg11e' /* Batismo */,
                                                                                                    ),
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                    alignLabelWithHint: true,
                                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                                      '6v0cqlza' /* Batismo */,
                                                                                                    ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 2.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                    suffixIcon: _model.txtFaccaoBastismoTextController!.text.isNotEmpty
                                                                                                        ? InkWell(
                                                                                                            onTap: () async {
                                                                                                              _model.txtFaccaoBastismoTextController?.clear();
                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                            child: Icon(
                                                                                                              Icons.clear,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          )
                                                                                                        : null,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                  validator: _model.txtFaccaoBastismoTextControllerValidator.asValidator(context),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 10,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtFacaoLocalBastismoTextController,
                                                                                              focusNode: _model.txtFacaoLocalBastismoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtFacaoLocalBastismoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'cf5s57p2' /* Local do Batismo */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'cnje2664' /* Local do Batismo */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtFacaoLocalBastismoTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtFacaoLocalBastismoTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtFacaoLocalBastismoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 10,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtMembrosFaccaoPadrinhoTextController,
                                                                                              focusNode: _model.txtMembrosFaccaoPadrinhoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtMembrosFaccaoPadrinhoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'hhjoqbhs' /* Padrinho */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  '5riq3olw' /* Padrinho */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtMembrosFaccaoPadrinhoTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtMembrosFaccaoPadrinhoTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtMembrosFaccaoPadrinhoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 10,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtMembroFaccaoSenhaTextController,
                                                                                              focusNode: _model.txtMembroFaccaoSenhaFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtMembroFaccaoSenhaTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'e7yxmlgy' /* Senha */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'ditgfsol' /* Senha */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtMembroFaccaoSenhaTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtMembroFaccaoSenhaTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtMembroFaccaoSenhaTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<CargosRow>>(
                                                                                              future: CargosTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<CargosRow> ddwMembroFaccaoCargoAtualCargosRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwMembroFaccaoCargoAtualValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwMembroFaccaoCargoAtualValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.cargoId,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwMembroFaccaoCargoAtualCargosRowList.map((e) => e.cargoId).toList()),
                                                                                                  optionLabels: ddwMembroFaccaoCargoAtualCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwMembroFaccaoCargoAtualValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '59iro2id' /* Cargo atual */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'gngb08sa' /* Marital status */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<CargosRow>>(
                                                                                              future: CargosTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<CargosRow> ddwMembroFaccaoCargoAnteriorCargosRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwMembroFaccaoCargoAnteriorValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwMembroFaccaoCargoAnteriorValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.cargoAntId,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwMembroFaccaoCargoAnteriorCargosRowList.map((e) => e.cargoId).toList()),
                                                                                                  optionLabels: ddwMembroFaccaoCargoAnteriorCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwMembroFaccaoCargoAnteriorValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'quuz7zye' /* Cargo anterior */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'd3cmqj3p' /* Marital status */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<FuncoesRow>>(
                                                                                              future: FuncoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FuncoesRow> ddwFaccaoFuncaoAtualFuncoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwFaccaoFuncaoAtualValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwFaccaoFuncaoAtualValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.funcaoId,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwFaccaoFuncaoAtualFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                                  optionLabels: ddwFaccaoFuncaoAtualFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwFaccaoFuncaoAtualValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'ko64ck8f' /* Função atual */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'ny2qyhwa' /* Mother's Situation */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<FuncoesRow>>(
                                                                                              future: FuncoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FuncoesRow> ddwFaccaoFuncaoAnteriorFuncoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwFaccaoFuncaoAnteriorValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwFaccaoFuncaoAnteriorValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.funcaoAntId,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwFaccaoFuncaoAnteriorFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                                  optionLabels: ddwFaccaoFuncaoAnteriorFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwFaccaoFuncaoAnteriorValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'cef8iv8t' /* Função anterior */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'zcb0w779' /* Função anterior */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: TextFormField(
                                                                                              controller: _model.txtFaccaoTresLocaisAddTextController,
                                                                                              focusNode: _model.txtFaccaoTresLocaisAddFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.txtFaccaoTresLocaisAddTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'ih41eqh3' /* Três últimos locais onde estev... */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  '2b3vlzt9' /* Três últimos locais onde estev... */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                suffixIcon: _model.txtFaccaoTresLocaisAddTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.txtFaccaoTresLocaisAddTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.txtFaccaoTresLocaisAddTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                          FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                            icon: Icon(
                                                                                              Icons.add_rounded,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('MODAL_MEMBROS_EDIT_add_rounded_ICN_ON_TA');
                                                                                              if (_model.txtFaccaoTresLocaisAddTextController.text != '') {
                                                                                                _model.addToMembrosFaccaoTresLocais(_model.txtFaccaoTresLocaisAddTextController.text);
                                                                                                safeSetState(() {});
                                                                                                safeSetState(() {
                                                                                                  _model.txtFaccaoTresLocaisAddTextController?.text = _model.membrosLimpar!;
                                                                                                });
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Informação de Local em branco !',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                          Flex(
                                                                                            direction: Axis.vertical,
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AlignedTooltip(
                                                                                                content: Padding(
                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'o0jo1yy1' /* To add the name of the Prison(... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                offset: 4.0,
                                                                                                preferredDirection: AxisDirection.up,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).background,
                                                                                                elevation: 4.0,
                                                                                                tailBaseWidth: 24.0,
                                                                                                tailLength: 12.0,
                                                                                                waitDuration: Duration(milliseconds: 10),
                                                                                                showDuration: Duration(milliseconds: 100),
                                                                                                triggerMode: TooltipTriggerMode.tap,
                                                                                                child: Icon(
                                                                                                  Icons.help_outline_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 7,
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final childenTresLocais = (widget!.membrosRow?.tresUltimoLocaisPreso?.map((e) => e).toList()?.toList() ?? []).take(3).toList();

                                                                                                return Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: List.generate(childenTresLocais.length, (childenTresLocaisIndex) {
                                                                                                    final childenTresLocaisItem = childenTresLocais[childenTresLocaisIndex];
                                                                                                    return Expanded(
                                                                                                      child: Container(
                                                                                                        constraints: BoxConstraints(
                                                                                                          minWidth: 200.0,
                                                                                                          minHeight: 40.0,
                                                                                                          maxWidth: 200.0,
                                                                                                          maxHeight: 40.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                          border: Border.all(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 2.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 3.0, 0.0),
                                                                                                                      child: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          childenTresLocaisItem,
                                                                                                                          'sem informação',
                                                                                                                        ),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_2amd1xsv_ON_TAP');
                                                                                                                      _model.removeAtIndexFromMembrosFaccaoTresLocais(childenTresLocaisIndex);
                                                                                                                      safeSetState(() {});
                                                                                                                    },
                                                                                                                    child: Icon(
                                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }).divide(SizedBox(width: 5.0)),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<FaccoesRow>>(
                                                                                              future: FaccoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FaccoesRow> ddwFaccaoIntegrouFaccoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwFaccaoIntegrouValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwFaccaoIntegrouValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.faccaoIntegrou,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwFaccaoIntegrouFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                                  optionLabels: ddwFaccaoIntegrouFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwFaccaoIntegrouValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'y51s0a4a' /* Facção que integrou */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    's414x980' /* Facção que integrou */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<FaccoesRow>>(
                                                                                              future: FaccoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FaccoesRow> ddwFaccaoAliadaFaccoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwFaccaoAliadaValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwFaccaoAliadaValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.faccaoAliada,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwFaccaoAliadaFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                                  optionLabels: ddwFaccaoAliadaFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwFaccaoAliadaValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'poxkn72j' /* Facção aliada */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'lf0kdlrj' /* Father's Situation */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: FutureBuilder<List<FaccoesRow>>(
                                                                                              future: FaccoesTable().queryRows(
                                                                                                queryFn: (q) => q,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitFadingCircle(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<FaccoesRow> ddwFaccaoInimigaFaccoesRowList = snapshot.data!;

                                                                                                return FlutterFlowDropDown<int>(
                                                                                                  controller: _model.ddwFaccaoInimigaValueController ??= FormFieldController<int>(
                                                                                                    _model.ddwFaccaoInimigaValue ??= valueOrDefault<int>(
                                                                                                      widget!.membrosRow?.faccaoInimiga,
                                                                                                      0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  options: List<int>.from(ddwFaccaoInimigaFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                                  optionLabels: ddwFaccaoInimigaFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                  onChanged: (val) => safeSetState(() => _model.ddwFaccaoInimigaValue = val),
                                                                                                  height: 60.0,
                                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'qoaljcyj' /* Facção Inimiga */,
                                                                                                  ),
                                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                                    'kyck9l0a' /* Facção Inimiga */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  borderWidth: 2.0,
                                                                                                  borderRadius: 12.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: true,
                                                                                                  isMultiSelect: false,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 15.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Form(
                                                                            key:
                                                                                _model.formKey7,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'abyvcswu' /* Informe os dados sobre os Proc... */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 6,
                                                                                      child: TextFormField(
                                                                                        controller: _model.txtProcedimentoNoTextController,
                                                                                        focusNode: _model.txtProcedimentoNoFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.txtProcedimentoNoTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () => safeSetState(() {}),
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          labelText: FFLocalizations.of(context).getText(
                                                                                            '8161octx' /* Procedure */,
                                                                                          ),
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          alignLabelWithHint: true,
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '8ntbb2dd' /* Procedure */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                          suffixIcon: _model.txtProcedimentoNoTextController!.text.isNotEmpty
                                                                                              ? InkWell(
                                                                                                  onTap: () async {
                                                                                                    _model.txtProcedimentoNoTextController?.clear();
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.clear,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                )
                                                                                              : null,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        keyboardType: TextInputType.number,
                                                                                        cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                        validator: _model.txtProcedimentoNoTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.ddwProcedimentoUnidadeValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '9stqikkv' /* None of the options */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'rzqzpi0m' /* Local Police Station */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '2kwsxw2d' /* Specialized Police Station */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'tyhmh5h2' /* Regional Police Station */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.ddwProcedimentoUnidadeValue = val),
                                                                                        height: 60.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'lnka4hga' /* Unit */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          '3axxs613' /* Search... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 12.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.ddwProcedimentoTipoValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'fw17rxzs' /* None of the options */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'svxh2i0k' /* IPL. Ordinance */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ep4gxxhb' /* IPL. Flagrant */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            's1n13x72' /* T.C.O */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.ddwProcedimentoTipoValue = val),
                                                                                        height: 60.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'vo99wbnv' /* Type of procedure */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          '7nlyqa72' /* Search... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 12.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.ddwProcedimentoCrimeValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'nejyraec' /* None of the options */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6c8g2qgh' /* Drug trafficking */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '9fs640vk' /* Qualified Robbery */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '1t1wiajk' /* Bodily Injury */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '0xpzu6xy' /* Murder */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.ddwProcedimentoCrimeValue = val),
                                                                                        height: 60.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '87yw9sc4' /* Crime */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          's6islip8' /* Search... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 12.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 3,
                                                                                      child: TextFormField(
                                                                                        controller: _model.txtProcedimentoDataTextController,
                                                                                        focusNode: _model.txtProcedimentoDataFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.txtProcedimentoDataTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () => safeSetState(() {}),
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          labelText: FFLocalizations.of(context).getText(
                                                                                            'gtbdcue3' /* Procedure Date */,
                                                                                          ),
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          alignLabelWithHint: true,
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'e9e55r1p' /* Procedure Date */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                          suffixIcon: _model.txtProcedimentoDataTextController!.text.isNotEmpty
                                                                                              ? InkWell(
                                                                                                  onTap: () async {
                                                                                                    _model.txtProcedimentoDataTextController?.clear();
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.clear,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                )
                                                                                              : null,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        keyboardType: TextInputType.datetime,
                                                                                        cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                        validator: _model.txtProcedimentoDataTextControllerValidator.asValidator(context),
                                                                                        inputFormatters: [
                                                                                          _model.txtProcedimentoDataMask
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderRadius: 8.0,
                                                                                      buttonSize: 40.0,
                                                                                      fillColor: FlutterFlowTheme.of(context).primary,
                                                                                      icon: Icon(
                                                                                        Icons.calendar_month_outlined,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_calendar_month_outlin');
                                                                                        final _datePickedDate = await showDatePicker(
                                                                                          context: context,
                                                                                          initialDate: getCurrentTimestamp,
                                                                                          firstDate: DateTime(1900),
                                                                                          lastDate: getCurrentTimestamp,
                                                                                          builder: (context, child) {
                                                                                            return wrapInMaterialDatePickerTheme(
                                                                                              context,
                                                                                              child!,
                                                                                              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                              headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                    fontSize: 32.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                                  ),
                                                                                              pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                              actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              iconSize: 24.0,
                                                                                            );
                                                                                          },
                                                                                        );

                                                                                        if (_datePickedDate != null) {
                                                                                          safeSetState(() {
                                                                                            _model.datePicked = DateTime(
                                                                                              _datePickedDate.year,
                                                                                              _datePickedDate.month,
                                                                                              _datePickedDate.day,
                                                                                            );
                                                                                          });
                                                                                        }
                                                                                        await Future.wait([
                                                                                          Future(() async {
                                                                                            safeSetState(() {
                                                                                              _model.txtProcedimentoDataTextController?.text = dateTimeFormat(
                                                                                                "d/M/y",
                                                                                                _model.datePicked,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              );
                                                                                              _model.txtProcedimentoDataMask.updateMask(
                                                                                                newValue: TextEditingValue(
                                                                                                  text: _model.txtProcedimentoDataTextController!.text,
                                                                                                ),
                                                                                              );
                                                                                            });
                                                                                          }),
                                                                                          Future(() async {
                                                                                            _model.dataProcedimento = _model.datePicked;
                                                                                            safeSetState(() {});
                                                                                          }),
                                                                                        ]);
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_CLEAR_PROCEDURES_BELO');
                                                                                        _model.membrosProcedimentos = [];
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '0o5d68l4' /* Clear procedures below */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.remove_outlined,
                                                                                        size: 15.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).overlay0,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_TO_ADD_BTN_ON_TAP');
                                                                                        _model.addToMembrosProcedimentos(DataTypesProcedimentosStruct(
                                                                                          procedimentoNo: _model.txtProcedimentoNoTextController.text,
                                                                                          procedimentoTipo: _model.ddwProcedimentoTipoValue,
                                                                                          unidade: _model.ddwProcedimentoUnidadeValue,
                                                                                          crime: _model.ddwProcedimentoCrimeValue,
                                                                                          data: _model.dataProcedimento,
                                                                                        ));
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'bb2ygjoo' /* To add */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_rounded,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 13.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                ListView(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              children: [
                                                                                StickyHeader(
                                                                                  overlapHeaders: false,
                                                                                  header: Container(
                                                                                    width: double.infinity,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 36.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                          ))
                                                                                            Container(
                                                                                              width: 39.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '7kpx14gp' /* Procedure */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'psuhnkli' /* Unit */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'pg5egvsq' /* Type of procedure: */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'ubujkway' /* Crime */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'mujyix3r' /* Data */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 24.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  content: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 3.0,
                                                                                                  color: Color(0x20000000),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final childrenProcedimentos = _model.membrosProcedimentos.toList();

                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: List.generate(childrenProcedimentos.length, (childrenProcedimentosIndex) {
                                                                                                    final childrenProcedimentosItem = childrenProcedimentos[childrenProcedimentosIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        childrenProcedimentosItem.procedimentoNo,
                                                                                                                        'sem informação',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    width: 100.0,
                                                                                                                    height: 26.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                    child: Visibility(
                                                                                                                      visible: responsiveVisibility(
                                                                                                                        context: context,
                                                                                                                        phone: false,
                                                                                                                        tablet: false,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            childrenProcedimentosItem.unidade,
                                                                                                                            'sem informação',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if (responsiveVisibility(
                                                                                                                  context: context,
                                                                                                                  phone: false,
                                                                                                                  tablet: false,
                                                                                                                ))
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          childrenProcedimentosItem.procedimentoTipo,
                                                                                                                          'sem informação',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (responsiveVisibility(
                                                                                                                  context: context,
                                                                                                                  phone: false,
                                                                                                                  tablet: false,
                                                                                                                ))
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          childrenProcedimentosItem.crime,
                                                                                                                          'sem informação',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                Expanded(
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 130.0,
                                                                                                                        height: 32.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                dateTimeFormat(
                                                                                                                                  "d/M/y",
                                                                                                                                  childrenProcedimentosItem.data,
                                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                                ),
                                                                                                                                'sem informação',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_k7g9idiu_ON_TAP');
                                                                                                                _model.removeAtIndexFromMembrosProcedimentos(childrenProcedimentosIndex);
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.do_not_disturb_on_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  }),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Form(
                                                                            key:
                                                                                _model.formKey5,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '5qynkae4' /* Provide information about the ... */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 6,
                                                                                        child: TextFormField(
                                                                                          controller: _model.txtProcessoNoAcaoPenalTextController,
                                                                                          focusNode: _model.txtProcessoNoAcaoPenalFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.txtProcessoNoAcaoPenalTextController',
                                                                                            Duration(milliseconds: 2000),
                                                                                            () => safeSetState(() {}),
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              '62989hh1' /* Criminal action number */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            filled: true,
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                            suffixIcon: _model.txtProcessoNoAcaoPenalTextController!.text.isNotEmpty
                                                                                                ? InkWell(
                                                                                                    onTap: () async {
                                                                                                      _model.txtProcessoNoAcaoPenalTextController?.clear();
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.clear,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  )
                                                                                                : null,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          keyboardType: TextInputType.number,
                                                                                          cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                          validator: _model.txtProcessoNoAcaoPenalTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 5,
                                                                                        child: FlutterFlowDropDown<String>(
                                                                                          controller: _model.ddwProcessoVaraValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'upp3qvf0' /* None of the options */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'hzu0fzkn' /* 1st CRIMINAL COURT */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '9i0jp3ac' /* 2nd CRIMINAL COURT */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '7m7bafyl' /* 3rd CRIMINAL COURT */,
                                                                                            )
                                                                                          ],
                                                                                          onChanged: (val) => safeSetState(() => _model.ddwProcessoVaraValue = val),
                                                                                          height: 60.0,
                                                                                          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'd8ym7f59' /* Stick */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            'sux2mj4g' /* Search ... */,
                                                                                          ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderWidth: 2.0,
                                                                                          borderRadius: 12.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isOverButton: false,
                                                                                          isSearchable: true,
                                                                                          isMultiSelect: false,
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 5,
                                                                                        child: FlutterFlowDropDown<String>(
                                                                                          controller: _model.ddwProcessoSituacaoJuridicaValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '3dt7bl7g' /* None of the options */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'e3cup52w' /* Convicted */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'xl37rsyl' /* Provisional */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '0owqd6ik' /* Awaiting sentence */,
                                                                                            )
                                                                                          ],
                                                                                          onChanged: (val) => safeSetState(() => _model.ddwProcessoSituacaoJuridicaValue = val),
                                                                                          height: 60.0,
                                                                                          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '2i43ea12' /* Legal status */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            '86516smn' /* Search... */,
                                                                                          ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderWidth: 2.0,
                                                                                          borderRadius: 12.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isOverButton: false,
                                                                                          isSearchable: true,
                                                                                          isMultiSelect: false,
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 5,
                                                                                        child: FlutterFlowDropDown<String>(
                                                                                          controller: _model.ddwProcessoRegimeValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'q307dahv' /* None of the options */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'pubameot' /* Closed */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '0piz3utr' /* Semi-open */,
                                                                                            )
                                                                                          ],
                                                                                          onChanged: (val) => safeSetState(() => _model.ddwProcessoRegimeValue = val),
                                                                                          height: 60.0,
                                                                                          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'qew87o7p' /* Regime */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            '1ttdhadk' /* Search... */,
                                                                                          ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderWidth: 2.0,
                                                                                          borderRadius: 12.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isOverButton: false,
                                                                                          isSearchable: true,
                                                                                          isMultiSelect: false,
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 5,
                                                                                        child: FlutterFlowDropDown<String>(
                                                                                          controller: _model.ddwProcessoSituacaoReuValueController ??= FormFieldController<String>(
                                                                                            _model.ddwProcessoSituacaoReuValue ??= FFLocalizations.of(context).getText(
                                                                                              'vd2b0ckv' /*  */,
                                                                                            ),
                                                                                          ),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'w1mu87ma' /* Nenhuma das opções */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'yxaa283n' /* Arrested */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '56ucvksh' /* Loose */,
                                                                                            )
                                                                                          ],
                                                                                          onChanged: (val) => safeSetState(() => _model.ddwProcessoSituacaoReuValue = val),
                                                                                          height: 60.0,
                                                                                          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'vopttfks' /* Defendant situation */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            'lib0adfj' /* Search... */,
                                                                                          ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderWidth: 2.0,
                                                                                          borderRadius: 12.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 12.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isOverButton: false,
                                                                                          isSearchable: true,
                                                                                          isMultiSelect: false,
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('MODAL_MEMBROS_EDIT_TO_CLEAN_BTN_ON_TAP');
                                                                                          _model.membrosProcessos = [];
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'add23mws' /* To clean */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.remove_outlined,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).overlay0,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('MODAL_MEMBROS_EDIT_TO_ADD_BTN_ON_TAP');
                                                                                          _model.addToMembrosProcessos(DataTypesProcessosStruct(
                                                                                            noAcaoPenal: _model.txtProcessoNoAcaoPenalTextController.text,
                                                                                            vara: _model.ddwProcessoVaraValue,
                                                                                            situacaoJuridica: _model.ddwProcessoSituacaoJuridicaValue,
                                                                                            regime: _model.ddwProcessoRegimeValue,
                                                                                            situacaoReu: _model.ddwProcessoSituacaoReuValue,
                                                                                          ));
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'nqn14w73' /* To add */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.add_rounded,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 13.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                ListView(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              children: [
                                                                                StickyHeader(
                                                                                  overlapHeaders: false,
                                                                                  header: Container(
                                                                                    width: double.infinity,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 36.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                          ))
                                                                                            Container(
                                                                                              width: 39.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'cil8rboj' /* Criminal action number */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'sotrzfwa' /* Stick */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6kbxtojl' /* Legal status */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '8uiacmac' /* Regime */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'bhnywtws' /* Defendant situation */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 24.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  content: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 3.0,
                                                                                                  color: Color(0x20000000),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final childrenProcessos = _model.membrosProcessos.toList();

                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: List.generate(childrenProcessos.length, (childrenProcessosIndex) {
                                                                                                    final childrenProcessosItem = childrenProcessos[childrenProcessosIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        childrenProcessosItem.noAcaoPenal,
                                                                                                                        'sem informação',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    width: 100.0,
                                                                                                                    height: 26.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                    child: Visibility(
                                                                                                                      visible: responsiveVisibility(
                                                                                                                        context: context,
                                                                                                                        phone: false,
                                                                                                                        tablet: false,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          valueOrDefault<String>(
                                                                                                                            childrenProcessosItem.vara,
                                                                                                                            'sem informação',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if (responsiveVisibility(
                                                                                                                  context: context,
                                                                                                                  phone: false,
                                                                                                                  tablet: false,
                                                                                                                ))
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          childrenProcessosItem.situacaoJuridica,
                                                                                                                          'sem informação',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (responsiveVisibility(
                                                                                                                  context: context,
                                                                                                                  phone: false,
                                                                                                                  tablet: false,
                                                                                                                ))
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          childrenProcessosItem.regime,
                                                                                                                          'sem informação',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                Expanded(
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Container(
                                                                                                                          height: 32.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            border: Border.all(
                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Align(
                                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  childrenProcessosItem.situacaoReu,
                                                                                                                                  'sem informação',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_ut4bvubi_ON_TAP');
                                                                                                                _model.removeAtIndexFromMembrosProcessos(childrenProcessosIndex);
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.do_not_disturb_on_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  }),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'uzc0tzm0' /* Make a summary of the main cri... */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Form(
                                                                            key:
                                                                                _model.formKey8,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtHistoricoTextController,
                                                                                    focusNode: _model.txtHistoricoFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtHistoricoTextController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => safeSetState(() {}),
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    textCapitalization: TextCapitalization.words,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        '9v9xmx2i' /* Historic */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        '35ss44a6' /* Historic */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                      suffixIcon: _model.txtHistoricoTextController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.txtHistoricoTextController?.clear();
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    maxLines: 13,
                                                                                    keyboardType: TextInputType.multiline,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtHistoricoTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtMembroAtuacaoTextController,
                                                                                    focusNode: _model.txtMembroAtuacaoFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.txtMembroAtuacaoTextController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => safeSetState(() {}),
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    textCapitalization: TextCapitalization.words,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'sebzaqjl' /* Crime Action */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'bjt0xhvz' /* Crime Action */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                      suffixIcon: _model.txtMembroAtuacaoTextController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.txtMembroAtuacaoTextController?.clear();
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    maxLines: 12,
                                                                                    keyboardType: TextInputType.multiline,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.txtMembroAtuacaoTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 13.0)),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Form(
                                                                            key:
                                                                                _model.formKey1,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'qs8w0isl' /* Enable alert */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                        fontSize: 22.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                      ),
                                                                                ),
                                                                                Switch.adaptive(
                                                                                  value: _model.switchAlertaValue!,
                                                                                  onChanged: (newValue) async {
                                                                                    safeSetState(() => _model.switchAlertaValue = newValue!);
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).error,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).error,
                                                                                  inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                  inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.txtMembroAlertaTextController,
                                                                              focusNode: _model.txtMembroAlertaFocusNode,
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.txtMembroAlertaTextController',
                                                                                Duration(milliseconds: 2000),
                                                                                () => safeSetState(() {}),
                                                                              ),
                                                                              autofocus: false,
                                                                              textCapitalization: TextCapitalization.words,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'hlhbysfx' /* Alert */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                                alignLabelWithHint: true,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'v1t3mhpt' /* Alert */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                suffixIcon: _model.txtMembroAlertaTextController!.text.isNotEmpty
                                                                                    ? InkWell(
                                                                                        onTap: () async {
                                                                                          _model.txtMembroAlertaTextController?.clear();
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.clear,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      )
                                                                                    : null,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              maxLines: 20,
                                                                              keyboardType: TextInputType.multiline,
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.txtMembroAlertaTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'z55xn7vr' /* Percentage of data validations */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, -1.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 100.0, 0.0),
                                                                                          child: CircularPercentIndicator(
                                                                                            percent: valueOrDefault<double>(
                                                                                              _model.membrosPercetualValidacao,
                                                                                              0.0,
                                                                                            ),
                                                                                            radius: 115.0,
                                                                                            lineWidth: 30.0,
                                                                                            animation: true,
                                                                                            animateFromLastPercent: true,
                                                                                            progressColor: FlutterFlowTheme.of(context).success,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                            center: Text(
                                                                                              formatNumber(
                                                                                                _model.membrosPercetualValidacao,
                                                                                                formatType: FormatType.percent,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                2.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'mcn2wj30' /* How were the data and informat... */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Form(
                                                                                        key: _model.formKey3,
                                                                                        autovalidateMode: AutovalidateMode.disabled,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            FlutterFlowChoiceChips(
                                                                                              options: [
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'xt0zviie' /* Local validation or area of ​​... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  '6nicg6vo' /* Only through open sources */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'u1ezmrh7' /* Only through restricted source... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'hw7vp3j2' /* Through other intelligence age... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  '52d8lpad' /* Through other bodies such as: ... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'pz4sv7me' /* Only through report(s) */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  '2egm47bd' /* Inside a State Prison Facility */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  '3jd5uz4f' /* Dentro de um Estabelecimento P... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'xrgn3bxr' /* Apenas através de informante(s... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  'iw3ihap7' /* Apenas através de Coolaborador... */,
                                                                                                )),
                                                                                                ChipData(FFLocalizations.of(context).getText(
                                                                                                  '5hhyuasp' /*  */,
                                                                                                ))
                                                                                              ],
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.choiceChipsValidacoesValues = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ChoiceChipsValidacoes');
                                                                                                if (widget!.membrosRow!.validacaoPrecentual! >= 0.0) {
                                                                                                  _model.selectedCountValidados = widget!.membrosRow?.validacoes?.length;
                                                                                                  _model.updatePage(() {});
                                                                                                } else {
                                                                                                  _model.membrosPercetualValidacao = 0.0;
                                                                                                  _model.updatePage(() {});
                                                                                                }

                                                                                                _model.membrosPercetualValidacao = functions.funcGetPercentualValidado(_model.selectedCountValidados)!;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              selectedChipStyle: ChipStyle(
                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                iconColor: FlutterFlowTheme.of(context).info,
                                                                                                iconSize: 16.0,
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              unselectedChipStyle: ChipStyle(
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                iconSize: 16.0,
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              chipSpacing: 8.0,
                                                                                              rowSpacing: 8.0,
                                                                                              multiselect: true,
                                                                                              initialized: _model.choiceChipsValidacoesValues != null,
                                                                                              alignment: WrapAlignment.start,
                                                                                              controller: _model.choiceChipsValidacoesValueController ??= FormFieldController<List<String>>(
                                                                                                widget!.membrosRow?.validacoes,
                                                                                              ),
                                                                                              wrapped: true,
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.txtValidacoesObservacoesTextController,
                                                                                                focusNode: _model.txtValidacoesObservacoesFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.txtValidacoesObservacoesTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () => safeSetState(() {}),
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'z2ut6vuo' /* Observação(ões) */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                        lineHeight: 5.0,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'wthvc7v1' /* Observação(ões) */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
                                                                                                  suffixIcon: _model.txtValidacoesObservacoesTextController!.text.isNotEmpty
                                                                                                      ? InkWell(
                                                                                                          onTap: () async {
                                                                                                            _model.txtValidacoesObservacoesTextController?.clear();
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.clear,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        )
                                                                                                      : null,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.txtValidacoesObservacoesTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 16.0, 16.0),
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zn1gyuvw' /* Relations */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              GridView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 3,
                                                                              crossAxisSpacing: 10.0,
                                                                              mainAxisSpacing: 10.0,
                                                                              childAspectRatio: 1.0,
                                                                            ),
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: Image.network(
                                                                                  'https://picsum.photos/seed/379/600',
                                                                                  width: 200.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'o95p4ebi' /* Groups */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            GridView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          gridDelegate:
                                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                3,
                                                                            crossAxisSpacing:
                                                                                10.0,
                                                                            mainAxisSpacing:
                                                                                10.0,
                                                                            childAspectRatio:
                                                                                1.0,
                                                                          ),
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                'https://picsum.photos/seed/79/600',
                                                                                width: 200.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.05),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'MODAL_MEMBROS_EDIT_ButtonCancelar_ON_TAP');
                                                          Navigator.pop(
                                                              context);

                                                          context.pushNamed(
                                                              'main_membros');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '9pqk83pj' /* Cancel */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.cancel_outlined,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 44.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          hoverElevation: 3.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.05),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'MODAL_MEMBROS_EDIT_SAVE_MEMBER_BTN_ON_TA');
                                                          var _shouldSetState =
                                                              false;
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Salvar  dados'),
                                                                        content:
                                                                            Text('Deseja salvar os  dados editados ?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Confirmar'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var selectedMedia =
                                                                  <SelectedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    _model
                                                                        .membrosFotosFileTemp;
                                                                selectedMedia =
                                                                    selectedFilesFromUploadedFiles(
                                                                  selectedUploadedFiles,
                                                                  storageFolderPath:
                                                                      'membros',
                                                                  isMultiData:
                                                                      true,
                                                                );
                                                                downloadUrls =
                                                                    await uploadSupabaseStorageFiles(
                                                                  bucketName:
                                                                      'uploads',
                                                                  selectedFiles:
                                                                      selectedMedia,
                                                                );
                                                              } finally {
                                                                _model.isDataUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFiles2 =
                                                                      selectedUploadedFiles;
                                                                  _model.uploadedFileUrls2 =
                                                                      downloadUrls;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            if (_model
                                                                    .uploadImageTemp ==
                                                                true) {
                                                              await MembrosTable()
                                                                  .update(
                                                                data: {
                                                                  'nome_completo':
                                                                      _model
                                                                          .txtNomeCompletoTextController
                                                                          .text,
                                                                  'fotos_path':
                                                                      _model
                                                                          .uploadedFileUrls2,
                                                                  'alcunha': _model
                                                                      .membrosAlcunhas,
                                                                  'cpf': _model
                                                                      .txtNoCpfTextController
                                                                      .text,
                                                                  'identidade':
                                                                      _model
                                                                          .txtNoIdentidadeTextController
                                                                          .text,
                                                                  'naturalidade':
                                                                      _model
                                                                          .txtMembroNaturalidadeTextController
                                                                          .text,
                                                                  'filiacao_mae':
                                                                      _model
                                                                          .txtFiliacaoMaeTextController
                                                                          .text,
                                                                  'filiacao_pai':
                                                                      _model
                                                                          .txtFiliacaoPaiTextController
                                                                          .text,
                                                                  'situacao_mae':
                                                                      _model
                                                                          .ddwSituacaoMaeValue,
                                                                  'situacao_pai':
                                                                      _model
                                                                          .txtFiliacaoPaiTextController
                                                                          .text,
                                                                  'nivel_instrucao':
                                                                      _model
                                                                          .ddwNivelInstrucaoValue,
                                                                  'estado_civil':
                                                                      _model
                                                                          .ddwEstadoCivilValue,
                                                                  'membro_endereco':
                                                                      _model
                                                                          .membrosEnderecos,
                                                                  'estado_id':
                                                                      _model
                                                                          .ddwEstadoValue,
                                                                  'historico':
                                                                      _model
                                                                          .txtHistoricoTextController
                                                                          .text,
                                                                  'faccao_id':
                                                                      _model
                                                                          .ddwMembroFaccaoValue,
                                                                  'batismo': _model
                                                                      .txtFaccaoBastismoTextController
                                                                      .text,
                                                                  'batismo_local':
                                                                      _model
                                                                          .txtFacaoLocalBastismoTextController
                                                                          .text,
                                                                  'padrinho': _model
                                                                      .txtMembrosFaccaoPadrinhoTextController
                                                                      .text,
                                                                  'faccao_senha':
                                                                      _model
                                                                          .txtMembroFaccaoSenhaTextController
                                                                          .text,
                                                                  'cargo_id': _model
                                                                      .ddwMembroFaccaoCargoAtualValue,
                                                                  'funcao_id':
                                                                      _model
                                                                          .ddwFaccaoFuncaoAtualValue,
                                                                  'cargo_ant_id':
                                                                      _model
                                                                          .ddwMembroFaccaoCargoAnteriorValue,
                                                                  'faccao_inimiga':
                                                                      _model
                                                                          .ddwFaccaoInimigaValue,
                                                                  'faccao_aliada':
                                                                      _model
                                                                          .ddwFaccaoAliadaValue,
                                                                  'nacionalidade':
                                                                      _model
                                                                          .rbNacionalidadeValue,
                                                                  'funcao_ant_id':
                                                                      _model
                                                                          .ddwFaccaoFuncaoAnteriorValue,
                                                                  'faccao_integrou':
                                                                      _model
                                                                          .ddwFaccaoIntegrouValue,
                                                                  'municipio_id':
                                                                      _model
                                                                          .ddwMunicipioValue,
                                                                  'infopen': _model
                                                                      .txtNoInfopenTextController
                                                                      .text,
                                                                  'tres_ultimo_locais_preso':
                                                                      _model
                                                                          .membrosFaccaoTresLocais,
                                                                  'alerta': _model
                                                                      .switchAlertaValue,
                                                                  'atuacao_crime':
                                                                      _model
                                                                          .txtMembroAtuacaoTextController
                                                                          .text,
                                                                  'validacao_precentual':
                                                                      _model
                                                                          .membrosPercetualValidacao,
                                                                  'validacoes':
                                                                      _model
                                                                          .choiceChipsValidacoesValues,
                                                                  'coordenadas':
                                                                      functions.convertLatLngListToStringList(_model
                                                                          .membrosLatLng
                                                                          .toList()),
                                                                  'membroLngLat':
                                                                      functions.convertLatLngToDouble(_model
                                                                          .membrosLatLng
                                                                          .toList()),
                                                                  'identidade_orgao':
                                                                      _model
                                                                          .ddwOrgaoExpedidorValue,
                                                                  'alerta_observacao':
                                                                      _model
                                                                          .txtMembroAlertaTextController
                                                                          .text,
                                                                },
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'membro_id',
                                                                  widget!
                                                                      .membrosRow
                                                                      ?.membroId,
                                                                ),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                            } else {
                                                              await MembrosTable()
                                                                  .update(
                                                                data: {
                                                                  'nome_completo':
                                                                      _model
                                                                          .txtNomeCompletoTextController
                                                                          .text,
                                                                  'fotos_path':
                                                                      _model
                                                                          .membrosFotoPathEdit,
                                                                  'alcunha': _model
                                                                      .membrosAlcunhas,
                                                                  'cpf': _model
                                                                      .txtNoCpfTextController
                                                                      .text,
                                                                  'identidade':
                                                                      _model
                                                                          .txtNoIdentidadeTextController
                                                                          .text,
                                                                  'naturalidade':
                                                                      _model
                                                                          .txtMembroNaturalidadeTextController
                                                                          .text,
                                                                  'filiacao_mae':
                                                                      _model
                                                                          .txtFiliacaoMaeTextController
                                                                          .text,
                                                                  'filiacao_pai':
                                                                      _model
                                                                          .txtFiliacaoPaiTextController
                                                                          .text,
                                                                  'situacao_mae':
                                                                      _model
                                                                          .ddwSituacaoMaeValue,
                                                                  'situacao_pai':
                                                                      _model
                                                                          .txtFiliacaoPaiTextController
                                                                          .text,
                                                                  'nivel_instrucao':
                                                                      _model
                                                                          .ddwNivelInstrucaoValue,
                                                                  'estado_civil':
                                                                      _model
                                                                          .ddwEstadoCivilValue,
                                                                  'membro_endereco':
                                                                      _model
                                                                          .membrosEnderecos,
                                                                  'estado_id':
                                                                      _model
                                                                          .ddwEstadoValue,
                                                                  'historico':
                                                                      _model
                                                                          .txtHistoricoTextController
                                                                          .text,
                                                                  'faccao_id':
                                                                      valueOrDefault<
                                                                          int>(
                                                                    _model.ddwMembroFaccaoValue !=
                                                                            null
                                                                        ? _model
                                                                            .ddwMembroFaccaoValue
                                                                        : valueOrDefault<
                                                                            int>(
                                                                            widget!.membrosRow?.funcaoId,
                                                                            0,
                                                                          ),
                                                                    0,
                                                                  ),
                                                                  'batismo': _model
                                                                      .txtFaccaoBastismoTextController
                                                                      .text,
                                                                  'batismo_local':
                                                                      _model
                                                                          .txtFacaoLocalBastismoTextController
                                                                          .text,
                                                                  'padrinho': _model
                                                                      .txtMembrosFaccaoPadrinhoTextController
                                                                      .text,
                                                                  'faccao_senha':
                                                                      _model
                                                                          .txtMembroFaccaoSenhaTextController
                                                                          .text,
                                                                  'cargo_id': _model
                                                                      .ddwMembroFaccaoCargoAtualValue,
                                                                  'funcao_id':
                                                                      _model
                                                                          .ddwFaccaoFuncaoAtualValue,
                                                                  'cargo_ant_id':
                                                                      _model
                                                                          .ddwMembroFaccaoCargoAnteriorValue,
                                                                  'faccao_inimiga':
                                                                      _model
                                                                          .ddwFaccaoInimigaValue,
                                                                  'faccao_aliada':
                                                                      _model
                                                                          .ddwFaccaoAliadaValue,
                                                                  'nacionalidade':
                                                                      _model
                                                                          .rbNacionalidadeValue,
                                                                  'funcao_ant_id':
                                                                      _model
                                                                          .ddwFaccaoFuncaoAnteriorValue,
                                                                  'faccao_integrou':
                                                                      _model
                                                                          .ddwFaccaoIntegrouValue,
                                                                  'municipio_id':
                                                                      _model
                                                                          .ddwMunicipioValue,
                                                                  'infopen': _model
                                                                      .txtNoInfopenTextController
                                                                      .text,
                                                                  'tres_ultimo_locais_preso':
                                                                      _model
                                                                          .membrosFaccaoTresLocais,
                                                                  'alerta': _model
                                                                      .switchAlertaValue,
                                                                  'atuacao_crime':
                                                                      _model
                                                                          .txtMembroAtuacaoTextController
                                                                          .text,
                                                                  'validacao_precentual':
                                                                      _model
                                                                          .membrosPercetualValidacao,
                                                                  'validacoes':
                                                                      _model
                                                                          .choiceChipsValidacoesValues,
                                                                  'coordenadas':
                                                                      functions.convertLatLngListToStringList(_model
                                                                          .membrosLatLng
                                                                          .toList()),
                                                                  'membroLngLat':
                                                                      functions.convertLatLngToDouble(_model
                                                                          .membrosLatLng
                                                                          .toList()),
                                                                  'identidade_orgao':
                                                                      _model
                                                                          .ddwOrgaoExpedidorValue,
                                                                  'alerta_observacao':
                                                                      _model
                                                                          .txtMembroAlertaTextController
                                                                          .text,
                                                                },
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'membro_id',
                                                                  widget!
                                                                      .membrosRow
                                                                      ?.membroId,
                                                                ),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                            }

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        100));
                                                            await Future.wait([
                                                              Future(() async {
                                                                if (_model
                                                                        .membrosProcedimentos
                                                                        .length >=
                                                                    1) {
                                                                  _model.membrosProcedimentosCount =
                                                                      -1;
                                                                  safeSetState(
                                                                      () {});
                                                                  while (_model
                                                                          .membrosProcedimentosCount! <=
                                                                      _model
                                                                          .membrosProcedimentos
                                                                          .length) {
                                                                    _model.membrosProcedimentosCount =
                                                                        _model.membrosProcedimentosCount! +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.apiResultProcedimentosEdit =
                                                                        await ProcedimentosAddCall
                                                                            .call(
                                                                      membroId: _model
                                                                          .retMembrosEdit
                                                                          ?.elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.membroId,
                                                                      procedimentoNo: _model
                                                                          .membrosProcedimentos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.procedimentoNo,
                                                                      unidade: _model
                                                                          .membrosProcedimentos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.unidade,
                                                                      procedimentoTipo: _model
                                                                          .membrosProcedimentos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.procedimentoTipo,
                                                                      crime: _model
                                                                          .membrosProcedimentos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.crime,
                                                                      data:
                                                                          dateTimeFormat(
                                                                        "d/M/y",
                                                                        _model
                                                                            .membrosProcedimentos
                                                                            .elementAtOrNull(_model.membrosProcedimentosCount!)
                                                                            ?.data,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .apiResultProcedimentosEdit
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .clearSnackBars();
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Dados dos procedimentos salvos !',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 1000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).success,
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }),
                                                              Future(() async {
                                                                if (_model
                                                                        .membrosProcessos
                                                                        .length >=
                                                                    1) {
                                                                  _model.membrosProcessosCount =
                                                                      -1;
                                                                  safeSetState(
                                                                      () {});
                                                                  while (_model
                                                                          .membrosProcessosCount! <=
                                                                      _model
                                                                          .membrosProcessos
                                                                          .length) {
                                                                    _model.membrosProcessosCount =
                                                                        _model.membrosProcessosCount! +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.apiResultProcessosEdit =
                                                                        await ProcessosAddCall
                                                                            .call(
                                                                      membroId: _model
                                                                          .retMembrosEdit
                                                                          ?.elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.membroId,
                                                                      acaoPenalNo: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.noAcaoPenal,
                                                                      vara: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.vara,
                                                                      situacaoJuridica: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.situacaoJuridica,
                                                                      regime: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.regime,
                                                                      situacaoReu: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.situacaoReu,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .apiResultProcessosEdit
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .clearSnackBars();
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Dados dos processos salvos !',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).success,
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }),
                                                            ]);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Editar membro'),
                                                                  content: Text(
                                                                      'Dados editados com sucesso !'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          Navigator.pop(
                                                              context);

                                                          context.pushNamed(
                                                              'main_membros');

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'dterjvu7' /* Save Member */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.check_circle,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 44.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          hoverBorderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          hoverElevation: 0.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!),
    );
  }
}
