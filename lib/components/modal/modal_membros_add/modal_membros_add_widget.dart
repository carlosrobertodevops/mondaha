import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/toasts/toast03/toast03_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:community_testing_ryusdv/custom_code/widgets/index.dart'
    as community_testing_ryusdv_custom_widgets;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'modal_membros_add_model.dart';
export 'modal_membros_add_model.dart';

class ModalMembrosAddWidget extends StatefulWidget {
  const ModalMembrosAddWidget({super.key});

  @override
  State<ModalMembrosAddWidget> createState() => _ModalMembrosAddWidgetState();
}

class _ModalMembrosAddWidgetState extends State<ModalMembrosAddWidget>
    with TickerProviderStateMixin {
  late ModalMembrosAddModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalMembrosAddModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 8,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.txtNomeCompletoTextController ??= TextEditingController();
    _model.txtNomeCompletoFocusNode ??= FocusNode();
    _model.txtNomeCompletoFocusNode!.addListener(
      () async {
        logFirebaseEvent('MODAL_MEMBROS_ADD_txt_nome_completo_ON_F');
      },
    );
    _model.txtAlcunhaAddTextController ??= TextEditingController();
    _model.txtAlcunhaAddFocusNode ??= FocusNode();

    _model.txtMembroNaturalidadeTextController ??= TextEditingController();
    _model.txtMembroNaturalidadeFocusNode ??= FocusNode();

    _model.txtDataNascimentoTextController ??= TextEditingController();
    _model.txtDataNascimentoFocusNode ??= FocusNode();

    _model.txtNoIdentidadeTextController ??= TextEditingController();
    _model.txtNoIdentidadeFocusNode ??= FocusNode();

    _model.txtNoCpfTextController ??= TextEditingController();
    _model.txtNoCpfFocusNode ??= FocusNode();
    _model.txtNoCpfFocusNode!.addListener(
      () async {
        logFirebaseEvent('MODAL_MEMBROS_ADD_txt_no_cpf_ON_FOCUS_CH');
      },
    );
    _model.txtNoInfopenTextController ??= TextEditingController();
    _model.txtNoInfopenFocusNode ??= FocusNode();

    _model.txtFiliacaoMaeTextController ??= TextEditingController();
    _model.txtFiliacaoMaeFocusNode ??= FocusNode();

    _model.txtFiliacaoPaiTextController ??= TextEditingController();
    _model.txtFiliacaoPaiFocusNode ??= FocusNode();

    _model.txtMembrosEnderecosAddTextController ??= TextEditingController();
    _model.txtMembrosEnderecosAddFocusNode ??= FocusNode();

    _model.txtFaccaoBastismoTextController ??= TextEditingController();

    _model.txtFacaoLocalBastismoTextController ??= TextEditingController();
    _model.txtFacaoLocalBastismoFocusNode ??= FocusNode();

    _model.txtMembrosFaccaoPadrinhoTextController ??= TextEditingController();
    _model.txtMembrosFaccaoPadrinhoFocusNode ??= FocusNode();

    _model.txtMembroFaccaoSenhaTextController ??= TextEditingController();
    _model.txtMembroFaccaoSenhaFocusNode ??= FocusNode();

    _model.txtFaccaoTresLocaisAddTextController ??= TextEditingController();
    _model.txtFaccaoTresLocaisAddFocusNode ??= FocusNode();

    _model.txtProcedimentoNoTextController ??= TextEditingController();
    _model.txtProcedimentoNoFocusNode ??= FocusNode();

    _model.txtProcedimentoDataTextController ??= TextEditingController();
    _model.txtProcedimentoDataFocusNode ??= FocusNode();

    _model.txtProcessoNoAcaoPenalTextController ??= TextEditingController();
    _model.txtProcessoNoAcaoPenalFocusNode ??= FocusNode();

    _model.txtHistoricoTextController ??= TextEditingController();
    _model.txtHistoricoFocusNode ??= FocusNode();

    _model.txtMembroAtuacaoTextController ??= TextEditingController();
    _model.txtMembroAtuacaoFocusNode ??= FocusNode();

    _model.switchAlertaValue = false;
    _model.txtMembroAlertaTextController ??= TextEditingController();
    _model.txtMembroAlertaFocusNode ??= FocusNode();

    _model.txtValidacoesObservacoesTextController ??= TextEditingController();
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
          _model.txtDataNascimentoTextController?.text = dateTimeFormat(
            "d/M/y",
            _model.dataProcedimento,
            locale: FFLocalizations.of(context).languageCode,
          );
          _model.txtFiliacaoPaiTextController?.text =
              FFLocalizations.of(context).getText(
            'l5vrftgu' /*  */,
          );
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
    context.watch<FFAppState>();
    context.watch<community_testing_ryusdv_app_state.FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: 300.0,
            height: 100.0,
            child: community_testing_ryusdv_custom_widgets.ToastListener(
              width: 300.0,
              height: 100.0,
              notificationData: community_testing_ryusdv_app_state.FFAppState()
                  .notificationDT,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 4.0,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  'ioxmm05s' /* Add Member */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            'MODAL_MEMBROS_ADD_close_rounded_ICN_ON_T');
                                        Navigator.pop(context);

                                        context.pushNamed('main_membros');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SafeArea(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.832,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment(0.0, 0),
                                                          child: TabBar(
                                                            isScrollable: true,
                                                            tabAlignment:
                                                                TabAlignment
                                                                    .center,
                                                            labelColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            unselectedLabelColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                            unselectedLabelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                            indicatorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            tabs: [
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ap8ub3ro' /* Profile */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nvxntirq' /* Localization */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zo5mhuuq' /* Facção */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xeeiaebp' /* Procedimentos */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0v0s6s8e' /* Procedures */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xaeljp2r' /* Performance */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '8slh1eth' /* Alert */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2rc41m6r' /* Validation */,
                                                                ),
                                                              ),
                                                            ],
                                                            controller: _model
                                                                .tabBarController,
                                                            onTap: (i) async {
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
                                                          child: TabBarView(
                                                            controller: _model
                                                                .tabBarController,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            children: [
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                _model.formKey2,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.always,
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              primary: false,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'lgw9eve8' /* Hello World */,
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_qlctojzn_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading1 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading1 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(0, _model.uploadedFileUrl1);
                                                                                                    _model.updatePage(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '1er6ik3u' /* Add photo #1 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_1_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(0),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(0),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(0),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(0),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_5tvdl3w6_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl1 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(0);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_fyohj85x_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading2 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading2 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(1, _model.uploadedFileUrl2);
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'jl45ge8k' /* Add photo #2 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_2_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(1),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.png',
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(1),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(1),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(1),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                            'assets/images/error_image.png',
                                                                                                            width: 114.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_i6o325ej_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.isDataUploading2 = false;
                                                                                                          _model.uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl2 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(1);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_7njjxrl7_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading3 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading3 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl3 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(2, _model.uploadedFileUrl3);
                                                                                                    _model.updatePage(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'fy81oycs' /* Add photo #3 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_3_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: CachedNetworkImage(
                                                                                                              fadeInDuration: Duration(milliseconds: 100),
                                                                                                              fadeOutDuration: Duration(milliseconds: 100),
                                                                                                              imageUrl: valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(2),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.png',
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(2),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(2),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: CachedNetworkImage(
                                                                                                          fadeInDuration: Duration(milliseconds: 100),
                                                                                                          fadeOutDuration: Duration(milliseconds: 100),
                                                                                                          imageUrl: valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(2),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                                            'assets/images/error_image.png',
                                                                                                            width: 114.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_fmv3o1xc_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.isDataUploading3 = false;
                                                                                                          _model.uploadedLocalFile3 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl3 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(2);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_aj9r90o4_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading4 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading4 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile4 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl4 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(3, _model.uploadedFileUrl4);
                                                                                                    _model.updatePage(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6ogiyutt' /* Add photo #4 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_4_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(3),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.png',
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(3),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(3),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(3),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                            'assets/images/error_image.png',
                                                                                                            width: 114.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_ewdonxc2_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.isDataUploading4 = false;
                                                                                                          _model.uploadedLocalFile4 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl4 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(3);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_lbbagoze_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading5 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading5 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile5 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl5 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(4, _model.uploadedFileUrl5);
                                                                                                    _model.updatePage(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'vzoqd487' /* Add photo #5 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_5_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(3),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.png',
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(3),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(3),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(3),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                            'assets/images/error_image.png',
                                                                                                            width: 114.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_sbtz32y9_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.isDataUploading4 = false;
                                                                                                          _model.uploadedLocalFile4 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl4 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(3);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 135.0,
                                                                                          height: 150.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Text_kp6tqo99_ON_TAP');
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      storageFolderPath: 'membros',
                                                                                                      maxWidth: 300.00,
                                                                                                      maxHeight: 300.00,
                                                                                                      imageQuality: 100,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      safeSetState(() => _model.isDataUploading6 = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        selectedUploadedFiles = selectedMedia
                                                                                                            .map((m) => FFUploadedFile(
                                                                                                                  name: m.storagePath.split('/').last,
                                                                                                                  bytes: m.bytes,
                                                                                                                  height: m.dimensions?.height,
                                                                                                                  width: m.dimensions?.width,
                                                                                                                  blurHash: m.blurHash,
                                                                                                                ))
                                                                                                            .toList();

                                                                                                        downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                          bucketName: 'uploads',
                                                                                                          selectedFiles: selectedMedia,
                                                                                                        );
                                                                                                      } finally {
                                                                                                        _model.isDataUploading6 = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        safeSetState(() {
                                                                                                          _model.uploadedLocalFile6 = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl6 = downloadUrls.first;
                                                                                                        });
                                                                                                      } else {
                                                                                                        safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    _model.insertAtIndexInMembrosFotos(5, _model.uploadedFileUrl6);
                                                                                                    _model.updatePage(() {});
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'orgu7b19' /* Add photo #6 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_membro_foto_6_ON_TAP');
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        PageTransition(
                                                                                                          type: PageTransitionType.fade,
                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                            image: Image.network(
                                                                                                              valueOrDefault<String>(
                                                                                                                _model.membrosFotos.elementAtOrNull(3),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              fit: BoxFit.contain,
                                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.png',
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: valueOrDefault<String>(
                                                                                                              _model.membrosFotos.elementAtOrNull(3),
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                            ),
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: valueOrDefault<String>(
                                                                                                        _model.membrosFotos.elementAtOrNull(3),
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                      ),
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.membrosFotos.elementAtOrNull(3),
                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                          ),
                                                                                                          width: 114.0,
                                                                                                          height: 100.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                            'assets/images/error_image.png',
                                                                                                            width: 114.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            alignment: Alignment(0.0, 0.0),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_yf5kptt7_ON_TAP');
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Apagar Foto'),
                                                                                                                content: Text('Deseja APAGAR esta foto ?'),
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
                                                                                                          _model.isDataUploading4 = false;
                                                                                                          _model.uploadedLocalFile4 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                          _model.uploadedFileUrl4 = '';
                                                                                                        });

                                                                                                        _model.removeAtIndexFromMembrosFotos(3);
                                                                                                        _model.updatePage(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.do_not_disturb_on_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 1.0)),
                                                                                            ),
                                                                                          ),
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
                                                                                              'botl60yq' /* Nome completo */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'abewpnaq' /* Nome completo */,
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
                                                                                              'ikt0h50o' /* Alcunha */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'jna6z2zu' /* Alcunha */,
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
                                                                                      Builder(
                                                                                        builder: (context) => FlutterFlowIconButton(
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
                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_add_rounded_ICN_ON_TAP');
                                                                                            if (_model.txtAlcunhaAddTextController.text != '') {
                                                                                              _model.outputAlcunhaExists = await actions.checkValueInList(
                                                                                                _model.membrosAlcunhas.toList(),
                                                                                                _model.txtAlcunhaAddTextController.text,
                                                                                              );
                                                                                              if (_model.outputAlcunhaExists!) {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: Container(
                                                                                                        height: 100.0,
                                                                                                        width: 300.0,
                                                                                                        child: Toast03Widget(
                                                                                                          texto: 'Alcunha já existe !!!',
                                                                                                          titulo: 'Atenção',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              } else {
                                                                                                _model.addToMembrosAlcunhas(_model.txtAlcunhaAddTextController.text);
                                                                                                _model.updatePage(() {});
                                                                                              }
                                                                                            } else {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: Container(
                                                                                                      height: 100.0,
                                                                                                      width: 300.0,
                                                                                                      child: Toast03Widget(
                                                                                                        texto: FFLocalizations.of(context).getText(
                                                                                                          '5kbgpt8h' /* Nickname was not provided !!! */,
                                                                                                        ),
                                                                                                        titulo: 'Atenção',
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            }

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                        child: AlignedTooltip(
                                                                                          content: Padding(
                                                                                            padding: EdgeInsets.all(12.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                't455vcot' /* To add nickname(s) you need to... */,
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
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final tagAlcunha = _model.membrosAlcunhas.map((e) => e).toList().take(4).toList();

                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: List.generate(tagAlcunha.length, (tagAlcunhaIndex) {
                                                                                                final tagAlcunhaItem = tagAlcunha[tagAlcunhaIndex];
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
                                                                                                                        tagAlcunhaItem,
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
                                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_6qqufm56_ON_TAP');
                                                                                                                    _model.removeAtIndexFromMembrosAlcunhas(tagAlcunhaIndex);
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
                                                                                              'deg0fdow' /* Naturalidade */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'o99a5cgx' /* Naturalidade */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<CargosRow> ddwEstadoCivilCargosRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<String>(
                                                                                              controller: _model.ddwEstadoCivilValueController ??= FormFieldController<String>(null),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  't9eza7j1' /* Solteiro */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'l63dv3dx' /* Casado */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'e2udnh0l' /* DIvorciado */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ggvr9869' /* Viúvo(a) */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'dq3xw3uc' /* Separados legalmente */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'bm6cnl7l' /* União estável */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '75eegesr' /* Nenhuma das opções */,
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
                                                                                                'ievjy8qu' /* Estado civil */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'tfn53ft8' /* Estado civil */,
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
                                                                                        child: TextFormField(
                                                                                          controller: _model.txtDataNascimentoTextController,
                                                                                          focusNode: _model.txtDataNascimentoFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.txtDataNascimentoTextController',
                                                                                            Duration(milliseconds: 2000),
                                                                                            () => safeSetState(() {}),
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'zrb8c816' /* Date of birth */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'ol6syeyq' /* Procedure Date */,
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
                                                                                            suffixIcon: _model.txtDataNascimentoTextController!.text.isNotEmpty
                                                                                                ? InkWell(
                                                                                                    onTap: () async {
                                                                                                      _model.txtDataNascimentoTextController?.clear();
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
                                                                                          validator: _model.txtDataNascimentoTextControllerValidator.asValidator(context),
                                                                                          inputFormatters: [
                                                                                            _model.txtDataNascimentoMask
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
                                                                                          logFirebaseEvent('MODAL_MEMBROS_ADD_IconButtonDataNascimen');
                                                                                          // Data de Nascimento
                                                                                          final _datePicked1Date = await showDatePicker(
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

                                                                                          if (_datePicked1Date != null) {
                                                                                            safeSetState(() {
                                                                                              _model.datePicked1 = DateTime(
                                                                                                _datePicked1Date.year,
                                                                                                _datePicked1Date.month,
                                                                                                _datePicked1Date.day,
                                                                                              );
                                                                                            });
                                                                                          } else if (_model.datePicked1 != null) {
                                                                                            safeSetState(() {
                                                                                              _model.datePicked1 = getCurrentTimestamp;
                                                                                            });
                                                                                          }
                                                                                          await Future.wait([
                                                                                            Future(() async {
                                                                                              safeSetState(() {
                                                                                                _model.txtDataNascimentoTextController?.text = dateTimeFormat(
                                                                                                  "d/M/y",
                                                                                                  _model.datePicked1,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                );
                                                                                                _model.txtDataNascimentoMask.updateMask(
                                                                                                  newValue: TextEditingValue(
                                                                                                    text: _model.txtDataNascimentoTextController!.text,
                                                                                                  ),
                                                                                                );
                                                                                              });
                                                                                            }),
                                                                                            Future(() async {
                                                                                              _model.dataNascimento = dateTimeFormat(
                                                                                                "d/M/y",
                                                                                                _model.datePicked1,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                            }),
                                                                                          ]);
                                                                                        },
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
                                                                                              '2opj9i3o' /* Identidade */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'v4bdomyi' /* Identidade */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                  'kuvmd4lw' /* SSP-AL */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'i0p55l2k' /* SSP-SE */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'q0egmn1z' /* SSP-CE */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'yoj8hn6v' /* SSP-PE */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'vuc1hntf' /* SSP-BA */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'lhjvkfqm' /* SSP-RN */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ryqcnfe0' /* None of the options */,
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
                                                                                                'ia9zkanc' /* Issuing body */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'h3ykxfak' /* Issuing body */,
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
                                                                                              'k3o15zmt' /* CPF */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '1rai7wkj' /* CPF */,
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
                                                                                              'f434de4i' /* Infopen Registration */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '1yyjhbj8' /* Infopen Registration */,
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
                                                                                              'cjy846zr' /* Mother's name */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '7g88w199' /* Mother's name */,
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
                                                                                          controller: _model.ddwSituacaoMaeValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '4ebn7u9d' /* Alive */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'vte6onee' /* Deceased */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '188nb78m' /* Wheelchair user */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'aw1z7gel' /* No information */,
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
                                                                                            'gc3vbmj4' /* Mother's situation */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            'bj72hiw8' /* Mother's situation */,
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
                                                                                              'lbcdz337' /* Father's name */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '35jyk488' /* Father's name */,
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
                                                                                          controller: _model.ddwSituacaoPaiValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'qyc8q0st' /* Alive */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '7ygxf6rh' /* Deceased */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'wmbvp74d' /* Wheelchair user */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'r9rah6gc' /* No information */,
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
                                                                                            'cnn9tddw' /* Father's situation */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            'bsvzf3cx' /* Father's situation */,
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
                                                                                          controller: _model.ddwNivelInstrucaoValueController ??= FormFieldController<String>(null),
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'r2g2yo2p' /* Alfabetizado */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'y7i4eicy' /* illiterate */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'xmduvdwh' /* Completed elementary education */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'lvynt86i' /* Completed high school */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'eur8h0kh' /* Completed higher education */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'm10ha0nj' /* Incomplete elementary educatio... */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'csrvq6pn' /* Incomplete high school */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'tb0j8o1f' /* Incomplete higher education */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'm23r6x4v' /* No information */,
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
                                                                                            '0wrilaus' /* Degree or Level of Education */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            '4thgagtf' /* Degree or Level of Education */,
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
                                                                                ].divide(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey1,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowRadioButton(
                                                                                          options: [
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '6w0dm4cc' /* Nascido no Brasil */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '5vnpg5p9' /* Naturalizado Brasileiro */,
                                                                                            ),
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'wx2tv3zx' /* Estrangeiro */,
                                                                                            )
                                                                                          ].toList(),
                                                                                          onChanged: (val) => safeSetState(() {}),
                                                                                          controller: _model.rbNacionalidadeValueController ??= FormFieldController<String>(FFLocalizations.of(context).getText(
                                                                                            'owhj4fi0' /* Nascido no Brasil */,
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
                                                                                                  child: LinearProgressIndicator(
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<EstadosRow> ddwEstadoEstadosRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<int>(
                                                                                                controller: _model.ddwEstadoValueController ??= FormFieldController<int>(
                                                                                                  _model.ddwEstadoValue ??= 0,
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
                                                                                                  'wzyzll4u' /* Estado */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  'a2pqdwzv' /* Search... */,
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
                                                                                                _model.ddwEstadoValue,
                                                                                              ),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: LinearProgressIndicator(
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<MunicipiosRow> ddwMunicipioMunicipiosRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<int>(
                                                                                                controller: _model.ddwMunicipioValueController ??= FormFieldController<int>(
                                                                                                  _model.ddwMunicipioValue ??= 0,
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
                                                                                                  'jdgsbyfr' /* Municipio */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  'l9hnzswj' /* Search... */,
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
                                                                                  ],
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
                                                                                                      'sc0bhfzq' /*  */,
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_xr7g9mod_ON_TAP');
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
                                                                                                'uw8i01r5' /* Endereço Completo */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '97izofel' /* Endereço Completo */,
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
                                                                                      Builder(
                                                                                        builder: (context) => FlutterFlowIconButton(
                                                                                          borderRadius: 30.0,
                                                                                          buttonSize: 40.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).primary,
                                                                                          icon: Icon(
                                                                                            Icons.add_rounded,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_add_rounded_ICN_ON_TAP');
                                                                                            if (_model.txtMembrosEnderecosAddTextController.text != '') {
                                                                                              _model.outputEnderecoExists = await actions.checkValueInList(
                                                                                                _model.membrosEnderecos.toList(),
                                                                                                _model.txtMembrosEnderecosAddTextController.text,
                                                                                              );
                                                                                              if (_model.outputEnderecoExists!) {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: Container(
                                                                                                        height: 100.0,
                                                                                                        width: 300.0,
                                                                                                        child: Toast03Widget(
                                                                                                          texto: 'Endereço já existe !!!',
                                                                                                          titulo: 'Atenção',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              } else {
                                                                                                _model.addToMembrosEnderecos(_model.txtMembrosEnderecosAddTextController.text);
                                                                                                _model.updatePage(() {});
                                                                                                _model.addToMembrosLatLng(_model.placePickerEnderecoValue.latLng);
                                                                                                _model.updatePage(() {});
                                                                                                await _model.googleMapMembrosController.future.then(
                                                                                                  (c) => c.animateCamera(
                                                                                                    CameraUpdate.newLatLng(_model.membrosLatLng.lastOrNull!.toGoogleMaps()),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            } else {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: Container(
                                                                                                      height: 100.0,
                                                                                                      width: 300.0,
                                                                                                      child: Toast03Widget(
                                                                                                        texto: FFLocalizations.of(context).getText(
                                                                                                          '9jkt3qf8' /* Address was not provided !!! */,
                                                                                                        ),
                                                                                                        titulo: 'Atenção',
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            }

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
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
                                                                                                  'd56blqb1' /* To add the address(es) you nee... */,
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
                                                                                if (valueOrDefault<bool>(
                                                                                  (_model.membrosEnderecos.isNotEmpty) == true,
                                                                                  false,
                                                                                ))
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final listMembrosEnderecos = _model.membrosEnderecos.toList().take(4).toList();

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
                                                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_9l4zc2l7_ON_TAP');
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
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '4z7rsy3e' /* Informe os dados sobre o membr... */,
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
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                _model.formKey8,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.always,
                                                                            child:
                                                                                SingleChildScrollView(
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FaccoesRow> ddwFaccaoFaccoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFaccaoValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFaccaoValue ??= 0,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFaccaoFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                              optionLabels: ddwFaccaoFaccoesRowList
                                                                                                  .map((e) => valueOrDefault<String>(
                                                                                                        e.nome,
                                                                                                        'nome_faccao',
                                                                                                      ))
                                                                                                  .toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwFaccaoValue = val),
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
                                                                                                'qrs0yx4b' /* Facções */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'xcc9fckm' /* Search... */,
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
                                                                                          initialValue: TextEditingValue(),
                                                                                          optionsBuilder: (textEditingValue) {
                                                                                            if (textEditingValue.text == '') {
                                                                                              return const Iterable<String>.empty();
                                                                                            }
                                                                                            return [
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'buogb0wh' /* Option 1 */,
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
                                                                                                  'wkak4lxs' /* Batismo */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'pm0rvser' /* Batismo */,
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
                                                                                              'v5ktssho' /* Local do Batismo */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '344g39wc' /* Local do Batismo */,
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
                                                                                              'cteddjhn' /* Padrinho */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'zntstdx4' /* Padrinho */,
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
                                                                                              'uylgtxfb' /* Senha */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'h7acv992' /* Senha */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<CargosRow> ddwCargoAtualCargosRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwCargoAtualValueController ??= FormFieldController<int>(
                                                                                                _model.ddwCargoAtualValue ??= 0,
                                                                                              ),
                                                                                              options: List<int>.from(ddwCargoAtualCargosRowList.map((e) => e.cargoId).toList()),
                                                                                              optionLabels: ddwCargoAtualCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwCargoAtualValue = val),
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
                                                                                                '5xrtyank' /* Cargo atual */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'u231jvsq' /* Marital status */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<CargosRow> ddwCargoAnteriorCargosRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwCargoAnteriorValueController ??= FormFieldController<int>(
                                                                                                _model.ddwCargoAnteriorValue ??= 0,
                                                                                              ),
                                                                                              options: List<int>.from(ddwCargoAnteriorCargosRowList.map((e) => e.cargoId).toList()),
                                                                                              optionLabels: ddwCargoAnteriorCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwCargoAnteriorValue = val),
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
                                                                                                'uhi29t9v' /* Cargo anterior */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'bfv93uyj' /* Marital status */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FuncoesRow> ddwFuncaoAtualFuncoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFuncaoAtualValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFuncaoAtualValue ??= 0,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFuncaoAtualFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                              optionLabels: ddwFuncaoAtualFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwFuncaoAtualValue = val),
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
                                                                                                '0c8h6wz9' /* Função atual */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'qc1gohjk' /* Mother's Situation */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FuncoesRow> ddwFuncaoAnteriorFuncoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFuncaoAnteriorValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFuncaoAnteriorValue ??= 0,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFuncaoAnteriorFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                              optionLabels: ddwFuncaoAnteriorFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.ddwFuncaoAnteriorValue = val),
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
                                                                                                '8c2yoabs' /* Função anterior */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'xtghmnhj' /* Função anterior */,
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
                                                                                              'm25toomj' /* Três últimos locais onde estev... */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'xroteapo' /* Três últimos locais onde estev... */,
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
                                                                                      Builder(
                                                                                        builder: (context) => FlutterFlowIconButton(
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
                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_add_rounded_ICN_ON_TAP');
                                                                                            if (_model.txtFaccaoTresLocaisAddTextController.text != '') {
                                                                                              _model.addToMembrosFaccaoTresLocais(_model.txtFaccaoTresLocaisAddTextController.text);
                                                                                              safeSetState(() {});
                                                                                              safeSetState(() {
                                                                                                _model.txtFaccaoTresLocaisAddTextController?.text = '';
                                                                                              });
                                                                                            } else {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: Container(
                                                                                                      height: 100.0,
                                                                                                      width: 300.0,
                                                                                                      child: Toast03Widget(
                                                                                                        texto: FFLocalizations.of(context).getText(
                                                                                                          'jbuhl8wx' /* Location was not informed !!! */,
                                                                                                        ),
                                                                                                        titulo: 'Atenção',
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
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
                                                                                                  '6mn9o1ts' /* To add the name of the Prison(... */,
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
                                                                                            final childenTresLocais = _model.membrosFaccaoTresLocais.toList().take(3).toList();

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
                                                                                                                  logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_zcdxsxk7_ON_TAP');
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FaccoesRow> ddwFaccaoIntegrouFaccoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFaccaoIntegrouValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFaccaoIntegrouValue ??= 0,
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
                                                                                                '8uf1jitv' /* Facção que integrou */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'fzkhhi3x' /* Facção que integrou */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FaccoesRow> ddwFaccaoAliadaFaccoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFaccaoAliadaValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFaccaoAliadaValue ??= 0,
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
                                                                                                '4i6g2oa6' /* Facção aliada */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'rnawpmov' /* Father's Situation */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FaccoesRow> ddwFaccaoInimigaFaccoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFaccaoInimigaValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFaccaoInimigaValue ??= 0,
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
                                                                                                '2rfuge4k' /* Facção Inimiga */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                '03pc9yaz' /* Facção Inimiga */,
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
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey4,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '4trmbq2b' /* Informe os dados sobre os Proc... */,
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
                                                                                        'ehpi1bdt' /* Procedure */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'cqb8a5yu' /* Procedure */,
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
                                                                                        'a1mq04vz' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ptm9fsnl' /* Local Police Station */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ewv0wp4u' /* Specialized Police Station */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'tfba3ok1' /* Regional Police Station */,
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
                                                                                      'p4l0yjdk' /* Unit */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      'ugrmtsta' /* Search... */,
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
                                                                                        '2oi2gd2o' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'fqtt5evw' /* IPL. Ordinance */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'nlsyfr82' /* IPL. Flagrant */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '1sk13k9j' /* T.C.O */,
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
                                                                                      'z4wg64u9' /* Type of procedure */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      'cd6xrkst' /* Search... */,
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
                                                                                        'sgflhc8f' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '6pi3pms7' /* Drug trafficking */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '5zqnvie0' /* Qualified Robbery */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ohxl9bc7' /* Bodily Injury */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '1zj80s5y' /* Murder */,
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
                                                                                      '86bdc01p' /* Crime */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      'bqng7ebw' /* Search... */,
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
                                                                                    onFieldSubmitted: (_) async {
                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_txt_procedimento_data_');
                                                                                      _model.dataNascimento = valueOrDefault<String>(
                                                                                        _model.txtDataNascimentoTextController.text,
                                                                                        '01/01/1900',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'kkjjfns6' /* Procedure Date */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'y539pnv4' /* Procedure Date */,
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
                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_calendar_month_outline');
                                                                                    final _datePicked2Date = await showDatePicker(
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

                                                                                    if (_datePicked2Date != null) {
                                                                                      safeSetState(() {
                                                                                        _model.datePicked2 = DateTime(
                                                                                          _datePicked2Date.year,
                                                                                          _datePicked2Date.month,
                                                                                          _datePicked2Date.day,
                                                                                        );
                                                                                      });
                                                                                    } else if (_model.datePicked2 != null) {
                                                                                      safeSetState(() {
                                                                                        _model.datePicked2 = getCurrentTimestamp;
                                                                                      });
                                                                                    }
                                                                                    await Future.wait([
                                                                                      Future(() async {
                                                                                        safeSetState(() {
                                                                                          _model.txtProcedimentoDataTextController?.text = dateTimeFormat(
                                                                                            "d/M/y",
                                                                                            _model.datePicked2,
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
                                                                                        _model.dataProcedimento = _model.datePicked2;
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
                                                                                    logFirebaseEvent('MODAL_MEMBROS_ADD_COMP_CLEAR_BTN_ON_TAP');
                                                                                    _model.membrosProcedimentos = [];
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '5mm0nr5l' /* Clear */,
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
                                                                                Builder(
                                                                                  builder: (context) => FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_COMP_TO_ADD_BTN_ON_TAP');
                                                                                      if (_model.txtProcedimentoNoTextController.text != null && _model.txtProcedimentoNoTextController.text != '') {
                                                                                        _model.outputCheckProcedimentoNoExists = await actions.checkProcedimentoNoExists(
                                                                                          _model.membrosProcedimentos.toList(),
                                                                                          _model.txtProcedimentoNoTextController.text,
                                                                                        );
                                                                                        if (_model.outputCheckProcedimentoNoExists!) {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: Container(
                                                                                                  height: 100.0,
                                                                                                  width: 300.0,
                                                                                                  child: Toast03Widget(
                                                                                                    texto: 'Número de Procedimento já existe !!!',
                                                                                                    titulo: 'Atenção',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          _model.addToMembrosProcedimentos(DataTypesProcedimentosStruct(
                                                                                            procedimentoNo: _model.txtProcedimentoNoTextController.text,
                                                                                            unidade: _model.ddwProcedimentoUnidadeValue,
                                                                                            procedimentoTipo: _model.ddwProcedimentoTipoValue,
                                                                                            crime: _model.ddwProcedimentoCrimeValue,
                                                                                            data: _model.txtProcedimentoDataTextController.text,
                                                                                          ));
                                                                                          safeSetState(() {});
                                                                                        }

                                                                                        safeSetState(() {
                                                                                          _model.txtProcedimentoNoTextController?.clear();
                                                                                        });
                                                                                      } else {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: Container(
                                                                                                height: 100.0,
                                                                                                width: 300.0,
                                                                                                child: Toast03Widget(
                                                                                                  texto: 'Não foi informado o número do Processo o !!!!',
                                                                                                  titulo: 'Atenção',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '8pxnhql5' /* To add */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.add_rounded,
                                                                                      color: FlutterFlowTheme.of(context).info,
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
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 13.0)),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
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
                                                                                                'g3vpoxn0' /* Procedure */,
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
                                                                                                '6vsm4hcv' /* Unit */,
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
                                                                                                  '1rnrt2ya' /* Type of procedure: */,
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
                                                                                                  '7esylq1a' /* Crime */,
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
                                                                                                  '8m6o6goq' /* Data */,
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
                                                                                                                      childrenProcedimentosItem.unidade,
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
                                                                                                                    childrenProcedimentosItem.procedimentoTipo,
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
                                                                                                                    childrenProcedimentosItem.crime,
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
                                                                                                                          childrenProcedimentosItem.data,
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
                                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_wakbomnr_ON_TAP');
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
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey3,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '50bd7mi1' /* Provide information about the ... */,
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
                                                                                          'ig1tpcu8' /* Criminal action number */,
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
                                                                                          'on8d1j5b' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '3y3arw03' /* 1st CRIMINAL COURT */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '2ad97h60' /* 2nd CRIMINAL COURT */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '62uy1ula' /* 3rd CRIMINAL COURT */,
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
                                                                                        '52tqxh7t' /* Stick */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'f81efpi5' /* Search ... */,
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
                                                                                          '9ntgj4nz' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '9krzgpyy' /* Convicted */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'veeirmiy' /* Provisional */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '85dco8ds' /* Awaiting sentence */,
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
                                                                                        'njzw806d' /* Legal status */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'p7i3qgzk' /* Search... */,
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
                                                                                          'eskukxtn' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '3ucnkzsn' /* Closed */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '9ogzdq4x' /* Semi-open */,
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
                                                                                        'gjnab6i2' /* Regime */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'zgtd0ndz' /* Search... */,
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
                                                                                          'qoe55ylu' /*  */,
                                                                                        ),
                                                                                      ),
                                                                                      options: [
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'tn9os876' /* Nenhuma das opções */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '6f4ajcmk' /* Arrested */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'wjr32pf6' /* Loose */,
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
                                                                                        'whrvcs43' /* Defendant situation */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'dquf2f18' /* Search... */,
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
                                                                                      logFirebaseEvent('MODAL_MEMBROS_ADD_TO_CLEAN_BTN_ON_TAP');
                                                                                      _model.membrosProcessos = [];
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'tveo07et' /* To clean */,
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
                                                                                  Builder(
                                                                                    builder: (context) => FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('MODAL_MEMBROS_ADD_COMP_TO_ADD_BTN_ON_TAP');
                                                                                        if (_model.txtProcessoNoAcaoPenalTextController.text != null && _model.txtProcessoNoAcaoPenalTextController.text != '') {
                                                                                          _model.outputCheckProcessoExists = await actions.checkAcaopenalNoExists(
                                                                                            _model.membrosProcessos.toList(),
                                                                                            _model.txtProcessoNoAcaoPenalTextController.text,
                                                                                          );
                                                                                          if (_model.outputCheckProcessoExists!) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: Container(
                                                                                                    height: 100.0,
                                                                                                    width: 300.0,
                                                                                                    child: Toast03Widget(
                                                                                                      texto: 'Número da Ação Penal já existe !!!',
                                                                                                      titulo: 'Atenção',
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            _model.addToMembrosProcessos(DataTypesProcessosStruct(
                                                                                              acaoPenalNo: _model.txtProcessoNoAcaoPenalTextController.text,
                                                                                              vara: _model.ddwProcessoVaraValue,
                                                                                              situacaoJuridica: _model.ddwProcessoSituacaoJuridicaValue,
                                                                                              regime: _model.ddwProcessoRegimeValue,
                                                                                              situacaoReu: _model.ddwProcessoSituacaoReuValue,
                                                                                            ));
                                                                                            safeSetState(() {});
                                                                                          }

                                                                                          safeSetState(() {
                                                                                            _model.txtProcessoNoAcaoPenalTextController?.clear();
                                                                                          });
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: Container(
                                                                                                  height: 100.0,
                                                                                                  width: 300.0,
                                                                                                  child: Toast03Widget(
                                                                                                    texto: 'Não foi informada o Número da Ação Penal  !!!',
                                                                                                    titulo: 'Atenção',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'vm7t0n6u' /* To add */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_rounded,
                                                                                        color: FlutterFlowTheme.of(context).info,
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
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
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
                                                                                                'noufgwqe' /* Criminal action number */,
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
                                                                                                'xeuwwqlt' /* Stick */,
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
                                                                                                  '9t25cx0m' /* Legal status */,
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
                                                                                                  'ptv8ms3l' /* Regime */,
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
                                                                                                  '670xv14p' /* Defendant situation */,
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
                                                                                                                    childrenProcessosItem.acaoPenalNo,
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
                                                                                                                      childrenProcessosItem.vara,
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
                                                                                                                    childrenProcessosItem.situacaoJuridica,
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
                                                                                                                    childrenProcessosItem.regime,
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
                                                                                                                            childrenProcessosItem.situacaoReu,
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
                                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_Icon_mt52g5ip_ON_TAP');
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
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '7v3qtjj2' /* Make a summary of the main cri... */,
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
                                                                        key: _model
                                                                            .formKey7,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
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
                                                                                    'q663z63w' /* Historic */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                  alignLabelWithHint: true,
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'dpwi4x3z' /* Historic */,
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
                                                                                    'n1o81u1k' /* Crime Action */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                  alignLabelWithHint: true,
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'bc31iq3e' /* Crime Action */,
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
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey5,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.always,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '3etmnyzt' /* Enable alert */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    fontSize: 22.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Switch.adaptive(
                                                                                value: _model.switchAlertaValue!,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchAlertaValue = newValue!);
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).error,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).error,
                                                                                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.txtMembroAlertaTextController,
                                                                          focusNode:
                                                                              _model.txtMembroAlertaFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.txtMembroAlertaTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          textCapitalization:
                                                                              TextCapitalization.words,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '29530mgy' /* Alert */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                            alignLabelWithHint:
                                                                                true,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'kx61gjir' /* Alert */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                24.0,
                                                                                24.0,
                                                                                24.0),
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          maxLines:
                                                                              20,
                                                                          keyboardType:
                                                                              TextInputType.multiline,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .txtMembroAlertaTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              KeepAliveWidgetWrapper(
                                                                builder:
                                                                    (context) =>
                                                                        Form(
                                                                  key: _model
                                                                      .formKey6,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .always,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
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
                                                                                        'hg8tsf0e' /* Percentage of data validations */,
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
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'z911x2kd' /* How were the data and informat... */,
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
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowChoiceChips(
                                                                                          options: [
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'udriebg5' /* Local validation or area of ​​... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'ekk2ybut' /* Only through open sources */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'jq3rovfo' /* Only through restricted source... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'si112iv5' /* Through other intelligence age... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'ucqyj1ot' /* Through other bodies such as: ... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'qd88nb62' /* Only through report(s) */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'gq42kahm' /* Inside a State Prison Facility */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'ma9rbpmx' /* Dentro de um Estabelecimento P... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              '1i2vccnc' /* Apenas através de informante(s... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'zcj6hpny' /* Apenas através de Coolaborador... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'v0fvpqeq' /*  */,
                                                                                            ))
                                                                                          ],
                                                                                          onChanged: (val) async {
                                                                                            safeSetState(() => _model.choiceChipsValidacoesValues = val);
                                                                                            logFirebaseEvent('MODAL_MEMBROS_ADD_ChoiceChipsValidacoes_');
                                                                                            _model.selectedCountValidados = _model.choiceChipsValidacoesValues?.length;
                                                                                            safeSetState(() {});
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
                                                                                            [],
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
                                                                                                'hu7rwf8m' /* Observação(ões) */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    lineHeight: 5.0,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '0a8jmcbn' /* Observação(ões) */,
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
                                                                                  ].divide(SizedBox(height: 16.0)),
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
                                                      ],
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 16.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'n5wowq93' /* Relations */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
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
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final childrenRolMembrosRelacoes =
                                                                                _model.membrosRelacoes.map((e) => e).toList().take(3).toList();

                                                                            return GridView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 3,
                                                                                crossAxisSpacing: 10.0,
                                                                                mainAxisSpacing: 10.0,
                                                                                childAspectRatio: 1.0,
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: childrenRolMembrosRelacoes.length,
                                                                              itemBuilder: (context, childrenRolMembrosRelacoesIndex) {
                                                                                final childrenRolMembrosRelacoesItem = childrenRolMembrosRelacoes[childrenRolMembrosRelacoesIndex];
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/379/600',
                                                                                    width: 200.0,
                                                                                    height: 200.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hikp6nbx' /* Groups */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final childrenColMembrosGrupos = _model
                                                                      .membrosGrupos
                                                                      .toList()
                                                                      .take(9)
                                                                      .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                        childrenColMembrosGrupos
                                                                            .length,
                                                                        (childrenColMembrosGruposIndex) {
                                                                      final childrenColMembrosGruposItem =
                                                                          childrenColMembrosGrupos[
                                                                              childrenColMembrosGruposIndex];
                                                                      return Expanded(
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final childrenRolMembrosGrupos =
                                                                                _model.membrosGrupos.toList().take(3).toList();

                                                                            return GridView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 3,
                                                                                crossAxisSpacing: 10.0,
                                                                                mainAxisSpacing: 10.0,
                                                                                childAspectRatio: 1.0,
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: childrenRolMembrosGrupos.length,
                                                                              itemBuilder: (context, childrenRolMembrosGruposIndex) {
                                                                                final childrenRolMembrosGruposItem = childrenRolMembrosGrupos[childrenRolMembrosGruposIndex];
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/79/600',
                                                                                    width: 200.0,
                                                                                    height: 200.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                    onPressed: () {
                                                      print(
                                                          'ButtonCancelar pressed ...');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'qziqype9' /* Cancel */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.cancel_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          'MODAL_MEMBROS_ADD_SAVE_MEMBER_BTN_ON_TAP');
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
                                                                        'Salvar dados'),
                                                                    content: Text(
                                                                        'Deseja salvar os  dados adicionados ?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancelar'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirmar'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        _model.outputMembrosAdd =
                                                            await MembrosTable()
                                                                .insert({
                                                          'nome_completo': _model
                                                              .txtNomeCompletoTextController
                                                              .text,
                                                          'alcunha': _model
                                                              .membrosAlcunhas,
                                                          'cpf': _model
                                                              .txtNoCpfTextController
                                                              .text,
                                                          'identidade': _model
                                                              .txtNoIdentidadeTextController
                                                              .text,
                                                          'naturalidade': _model
                                                              .txtMembroNaturalidadeTextController
                                                              .text,
                                                          'filiacao_mae': _model
                                                              .txtFiliacaoMaeTextController
                                                              .text,
                                                          'filiacao_pai': _model
                                                              .txtFiliacaoPaiTextController
                                                              .text,
                                                          'situacao_mae': _model
                                                              .ddwSituacaoMaeValue,
                                                          'situacao_pai': _model
                                                              .ddwSituacaoPaiValue,
                                                          'nivel_instrucao': _model
                                                              .ddwNivelInstrucaoValue,
                                                          'estado_civil': _model
                                                              .ddwEstadoCivilValue,
                                                          'membro_endereco': _model
                                                              .membrosEnderecos,
                                                          'estado_id': _model
                                                              .ddwEstadoValue,
                                                          'historico': _model
                                                              .txtHistoricoTextController
                                                              .text,
                                                          'faccao_id': _model
                                                              .ddwFaccaoValue,
                                                          'batismo': _model
                                                              .txtFaccaoBastismoTextController
                                                              .text,
                                                          'batismo_local': _model
                                                              .txtFacaoLocalBastismoTextController
                                                              .text,
                                                          'padrinho': _model
                                                              .txtMembrosFaccaoPadrinhoTextController
                                                              .text,
                                                          'faccao_senha': _model
                                                              .txtMembroFaccaoSenhaTextController
                                                              .text,
                                                          'cargo_id': _model
                                                              .ddwCargoAtualValue,
                                                          'funcao_id': _model
                                                              .ddwFuncaoAtualValue,
                                                          'cargo_ant_id': _model
                                                              .ddwCargoAnteriorValue,
                                                          'faccao_inimiga': _model
                                                              .ddwFaccaoInimigaValue,
                                                          'faccao_aliada': _model
                                                              .ddwFaccaoAliadaValue,
                                                          'nacionalidade': _model
                                                              .rbNacionalidadeValue,
                                                          'funcao_ant_id': _model
                                                              .ddwFuncaoAnteriorValue,
                                                          'faccao_integrou': _model
                                                              .ddwFaccaoIntegrouValue,
                                                          'municipio_id': _model
                                                              .ddwMunicipioValue,
                                                          'infopen': _model
                                                              .txtNoInfopenTextController
                                                              .text,
                                                          'tres_ultimo_locais_preso':
                                                              _model
                                                                  .membrosFaccaoTresLocais,
                                                          'alerta': _model
                                                              .switchAlertaValue,
                                                          'atuacao_crime': _model
                                                              .txtMembroAtuacaoTextController
                                                              .text,
                                                          'validacao_precentual':
                                                              valueOrDefault<
                                                                  double>(
                                                            _model
                                                                .membrosPercetualValidacao,
                                                            0.10,
                                                          ),
                                                          'validacoes': _model
                                                              .choiceChipsValidacoesValues,
                                                          'coordenadas': functions
                                                              .convertLatLngListToStringList(
                                                                  _model
                                                                      .membrosLatLng
                                                                      .toList()),
                                                          'membroLngLat': functions
                                                              .convertLatLngToDouble(
                                                                  _model
                                                                      .membrosLatLng
                                                                      .toList()),
                                                          'identidade_orgao': _model
                                                              .ddwOrgaoExpedidorValue,
                                                          'alerta_observacao':
                                                              _model
                                                                  .txtMembroAlertaTextController
                                                                  .text,
                                                          'fotos_path': _model
                                                                  .membrosFotos
                                                                  .isNotEmpty
                                                              ? _model
                                                                  .membrosFotos
                                                              : _model
                                                                  .membrosFotosSemUrl,
                                                          'dt_nascimento':
                                                              _model.datePicked2
                                                                  ?.toString(),
                                                          'validacao_observacao':
                                                              (_model.txtValidacoesObservacoesFocusNode
                                                                          ?.hasFocus ??
                                                                      false)
                                                                  .toString(),
                                                          'id_usuario':
                                                              FFAppState()
                                                                  .UsuarioAtualId,
                                                          'id_agencia':
                                                              FFAppState()
                                                                  .AgenciaAtualld,
                                                        });
                                                        _shouldSetState = true;
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                    .membrosProcedimentos
                                                                    .length >=
                                                                1) {
                                                              _model.membrosProcedimentosCount =
                                                                  -1;
                                                              // procedeimentosTotal
                                                              _model.procedimentoTotal =
                                                                  _model
                                                                      .membrosProcedimentos
                                                                      .length;
                                                              while (_model
                                                                      .membrosProcedimentosCount! <=
                                                                  _model
                                                                      .procedimentoTotal) {
                                                                _model.membrosProcedimentosCount =
                                                                    _model.membrosProcedimentosCount! +
                                                                        1;
                                                                _model.apiResultProcedimentos =
                                                                    await ProcedimentosAddCall
                                                                        .call(
                                                                  membroId: _model
                                                                      .outputMembrosAdd
                                                                      ?.membroId,
                                                                  procedimentoNo:
                                                                      _model
                                                                          .txtProcedimentoNoTextController
                                                                          .text,
                                                                  unidade: _model
                                                                      .ddwProcedimentoUnidadeValue,
                                                                  procedimentoTipo:
                                                                      _model
                                                                          .ddwProcedimentoTipoValue,
                                                                  crime: _model
                                                                      .ddwProcedimentoCrimeValue,
                                                                  data: _model
                                                                      .txtProcedimentoDataTextController
                                                                      .text,
                                                                );

                                                                _shouldSetState =
                                                                    true;
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
                                                              // procedeimentosTotal
                                                              _model.procedimentoTotal =
                                                                  _model
                                                                      .membrosProcessos
                                                                      .length;
                                                              while (_model
                                                                      .membrosProcessosCount! <=
                                                                  _model
                                                                      .processoTotal) {
                                                                _model.membrosProcessosCount =
                                                                    _model.membrosProcessosCount! +
                                                                        1;
                                                                _model.apiResultProcessos =
                                                                    await ProcessosAddCall
                                                                        .call(
                                                                  membroId: _model
                                                                      .outputMembrosAdd
                                                                      ?.membroId,
                                                                  acaoPenalNo: _model
                                                                      .membrosProcessos
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .membrosProcessosCount!)
                                                                      ?.acaoPenalNo,
                                                                  vara: _model
                                                                      .membrosProcessos
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .membrosProcessosCount!)
                                                                      ?.vara,
                                                                  situacaoJuridica: _model
                                                                      .membrosProcessos
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .membrosProcessosCount!)
                                                                      ?.situacaoJuridica,
                                                                  regime: _model
                                                                      .membrosProcessos
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .membrosProcessosCount!)
                                                                      ?.regime,
                                                                  situacaoReu: _model
                                                                      .membrosProcessos
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .membrosProcessosCount!)
                                                                      ?.situacaoReu,
                                                                );

                                                                _shouldSetState =
                                                                    true;
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
                                                                  'Adicionar membro'),
                                                              content: Text(
                                                                  'Dados dos membros adicionados com sucesso !'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        Navigator.pop(context);

                                                        context.pushNamed(
                                                            'main_membros');
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'xkcg34s5' /* Save Member */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.check_circle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
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
                  ],
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!),
        ),
      ],
    );
  }
}
