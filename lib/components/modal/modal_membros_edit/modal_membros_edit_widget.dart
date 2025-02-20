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
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
import 'modal_membros_edit_model.dart';
export 'modal_membros_edit_model.dart';

class ModalMembrosEditWidget extends StatefulWidget {
  const ModalMembrosEditWidget({
    super.key,
    this.membrosRow,
    this.membrosFotos,
    this.membrosId,
  });

  final MembrosViewConcatSeachRow? membrosRow;
  final List<String>? membrosFotos;
  final int? membrosId;

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
      await Future.wait([
        Future(() async {
          _model.membrosFotoPathEdit =
              widget!.membrosFotos!.toList().cast<String>();
          _model.membrosAlcunhas =
              widget!.membrosRow!.alcunha.toList().cast<String>();
          _model.membrosEnderecos =
              widget!.membrosRow!.membroEndereco.toList().cast<String>();
          _model.membroAlerta = widget!.membrosRow!.alerta!;
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
          _model.membroId = widget!.membrosRow?.membroId;
          _model.updatePage(() {});
          await _model.googleMapMembrosController.future.then(
            (c) => c.animateCamera(
              CameraUpdate.newLatLng(functions
                  .convertDoubleToLatLng(
                      widget!.membrosRow!.membroLngLat.toList())
                  .firstOrNull!
                  .toGoogleMaps()),
            ),
          );
        }),
        Future(() async {
          // Procedimentos
          _model.apiOutputProcedimentosGet = await ProcedimentosGetCall.call(
            membroId: widget!.membrosRow?.membroId,
          );

          if ((_model.apiOutputProcedimentosGet?.succeeded ?? true)) {
            _model.membrosProcedimentos =
                ((_model.apiOutputProcedimentosGet?.jsonBody ?? '')
                        .toList()
                        .map<DataTypesProcedimentosStruct?>(
                            DataTypesProcedimentosStruct.maybeFromMap)
                        .toList() as Iterable<DataTypesProcedimentosStruct?>)
                    .withoutNulls
                    .toList()
                    .cast<DataTypesProcedimentosStruct>();
            _model.updatePage(() {});
          }
        }),
        Future(() async {
          // Processos
          _model.apiOutputProcessosGet = await ProcessosGetCall.call(
            membroId: widget!.membrosRow?.membroId,
          );

          if ((_model.apiOutputProcessosGet?.succeeded ?? true)) {
            _model.membrosProcessos =
                ((_model.apiOutputProcessosGet?.jsonBody ?? '')
                        .toList()
                        .map<DataTypesProcessosStruct?>(
                            DataTypesProcessosStruct.maybeFromMap)
                        .toList() as Iterable<DataTypesProcessosStruct?>)
                    .withoutNulls
                    .toList()
                    .cast<DataTypesProcessosStruct>();
            _model.updatePage(() {});
          }
        }),
        Future(() async {
          _model.ddwEstado = widget!.membrosRow?.estadoId;
          _model.ddwMunicipios = widget!.membrosRow?.municipioId;
          _model.ddwFaccao = widget!.membrosRow?.faccaoId;
          _model.ddwCargoAtual = widget!.membrosRow?.cargoId;
          _model.ddwCargoAnterior = widget!.membrosRow?.cargoAntId;
          _model.ddwFuncaoAtual = widget!.membrosRow?.funcaoId;
          _model.ddwFuncaoAnterior = widget!.membrosRow?.funcaoAntId;
          _model.ddwFaccaoIntegrou = widget!.membrosRow?.faccaoIntegrou;
          _model.ddwFaccaoAliada = widget!.membrosRow?.faccaoAliada;
          _model.ddwFaccaoInimiga = widget!.membrosRow?.faccaoInimiga;
          safeSetState(() {});
          safeSetState(() {
            _model.ddwEstadoValueController?.value =
                widget!.membrosRow!.estadoId!;
          });
          // ddw_municipio
          safeSetState(() {
            _model.ddwMunicipioValueController?.value =
                widget!.membrosRow!.municipioId!;
          });
          // ddw_faccao
          safeSetState(() {
            _model.ddwFaccaoValueController?.value =
                widget!.membrosRow!.faccaoId!;
          });
          safeSetState(() {
            _model.ddwCargoAtualValueController?.value =
                widget!.membrosRow!.cargoId!;
          });
          safeSetState(() {
            _model.ddwCargoAnteriorValueController?.value =
                widget!.membrosRow!.cargoAntId!;
          });
        }),
        Future(() async {
          _model.membroAlerta = widget!.membrosRow!.alerta!;
          safeSetState(() {});
          safeSetState(() {
            _model.ddwFuncaoAtualValueController?.value =
                widget!.membrosRow!.funcaoId!;
          });
          safeSetState(() {
            _model.ddwFuncaoAnteriorValueController?.value =
                widget!.membrosRow!.funcaoAntId!;
          });
          safeSetState(() {
            _model.ddwFaccaoIntegrouValueController?.value =
                widget!.membrosRow!.faccaoIntegrou!;
          });
          safeSetState(() {
            _model.ddwFaccaoAliadaValueController?.value =
                widget!.membrosRow!.faccaoAliada!;
          });
          safeSetState(() {
            _model.ddwFaccaoInimigaValueController?.value =
                widget!.membrosRow!.faccaoInimiga!;
          });
        }),
      ]);
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

    _model.txtDataNascimentoTextController ??=
        TextEditingController(text: widget!.membrosRow?.dtNascimento);
    _model.txtDataNascimentoFocusNode ??= FocusNode();

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
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 4.0,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
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
                                                  'aio7rafl' /* Edit Member */,
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
                                            'MODAL_MEMBROS_EDIT_close_rounded_ICN_ON_');
                                        Navigator.pop(context);

                                        context.pushNamed(
                                            MainMembrosWidget.routeName);
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                                                  'u9igb1yq' /* Profile */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nush2i23' /* Localization */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '97b1e2e0' /* Facção */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ybzgoi8h' /* Procedimentos */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'jef57m6i' /* Procedures */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9sw9bxv6' /* Performance */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'hx1kcdii' /* Alert */,
                                                                ),
                                                              ),
                                                              Tab(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0xfe3tt2' /* Validation */,
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
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: SingleChildScrollView(
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
                                                                                            'ugxyziat' /* Edit photo(s) of the alleged m... */,
                                                                                          ),
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_5y4iu8xs_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(0) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(0, _model.uploadedFileUrl1);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(0) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            0,
                                                                                                            (_) => _model.uploadedFileUrl1,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(0, _model.uploadedFileUrl1);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '85kdagut' /* Edit photo #1 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_1_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(0),
                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                                ),
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, 0.0),
                                                                                                              ),
                                                                                                              allowRotation: false,
                                                                                                              tag: valueOrDefault<String>(
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(0),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(0),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(0),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_wvfzgbsd_ON_TAP');
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

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            0,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_t46f1ly5_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(1) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(1, _model.uploadedFileUrl2);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(1) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            1,
                                                                                                            (_) => _model.uploadedFileUrl2,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(1, _model.uploadedFileUrl2);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'ynces9mz' /* Edit photo #2 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_2_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(1),
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
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(1),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(1),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(1),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_5kzmf9le_ON_TAP');
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

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            1,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_zkt3f6ek_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(2) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(2, _model.uploadedFileUrl3);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(2) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            2,
                                                                                                            (_) => _model.uploadedFileUrl3,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(2, _model.uploadedFileUrl3);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'fuel4pgh' /* Edit photo #3 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_3_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(2),
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
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(2),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(2),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(2),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_3do1ifx0_ON_TAP');
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

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            2,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_jmqru9u5_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(3) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(3, _model.uploadedFileUrl4);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(3) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            3,
                                                                                                            (_) => _model.uploadedFileUrl4,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(3, _model.uploadedFileUrl4);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'aau28qh5' /* Edit photo #4 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_4_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(3),
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
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(3),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(3),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(3),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_9utjuh90_ON_TAP');
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

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            3,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_d2icvrq8_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(4) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(4, _model.uploadedFileUrl5);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(4) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            4,
                                                                                                            (_) => _model.uploadedFileUrl5,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(4, _model.uploadedFileUrl5);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'q694r92x' /* Edit photo #5 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_5_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(4),
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
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(4),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(4),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(4),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_bhzfcmp3_ON_TAP');
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
                                                                                                            _model.isDataUploading5 = false;
                                                                                                            _model.uploadedLocalFile5 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                            _model.uploadedFileUrl5 = '';
                                                                                                          });

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            4,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_Text_5s5k6igr_ON_TAP');
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

                                                                                                      if (_model.membrosFotosEditSem.elementAtOrNull(5) == '') {
                                                                                                        _model.insertAtIndexInMembrosFotoPathEdit(5, _model.uploadedFileUrl6);
                                                                                                        _model.updatePage(() {});
                                                                                                      } else {
                                                                                                        if (_model.membrosFotoPathEdit.elementAtOrNull(5) == FFAppState().MembrosImagePathLight) {
                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            5,
                                                                                                            (_) => _model.uploadedFileUrl6,
                                                                                                          );
                                                                                                          _model.updatePage(() {});
                                                                                                        } else {
                                                                                                          _model.insertAtIndexInMembrosFotoPathEdit(5, _model.uploadedFileUrl6);
                                                                                                          _model.updatePage(() {});
                                                                                                        }
                                                                                                      }
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'gqq81yqc' /* Edit photo #6 */,
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_membro_foto_6_ON_TAP');
                                                                                                        await Navigator.push(
                                                                                                          context,
                                                                                                          PageTransition(
                                                                                                            type: PageTransitionType.fade,
                                                                                                            child: FlutterFlowExpandedImageView(
                                                                                                              image: CachedNetworkImage(
                                                                                                                fadeInDuration: Duration(milliseconds: 100),
                                                                                                                fadeOutDuration: Duration(milliseconds: 100),
                                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                                  _model.membrosFotoPathEdit.elementAtOrNull(5),
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
                                                                                                                _model.membrosFotoPathEdit.elementAtOrNull(5),
                                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                              ),
                                                                                                              useHeroAnimation: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      child: Hero(
                                                                                                        tag: valueOrDefault<String>(
                                                                                                          _model.membrosFotoPathEdit.elementAtOrNull(5),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png',
                                                                                                        ),
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: Duration(milliseconds: 100),
                                                                                                            fadeOutDuration: Duration(milliseconds: 100),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              _model.membrosFotoPathEdit.elementAtOrNull(5),
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
                                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_Icon_niqm5qms_ON_TAP');
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
                                                                                                            _model.isDataUploading6 = false;
                                                                                                            _model.uploadedLocalFile6 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                            _model.uploadedFileUrl6 = '';
                                                                                                          });

                                                                                                          _model.updateMembrosFotoPathEditAtIndex(
                                                                                                            5,
                                                                                                            (_) => FFAppState().MembrosImagePathLight,
                                                                                                          );
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
                                                                                                'cjzsqqv7' /* Nome completo */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              alignLabelWithHint: true,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'p1m1tnj8' /* Nome completo */,
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
                                                                                                '6ljlgnvn' /* Alcunha */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'w26pv6j9' /* Alcunha */,
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
                                                                                              logFirebaseEvent('MODAL_MEMBROS_EDIT_add_rounded_ICN_ON_TA');
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
                                                                                                  safeSetState(() {});
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
                                                                                                            'dzqay8zm' /* Nickname was not provided !!! */,
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
                                                                                                  'm2152j19' /* To add nickname(s) you need to... */,
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
                                                                                                'mf6yz85n' /* Naturalidade */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              alignLabelWithHint: true,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'tc59lw4v' /* Naturalidade */,
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
                                                                                                controller: _model.ddwEstadoCivilValueController ??= FormFieldController<String>(
                                                                                                  _model.ddwEstadoCivilValue ??= valueOrDefault<String>(
                                                                                                    widget!.membrosRow?.estadoCivil,
                                                                                                    '0',
                                                                                                  ),
                                                                                                ),
                                                                                                options: [
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'b8umkqaj' /* Solteiro */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '8f8bj925' /* Casado */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'l0c6o2vi' /* DIvorciado */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '6neagzf3' /* Viúvo(a) */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'li5bp9k2' /* Separados legalmente */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '1z5ocen9' /* União estável */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'gzwgr7rc' /* Nenhuma das opções */,
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
                                                                                                  'bn5zq0b6' /* Estado civil */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  'n6o2fg5j' /* Estado civil */,
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
                                                                                                'ryl4di26' /* Date of birth */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              alignLabelWithHint: true,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '0avskohf' /* Date of birth */,
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
                                                                                            logFirebaseEvent('MODAL_MEMBROS_EDIT_IconButtonDataNascime');
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
                                                                                                _model.dataNascimento = _model.dataNascimento;
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
                                                                                                '1rnji010' /* Identidade */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '49db29m6' /* Identidade */,
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
                                                                                                    'wvr9cc10' /* SSP-AL */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '07xz1kpl' /* SSP-SE */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'u8uzbbuq' /* SSP-CE */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'b71ijmxi' /* SSP-PE */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'k64dcqek' /* SSP-BA */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    's0yxc7cm' /* SSP-RN */,
                                                                                                  ),
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'nqta1lbt' /* None of the options */,
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
                                                                                                  '2lnyrfyl' /* Issuing body */,
                                                                                                ),
                                                                                                searchHintText: FFLocalizations.of(context).getText(
                                                                                                  'c0fc7t8z' /* Issuing body */,
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
                                                                                                'kewsqf7n' /* CPF */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '2agxn2ef' /* CPF */,
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
                                                                                                '0u66thxq' /* Infopen Registration */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '9vtw9xlw' /* Infopen Registration */,
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
                                                                                                'ax5xgafh' /* Mother's name */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'p5upaqv8' /* Mother's name */,
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
                                                                                                'sw2229qh' /* Alive */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'y14lxjjv' /* Deceased */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'mcyzweup' /* Wheelchair user */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'tvsekezy' /* No information */,
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
                                                                                              '9ta2olb4' /* Mother's situation */,
                                                                                            ),
                                                                                            searchHintText: FFLocalizations.of(context).getText(
                                                                                              '1p2osl20' /* Mother's situation */,
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
                                                                                                'kelmg7n9' /* Father's name */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'qy43nfeq' /* Father's name */,
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
                                                                                                'ezdwp8nj' /* Alive */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'hvgfk05t' /* Deceased */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '4vdaqgl1' /* Wheelchair user */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'xtedmrt2' /* No information */,
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
                                                                                              'c1v84ync' /* Father's situation */,
                                                                                            ),
                                                                                            searchHintText: FFLocalizations.of(context).getText(
                                                                                              '0lzuakeh' /* Father's situation */,
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
                                                                                                'e362kelk' /* Alfabetizado */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '3iudfpqu' /* illiterate */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '8zm1nu3m' /* Completed elementary education */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '9hpjus5x' /* Completed high school */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'oxejbyrd' /* Completed higher education */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'k536mfjq' /* Incomplete elementary educatio... */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'mab8f0eh' /* Incomplete high school */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '2ywod1g1' /* Incomplete higher education */,
                                                                                              ),
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'n51g1r1a' /* No information */,
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
                                                                                              'we77ofck' /* Degree or Level of Education */,
                                                                                            ),
                                                                                            searchHintText: FFLocalizations.of(context).getText(
                                                                                              'tcda70af' /* Degree or Level of Education */,
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
                                                                            .formKey4,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                SingleChildScrollView(
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
                                                                                            'l5mf9m1y' /* Nascido no Brasil */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'llboqhag' /* Naturalizado Brasileiro */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '1j2onv40' /* Estrangeiro */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                'djh3duzz' /* Estado */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'ry52440u' /* Search... */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                's2dyp3u7' /* Municipio */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'wvgc4p4g' /* Search... */,
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
                                                                                                        'dj9lhf71' /*  */,
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
                                                                                                  '43pt4zbk' /* Endereço Completo */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'vz6474h5' /* Endereço Completo */,
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
                                                                                                            '0g539rfy' /* Address was not provided !!! */,
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
                                                                                                    'rtp4h0ou' /* To add the address(es) you nee... */,
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
                                                                                                  initialLocation: _model.googleMapMembrosCenter ??= LatLng(0.0, 0.0),
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
                                                                                                  initialZoom: 5.0,
                                                                                                  allowInteraction: true,
                                                                                                  allowZoom: true,
                                                                                                  showZoomControls: true,
                                                                                                  showLocation: true,
                                                                                                  showCompass: true,
                                                                                                  showMapToolbar: true,
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
                                                                                'sw77nyyo' /* Informe os dados sobre o membr... */,
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
                                                                                _model.formKey6,
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
                                                                                                _model.ddwFaccaoValue ??= _model.ddwFaccao,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFaccaoFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                              optionLabels: ddwFaccaoFaccoesRowList
                                                                                                  .map((e) => valueOrDefault<String>(
                                                                                                        e.nome,
                                                                                                        'nome_faccao',
                                                                                                      ))
                                                                                                  .toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFaccaoValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_faccao_ON_FORM_WI');
                                                                                                _model.ddwFaccao = _model.ddwFaccaoValue;
                                                                                              },
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
                                                                                                'klqjnvfh' /* Facções */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'ha89iakt' /* Search... */,
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
                                                                                                'af8olv3g' /* Option 1 */,
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
                                                                                                  'i0zuv1w1' /* Batismo */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                alignLabelWithHint: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  '4ol9ifx0' /* Batismo */,
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
                                                                                              '6t9d57s9' /* Local do Batismo */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '3ay3vk0g' /* Local do Batismo */,
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
                                                                                              'biofk7uv' /* Padrinho */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'dd1i37ct' /* Padrinho */,
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
                                                                                              'frfuncol' /* Senha */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            alignLabelWithHint: true,
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '7i70azg8' /* Senha */,
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
                                                                                                _model.ddwCargoAtualValue ??= _model.ddwCargoAtual,
                                                                                              ),
                                                                                              options: List<int>.from(ddwCargoAtualCargosRowList.map((e) => e.cargoId).toList()),
                                                                                              optionLabels: ddwCargoAtualCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwCargoAtualValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_cargo_atual_ON_FO');
                                                                                                _model.ddwCargoAtual = _model.ddwCargoAtualValue;
                                                                                              },
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
                                                                                                'x84yqtw6' /* Current position */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'tk7h51ga' /* Marital status */,
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
                                                                                                _model.ddwCargoAnteriorValue ??= _model.ddwCargoAnterior,
                                                                                              ),
                                                                                              options: List<int>.from(ddwCargoAnteriorCargosRowList.map((e) => e.cargoId).toList()),
                                                                                              optionLabels: ddwCargoAnteriorCargosRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwCargoAnteriorValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_cargo_anterior_ON');
                                                                                                _model.ddwCargoAnterior = _model.ddwFuncaoAnteriorValue;
                                                                                              },
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
                                                                                                'pkvjs31h' /* Previous position */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'niusw42e' /* Marital status */,
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
                                                                                                _model.ddwFuncaoAtualValue ??= _model.ddwFuncaoAtual,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFuncaoAtualFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                              optionLabels: ddwFuncaoAtualFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFuncaoAtualValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_funcao_atual_ON_F');
                                                                                                _model.ddwFuncaoAtual = _model.ddwFuncaoAtualValue;
                                                                                              },
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
                                                                                                'w463zyi4' /* Função atual */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'byv74h62' /* Mother's Situation */,
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
                                                                                                _model.ddwFuncaoAnteriorValue ??= _model.ddwFuncaoAnterior,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFuncaoAnteriorFuncoesRowList.map((e) => e.funcaoId).toList()),
                                                                                              optionLabels: ddwFuncaoAnteriorFuncoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFuncaoAnteriorValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_funcao_anterior_O');
                                                                                                _model.ddwFuncaoAnterior = _model.ddwFuncaoAnteriorValue;
                                                                                              },
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
                                                                                                'ienhwnkh' /* Função anterior */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'n59bc13k' /* Função anterior */,
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
                                                                                              'noeec8r2' /* Três últimos locais onde estev... */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '79dkmmv3' /* Três últimos locais onde estev... */,
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
                                                                                            logFirebaseEvent('MODAL_MEMBROS_EDIT_add_rounded_ICN_ON_TA');
                                                                                            if (_model.txtFaccaoTresLocaisAddTextController.text != '') {
                                                                                              _model.addToMembrosFaccaoTresLocais(_model.txtFaccaoTresLocaisAddTextController.text);
                                                                                              safeSetState(() {});
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
                                                                                                          'csgib8df' /* Location was not informed !!! */,
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
                                                                                                  'ky34u2o1' /* To add the name of the Prison(... */,
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
                                                                                                child: LinearProgressIndicator(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<FaccoesRow> ddwFaccaoIntegrouFaccoesRowList = snapshot.data!;

                                                                                            return FlutterFlowDropDown<int>(
                                                                                              controller: _model.ddwFaccaoIntegrouValueController ??= FormFieldController<int>(
                                                                                                _model.ddwFaccaoIntegrouValue ??= _model.ddwFaccaoIntegrou,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFaccaoIntegrouFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                              optionLabels: ddwFaccaoIntegrouFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFaccaoIntegrouValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_faccao_integrou_O');
                                                                                                _model.ddwFaccaoIntegrou = _model.ddwFaccaoIntegrouValue;
                                                                                              },
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
                                                                                                'qmt3xysq' /* Facção que integrou */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'd54e0x0l' /* Facção que integrou */,
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
                                                                                                _model.ddwFaccaoAliadaValue ??= _model.ddwFaccaoAliada,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFaccaoAliadaFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                              optionLabels: ddwFaccaoAliadaFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFaccaoAliadaValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_faccao_aliada_ON_');
                                                                                                _model.ddwFaccaoAliada = _model.ddwFaccaoAliadaValue;
                                                                                              },
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
                                                                                                'hfyi5fcx' /* Facção aliada */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                'gx2d0vrv' /* Father's Situation */,
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
                                                                                                _model.ddwFaccaoInimigaValue ??= _model.ddwFaccaoInimiga,
                                                                                              ),
                                                                                              options: List<int>.from(ddwFaccaoInimigaFaccoesRowList.map((e) => e.faccaoId).toList()),
                                                                                              optionLabels: ddwFaccaoInimigaFaccoesRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) async {
                                                                                                safeSetState(() => _model.ddwFaccaoInimigaValue = val);
                                                                                                logFirebaseEvent('MODAL_MEMBROS_EDIT_ddw_faccao_inimiga_ON');
                                                                                                _model.ddwFaccaoInimiga = _model.ddwFaccaoInimigaValue;
                                                                                              },
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
                                                                                                'jjvut3l7' /* Facção Inimiga */,
                                                                                              ),
                                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                                '852ggzud' /* Facção Inimiga */,
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
                                                                            .formKey7,
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
                                                                                    'x7vvelug' /* Informe os dados sobre os Proc... */,
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
                                                                                        '0x72po3h' /* Procedure */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        '6r3xby98' /* Procedure */,
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
                                                                                        '78x9s5jp' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'iu44z5wh' /* Local Police Station */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'y3jdt795' /* Specialized Police Station */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'w1msn7f9' /* Regional Police Station */,
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
                                                                                      'htdmdnu2' /* Unit */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      '3caoukid' /* Search... */,
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
                                                                                        'f2cnl3p3' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'qui2ehc4' /* IPL. Ordinance */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '8eiaw1ae' /* IPL. Flagrant */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'o070g2zf' /* T.C.O */,
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
                                                                                      'q0jkc2x2' /* Type of procedure */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      '3a283h8u' /* Search... */,
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
                                                                                        'rzn36et5' /* None of the options */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '6ahafjul' /* Drug trafficking */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'sxr2pl91' /* Qualified Robbery */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'jzkky1m3' /* Bodily Injury */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'mja5v7oe' /* Murder */,
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
                                                                                      'ikawajvk' /* Crime */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      '8y4fy6c7' /* Search... */,
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
                                                                                        '72c9mqlr' /* Procedure Date */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                      alignLabelWithHint: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        '67dj9nti' /* Procedure Date */,
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
                                                                                    logFirebaseEvent('MODAL_MEMBROS_EDIT_COMP_CLEAR_BTN_ON_TAP');
                                                                                    _model.membrosProcedimentos = [];
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'mpswxw0h' /* Clear */,
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
                                                                                      logFirebaseEvent('MODAL_MEMBROS_EDIT_TO_ADD_BTN_ON_TAP');
                                                                                      if (_model.txtProcedimentoNoTextController.text != null && _model.txtProcedimentoNoTextController.text != '') {
                                                                                        _model.addToMembrosProcedimentos(DataTypesProcedimentosStruct(
                                                                                          procedimentoNo: _model.txtProcedimentoNoTextController.text,
                                                                                          membroId: widget!.membrosRow?.membroId,
                                                                                          unidade: _model.ddwProcedimentoUnidadeValue,
                                                                                          procedimentoTipo: _model.ddwProcedimentoTipoValue,
                                                                                          crime: _model.ddwProcedimentoCrimeValue,
                                                                                          data: _model.txtProcedimentoDataTextController.text,
                                                                                        ));
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {
                                                                                          _model.txtProcedimentoNoTextController?.clear();
                                                                                          _model.txtProcedimentoDataTextController?.clear();
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
                                                                                                  texto: 'Número de Processo não foi informado !!!',
                                                                                                  titulo: 'Atenção',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '6ffa8gsf' /* To add */,
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
                                                                                      Container(
                                                                                        width: 39.0,
                                                                                        height: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '6i7wb7st' /* Procedure */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
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
                                                                                                'fwfb3gyf' /* Unit */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
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
                                                                                                  'aknu3c5t' /* Type of procedure */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
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
                                                                                                  'ht23g0id' /* Crime */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'lbufi6yu' /* Data */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
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
                                                                                                                            childrenProcedimentosItem.data,
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
                                                                            .formKey5,
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
                                                                                      'dvqmkhu4' /* Provide information about the ... */,
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
                                                                                          'piowig6i' /* Criminal Action Number */,
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
                                                                                          '0xuh2dyx' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'kd06prgx' /* 1st CRIMINAL COURT */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'm3438tat' /* 2nd CRIMINAL COURT */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'w8gxz2fu' /* 3rd CRIMINAL COURT */,
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
                                                                                        'k5t0wx0q' /* Stick */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'vu8mniwv' /* Search ... */,
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
                                                                                          'kcotukto' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'up6as1do' /* Convicted */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ddoj14dz' /* Provisional */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'a6nn3uh2' /* Awaiting sentence */,
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
                                                                                        '3jbtdjv3' /* Legal status */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'akbsd80k' /* Search... */,
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
                                                                                          'nbtjiugr' /* None of the options */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ow1gtdkc' /* Closed */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'v7cl3ghx' /* Semi-open */,
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
                                                                                        '51bdf723' /* Regime */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        '37g3vi5x' /* Search... */,
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
                                                                                          'vesc3jkl' /*  */,
                                                                                        ),
                                                                                      ),
                                                                                      options: [
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '7ty0fr84' /* Nenhuma das opções */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'g2zrioeb' /* Arrested */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ik2ch6lw' /* Loose */,
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
                                                                                        'm90bfwrz' /* Defendant situation */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'o0hua5fj' /* Search... */,
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
                                                                                      'm4dsgud3' /* To clean */,
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
                                                                                        logFirebaseEvent('MODAL_MEMBROS_EDIT_TO_ADD_BTN_ON_TAP');
                                                                                        if (_model.txtProcessoNoAcaoPenalTextController.text != null && _model.txtProcessoNoAcaoPenalTextController.text != '') {
                                                                                          _model.addToMembrosProcessos(DataTypesProcessosStruct(
                                                                                            acaoPenalNo: _model.txtProcessoNoAcaoPenalTextController.text,
                                                                                            vara: _model.ddwProcessoVaraValue,
                                                                                            situacaoJuridica: _model.ddwProcessoSituacaoJuridicaValue,
                                                                                            regime: _model.ddwProcessoRegimeValue,
                                                                                            situacaoReu: _model.ddwProcessoSituacaoReuValue,
                                                                                            membroId: widget!.membrosRow?.membroId,
                                                                                          ));
                                                                                          safeSetState(() {});
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
                                                                                                    texto: 'Número da Ação Penal não foi informada !!!',
                                                                                                    titulo: 'Atenção',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'miy1u177' /* To add */,
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
                                                                                      Container(
                                                                                        width: 39.0,
                                                                                        height: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '9vwnb0wp' /* Criminal action number */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '65fy6t67' /* Stick */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'sn7v17f6' /* Legal status */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '08u2mfci' /* Regime */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'c4s1d43u' /* Defendant situation */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
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
                                                                              '9o36mcor' /* Make a summary of the main cri... */,
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
                                                                            .formKey8,
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
                                                                                    'qdmz3gfu' /* Historic */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                  alignLabelWithHint: true,
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'zuifmq68' /* Historic */,
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
                                                                                    'aw7akt0c' /* Crime Action */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                  alignLabelWithHint: true,
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'ku8neqei' /* Crime Action */,
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
                                                                            .formKey1,
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
                                                                                'foscbacu' /* Enable alert */,
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
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('MODAL_MEMBROS_EDIT_SwitchAlerta_ON_TOGGL');
                                                                                  _model.membroAlerta = true;
                                                                                  _model.updatePage(() {});
                                                                                } else {
                                                                                  logFirebaseEvent('MODAL_MEMBROS_EDIT_SwitchAlerta_ON_TOGGL');
                                                                                  _model.membroAlerta = false;
                                                                                  _model.updatePage(() {});
                                                                                }
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
                                                                              'x92xu8se' /* Alert */,
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
                                                                              'egvrb2p0' /* Alert */,
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
                                                                      .formKey3,
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
                                                                                        '427ogdpj' /* Percentage of data validations */,
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
                                                                                          '4x9b2rd5' /* How were the data and informat... */,
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
                                                                                              'cjxrj5cr' /* Local validation or area of ​​... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'w0qz722h' /* Only through open sources */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'pa7ovo2w' /* Only through restricted source... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'lcxw43hr' /* Through other intelligence age... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'pb0flzo6' /* Through other bodies such as: ... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              '9vttjie6' /* Only through report(s) */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'tl0f7rx2' /* Inside a State Prison Facility */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              '5t1fuok9' /* Dentro de um Estabelecimento P... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'ba44fbwt' /* Apenas através de informante(s... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              '1veed3bi' /* Apenas através de Coolaborador... */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'psbsnjxk' /*  */,
                                                                                            ))
                                                                                          ],
                                                                                          onChanged: (val) async {
                                                                                            safeSetState(() => _model.choiceChipsValidacoesValues = val);
                                                                                            logFirebaseEvent('MODAL_MEMBROS_EDIT_ChoiceChipsValidacoes');
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
                                                                                                '4vgoadq5' /* Observação(ões) */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    lineHeight: 5.0,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'x9agk838' /* Observação(ões) */,
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
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                      '5samjf7n' /* Relations */,
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
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.network(
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
                                                                      'xndu8ue5' /* Groups */,
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
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
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
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            'https://picsum.photos/seed/79/600',
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MODAL_MEMBROS_EDIT_ButtonCancelar_ON_TAP');
                                                      Navigator.pop(context);

                                                      context.pushNamed(
                                                          MainMembrosWidget
                                                              .routeName);
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '168obkc9' /* Cancel */,
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
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
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
                                                                      content: Text(
                                                                          'Deseja salvar os  dados editados ?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancelar'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirmar'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.outputMembrosEdit =
                                                              await MembrosTable()
                                                                  .update(
                                                            data: {
                                                              'nome_completo':
                                                                  _model
                                                                      .txtNomeCompletoTextController
                                                                      .text,
                                                              'fotos_path': _model
                                                                      .membrosFotosEdit
                                                                      .isNotEmpty
                                                                  ? _model
                                                                      .membrosFotosEdit
                                                                  : _model
                                                                      .membrosFotoPathEdit,
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
                                                              'nivel_instrucao':
                                                                  _model
                                                                      .ddwNivelInstrucaoValue,
                                                              'estado_civil': _model
                                                                  .ddwEstadoCivilValue,
                                                              'membro_endereco':
                                                                  _model
                                                                      .membrosEnderecos,
                                                              'estado_id': _model
                                                                  .ddwEstado,
                                                              'historico': _model
                                                                  .txtHistoricoTextController
                                                                  .text,
                                                              'faccao_id': _model
                                                                  .ddwFaccao,
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
                                                              'faccao_senha': _model
                                                                  .txtMembroFaccaoSenhaTextController
                                                                  .text,
                                                              'cargo_id': _model
                                                                  .ddwCargoAtual,
                                                              'funcao_id': _model
                                                                  .ddwFuncaoAtual,
                                                              'cargo_ant_id': _model
                                                                  .ddwCargoAnterior,
                                                              'faccao_inimiga':
                                                                  _model
                                                                      .ddwFaccaoInimiga,
                                                              'faccao_aliada':
                                                                  _model
                                                                      .ddwFaccaoAliada,
                                                              'nacionalidade':
                                                                  _model
                                                                      .rbNacionalidadeValue,
                                                              'funcao_ant_id':
                                                                  _model
                                                                      .ddwFuncaoAnterior,
                                                              'faccao_integrou':
                                                                  _model
                                                                      .ddwFaccaoIntegrou,
                                                              'municipio_id': _model
                                                                  .ddwMunicipios,
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
                                                              'validacoes': _model
                                                                  .choiceChipsValidacoesValues,
                                                              'coordenadas': functions
                                                                  .convertLatLngListToStringList(_model
                                                                      .membrosLatLng
                                                                      .toList()),
                                                              'membroLngLat': functions
                                                                  .convertLatLngToDouble(_model
                                                                      .membrosLatLng
                                                                      .toList()),
                                                              'identidade_orgao':
                                                                  _model
                                                                      .ddwOrgaoExpedidorValue,
                                                              'alerta_observacao':
                                                                  _model
                                                                      .txtMembroAlertaTextController
                                                                      .text,
                                                              'dt_nascimento':
                                                                  _model
                                                                      .txtDataNascimentoTextController
                                                                      .text,
                                                              'validacao_observacao':
                                                                  _model
                                                                      .txtValidacoesObservacoesTextController
                                                                      .text,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'membro_id',
                                                              widget!.membrosRow
                                                                  ?.membroId,
                                                            ),
                                                            returnRows: true,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model.outputMembrosEdit !=
                                                                      null &&
                                                                  (_model.outputMembrosEdit)!
                                                                      .isNotEmpty) ==
                                                              true) {
                                                            await Future.wait([
                                                              Future(() async {
                                                                if (_model
                                                                        .membrosProcedimentos
                                                                        .length >=
                                                                    1) {
                                                                  await ProcedimentosTable()
                                                                      .delete(
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eqOrNull(
                                                                      'membro_id',
                                                                      widget!
                                                                          .membrosRow
                                                                          ?.membroId,
                                                                    ),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.membrosProcedimentosCount =
                                                                      -1;
                                                                  while (_model
                                                                          .membrosProcedimentosCount! <=
                                                                      _model
                                                                          .membrosProcedimentos
                                                                          .length) {
                                                                    _model.membrosProcedimentosCount =
                                                                        _model.membrosProcedimentosCount! +
                                                                            1;
                                                                    _model.apiResultProcedimentosAdd =
                                                                        await ProcedimentoAddCall
                                                                            .call(
                                                                      membroId: widget!
                                                                          .membrosRow
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
                                                                      data: _model
                                                                          .membrosProcedimentos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcedimentosCount!)
                                                                          ?.data,
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
                                                                  await ProcessosTable()
                                                                      .delete(
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eqOrNull(
                                                                      'membro_id',
                                                                      widget!
                                                                          .membrosRow
                                                                          ?.membroId,
                                                                    ),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.membrosProcessosCount =
                                                                      -1;
                                                                  while (_model
                                                                          .membrosProcessosCount! <=
                                                                      _model
                                                                          .membrosProcessos
                                                                          .length) {
                                                                    _model.membrosProcessosCount =
                                                                        _model.membrosProcessosCount! +
                                                                            1;
                                                                    _model.apiResultProcessosEdit =
                                                                        await ProcessosAddCall
                                                                            .call(
                                                                      membroId: widget!
                                                                          .membrosRow
                                                                          ?.membroId,
                                                                      acaoPenalNo: _model
                                                                          .membrosProcessos
                                                                          .elementAtOrNull(
                                                                              _model.membrosProcessosCount!)
                                                                          ?.acaoPenalNo,
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
                                                            Navigator.pop(
                                                                context);
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamed(
                                                              MainMembrosWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'membroPesquisa':
                                                                    serializeParam(
                                                                  true.toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        100.0,
                                                                    width:
                                                                        300.0,
                                                                    child:
                                                                        Toast03Widget(
                                                                      texto: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uqhnzed2' /* Some data is wrong!!! */,
                                                                      ),
                                                                      titulo:
                                                                          'Atenção',
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }

                                                          FFAppState()
                                                                  .rebuildMembros =
                                                              true;
                                                          FFAppState()
                                                              .update(() {});
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
                                                        'azk0tcxo' /* Save Member */,
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
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
          ),
        ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!),
      ],
    );
  }
}
