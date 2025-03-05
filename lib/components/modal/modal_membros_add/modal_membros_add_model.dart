import '';
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
import '/index.dart';
import 'modal_membros_add_widget.dart' show ModalMembrosAddWidget;
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

class ModalMembrosAddModel extends FlutterFlowModel<ModalMembrosAddWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> membrosFotosTemp = [];
  void addToMembrosFotosTemp(FFUploadedFile item) => membrosFotosTemp.add(item);
  void removeFromMembrosFotosTemp(FFUploadedFile item) =>
      membrosFotosTemp.remove(item);
  void removeAtIndexFromMembrosFotosTemp(int index) =>
      membrosFotosTemp.removeAt(index);
  void insertAtIndexInMembrosFotosTemp(int index, FFUploadedFile item) =>
      membrosFotosTemp.insert(index, item);
  void updateMembrosFotosTempAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      membrosFotosTemp[index] = updateFn(membrosFotosTemp[index]);

  List<String> membrosAlcunhas = [];
  void addToMembrosAlcunhas(String item) => membrosAlcunhas.add(item);
  void removeFromMembrosAlcunhas(String item) => membrosAlcunhas.remove(item);
  void removeAtIndexFromMembrosAlcunhas(int index) =>
      membrosAlcunhas.removeAt(index);
  void insertAtIndexInMembrosAlcunhas(int index, String item) =>
      membrosAlcunhas.insert(index, item);
  void updateMembrosAlcunhasAtIndex(int index, Function(String) updateFn) =>
      membrosAlcunhas[index] = updateFn(membrosAlcunhas[index]);

  List<String> membrosEnderecos = [];
  void addToMembrosEnderecos(String item) => membrosEnderecos.add(item);
  void removeFromMembrosEnderecos(String item) => membrosEnderecos.remove(item);
  void removeAtIndexFromMembrosEnderecos(int index) =>
      membrosEnderecos.removeAt(index);
  void insertAtIndexInMembrosEnderecos(int index, String item) =>
      membrosEnderecos.insert(index, item);
  void updateMembrosEnderecosAtIndex(int index, Function(String) updateFn) =>
      membrosEnderecos[index] = updateFn(membrosEnderecos[index]);

  bool membroAlerta = false;

  String? membrosLimpar;

  List<String> membrosGrupos = [];
  void addToMembrosGrupos(String item) => membrosGrupos.add(item);
  void removeFromMembrosGrupos(String item) => membrosGrupos.remove(item);
  void removeAtIndexFromMembrosGrupos(int index) =>
      membrosGrupos.removeAt(index);
  void insertAtIndexInMembrosGrupos(int index, String item) =>
      membrosGrupos.insert(index, item);
  void updateMembrosGruposAtIndex(int index, Function(String) updateFn) =>
      membrosGrupos[index] = updateFn(membrosGrupos[index]);

  List<String> membrosRelacoes = [];
  void addToMembrosRelacoes(String item) => membrosRelacoes.add(item);
  void removeFromMembrosRelacoes(String item) => membrosRelacoes.remove(item);
  void removeAtIndexFromMembrosRelacoes(int index) =>
      membrosRelacoes.removeAt(index);
  void insertAtIndexInMembrosRelacoes(int index, String item) =>
      membrosRelacoes.insert(index, item);
  void updateMembrosRelacoesAtIndex(int index, Function(String) updateFn) =>
      membrosRelacoes[index] = updateFn(membrosRelacoes[index]);

  List<String> membrosFaccaoTresLocais = [];
  void addToMembrosFaccaoTresLocais(String item) =>
      membrosFaccaoTresLocais.add(item);
  void removeFromMembrosFaccaoTresLocais(String item) =>
      membrosFaccaoTresLocais.remove(item);
  void removeAtIndexFromMembrosFaccaoTresLocais(int index) =>
      membrosFaccaoTresLocais.removeAt(index);
  void insertAtIndexInMembrosFaccaoTresLocais(int index, String item) =>
      membrosFaccaoTresLocais.insert(index, item);
  void updateMembrosFaccaoTresLocaisAtIndex(
          int index, Function(String) updateFn) =>
      membrosFaccaoTresLocais[index] = updateFn(membrosFaccaoTresLocais[index]);

  List<DataTypesProcedimentosStruct> membrosProcedimentos = [];
  void addToMembrosProcedimentos(DataTypesProcedimentosStruct item) =>
      membrosProcedimentos.add(item);
  void removeFromMembrosProcedimentos(DataTypesProcedimentosStruct item) =>
      membrosProcedimentos.remove(item);
  void removeAtIndexFromMembrosProcedimentos(int index) =>
      membrosProcedimentos.removeAt(index);
  void insertAtIndexInMembrosProcedimentos(
          int index, DataTypesProcedimentosStruct item) =>
      membrosProcedimentos.insert(index, item);
  void updateMembrosProcedimentosAtIndex(
          int index, Function(DataTypesProcedimentosStruct) updateFn) =>
      membrosProcedimentos[index] = updateFn(membrosProcedimentos[index]);

  List<DataTypesProcessosStruct> membrosProcessos = [];
  void addToMembrosProcessos(DataTypesProcessosStruct item) =>
      membrosProcessos.add(item);
  void removeFromMembrosProcessos(DataTypesProcessosStruct item) =>
      membrosProcessos.remove(item);
  void removeAtIndexFromMembrosProcessos(int index) =>
      membrosProcessos.removeAt(index);
  void insertAtIndexInMembrosProcessos(
          int index, DataTypesProcessosStruct item) =>
      membrosProcessos.insert(index, item);
  void updateMembrosProcessosAtIndex(
          int index, Function(DataTypesProcessosStruct) updateFn) =>
      membrosProcessos[index] = updateFn(membrosProcessos[index]);

  double membrosPercetualValidacao = 0.0;

  int? membrosProcedimentosCount = -1;

  int? membrosProcessosCount = -1;

  DateTime? dataProcedimento;

  List<LatLng> membrosLatLng = [];
  void addToMembrosLatLng(LatLng item) => membrosLatLng.add(item);
  void removeFromMembrosLatLng(LatLng item) => membrosLatLng.remove(item);
  void removeAtIndexFromMembrosLatLng(int index) =>
      membrosLatLng.removeAt(index);
  void insertAtIndexInMembrosLatLng(int index, LatLng item) =>
      membrosLatLng.insert(index, item);
  void updateMembrosLatLngAtIndex(int index, Function(LatLng) updateFn) =>
      membrosLatLng[index] = updateFn(membrosLatLng[index]);

  int? selectedCountValidados;

  List<String> membrosFotos = [];
  void addToMembrosFotos(String item) => membrosFotos.add(item);
  void removeFromMembrosFotos(String item) => membrosFotos.remove(item);
  void removeAtIndexFromMembrosFotos(int index) => membrosFotos.removeAt(index);
  void insertAtIndexInMembrosFotos(int index, String item) =>
      membrosFotos.insert(index, item);
  void updateMembrosFotosAtIndex(int index, Function(String) updateFn) =>
      membrosFotos[index] = updateFn(membrosFotos[index]);

  List<String> membrosFotosSemUrl = [];
  void addToMembrosFotosSemUrl(String item) => membrosFotosSemUrl.add(item);
  void removeFromMembrosFotosSemUrl(String item) =>
      membrosFotosSemUrl.remove(item);
  void removeAtIndexFromMembrosFotosSemUrl(int index) =>
      membrosFotosSemUrl.removeAt(index);
  void insertAtIndexInMembrosFotosSemUrl(int index, String item) =>
      membrosFotosSemUrl.insert(index, item);
  void updateMembrosFotosSemUrlAtIndex(int index, Function(String) updateFn) =>
      membrosFotosSemUrl[index] = updateFn(membrosFotosSemUrl[index]);

  String? dataNascimento;

  int? membroId;

  int procedimentoTotal = 0;

  int processoTotal = 0;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  // State field(s) for txt_nome_completo widget.
  FocusNode? txtNomeCompletoFocusNode;
  TextEditingController? txtNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      txtNomeCompletoTextControllerValidator;
  String? _txtNomeCompletoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'araknvd7' /* Nome completo is required */,
      );
    }

    return null;
  }

  // State field(s) for txt_alcunha_add widget.
  FocusNode? txtAlcunhaAddFocusNode;
  TextEditingController? txtAlcunhaAddTextController;
  String? Function(BuildContext, String?)? txtAlcunhaAddTextControllerValidator;
  // Stores action output result for [Custom Action - checkValueInList] action in IconButton widget.
  bool? outputAlcunhaExists;
  // State field(s) for txt_membro_naturalidade widget.
  FocusNode? txtMembroNaturalidadeFocusNode;
  TextEditingController? txtMembroNaturalidadeTextController;
  String? Function(BuildContext, String?)?
      txtMembroNaturalidadeTextControllerValidator;
  // State field(s) for ddw_estado_civil widget.
  String? ddwEstadoCivilValue;
  FormFieldController<String>? ddwEstadoCivilValueController;
  // State field(s) for txt_data_nascimento widget.
  FocusNode? txtDataNascimentoFocusNode;
  TextEditingController? txtDataNascimentoTextController;
  final txtDataNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      txtDataNascimentoTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for txt_no_identidade widget.
  FocusNode? txtNoIdentidadeFocusNode;
  TextEditingController? txtNoIdentidadeTextController;
  String? Function(BuildContext, String?)?
      txtNoIdentidadeTextControllerValidator;
  // State field(s) for ddw_orgao_expedidor widget.
  int? ddwOrgaoExpedidorValue;
  FormFieldController<int>? ddwOrgaoExpedidorValueController;
  // State field(s) for txt_no_cpf widget.
  FocusNode? txtNoCpfFocusNode;
  TextEditingController? txtNoCpfTextController;
  final txtNoCpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? txtNoCpfTextControllerValidator;
  // State field(s) for txt_no_infopen widget.
  FocusNode? txtNoInfopenFocusNode;
  TextEditingController? txtNoInfopenTextController;
  String? Function(BuildContext, String?)? txtNoInfopenTextControllerValidator;
  // State field(s) for txt_filiacao_mae widget.
  FocusNode? txtFiliacaoMaeFocusNode;
  TextEditingController? txtFiliacaoMaeTextController;
  String? Function(BuildContext, String?)?
      txtFiliacaoMaeTextControllerValidator;
  // State field(s) for ddw_situacao_mae widget.
  String? ddwSituacaoMaeValue;
  FormFieldController<String>? ddwSituacaoMaeValueController;
  // State field(s) for txt_filiacao_pai widget.
  FocusNode? txtFiliacaoPaiFocusNode;
  TextEditingController? txtFiliacaoPaiTextController;
  String? Function(BuildContext, String?)?
      txtFiliacaoPaiTextControllerValidator;
  // State field(s) for ddw_situacao_pai widget.
  String? ddwSituacaoPaiValue;
  FormFieldController<String>? ddwSituacaoPaiValueController;
  // State field(s) for ddw_nivel_instrucao widget.
  String? ddwNivelInstrucaoValue;
  FormFieldController<String>? ddwNivelInstrucaoValueController;
  // State field(s) for rbNacionalidade widget.
  FormFieldController<String>? rbNacionalidadeValueController;
  // State field(s) for ddw_estado widget.
  int? ddwEstadoValue;
  FormFieldController<int>? ddwEstadoValueController;
  // State field(s) for ddw_municipio widget.
  int? ddwMunicipioValue;
  FormFieldController<int>? ddwMunicipioValueController;
  // State field(s) for PlacePickerEndereco widget.
  FFPlace placePickerEnderecoValue = FFPlace();
  // State field(s) for txt_membros_enderecos_add widget.
  FocusNode? txtMembrosEnderecosAddFocusNode;
  TextEditingController? txtMembrosEnderecosAddTextController;
  String? Function(BuildContext, String?)?
      txtMembrosEnderecosAddTextControllerValidator;
  // Stores action output result for [Custom Action - checkValueInList] action in IconButton widget.
  bool? outputEnderecoExists;
  // State field(s) for GoogleMapMembro widget.
  LatLng? googleMapMembrosCenter;
  final googleMapMembrosController = Completer<GoogleMapController>();
  // State field(s) for ddw_faccao widget.
  int? ddwFaccaoValue;
  FormFieldController<int>? ddwFaccaoValueController;
  // State field(s) for txt_faccao_bastismo widget.
  final txtFaccaoBastismoKey = GlobalKey();
  FocusNode? txtFaccaoBastismoFocusNode;
  TextEditingController? txtFaccaoBastismoTextController;
  String? txtFaccaoBastismoSelectedOption;
  String? Function(BuildContext, String?)?
      txtFaccaoBastismoTextControllerValidator;
  // State field(s) for txt_facao_local_bastismo widget.
  FocusNode? txtFacaoLocalBastismoFocusNode;
  TextEditingController? txtFacaoLocalBastismoTextController;
  String? Function(BuildContext, String?)?
      txtFacaoLocalBastismoTextControllerValidator;
  // State field(s) for txt_membros_faccao_padrinho widget.
  FocusNode? txtMembrosFaccaoPadrinhoFocusNode;
  TextEditingController? txtMembrosFaccaoPadrinhoTextController;
  String? Function(BuildContext, String?)?
      txtMembrosFaccaoPadrinhoTextControllerValidator;
  // State field(s) for txt_membro_faccao_senha widget.
  FocusNode? txtMembroFaccaoSenhaFocusNode;
  TextEditingController? txtMembroFaccaoSenhaTextController;
  String? Function(BuildContext, String?)?
      txtMembroFaccaoSenhaTextControllerValidator;
  // State field(s) for ddw_cargo_atual widget.
  int? ddwCargoAtualValue;
  FormFieldController<int>? ddwCargoAtualValueController;
  // State field(s) for ddw_cargo_anterior widget.
  int? ddwCargoAnteriorValue;
  FormFieldController<int>? ddwCargoAnteriorValueController;
  // State field(s) for ddw_funcao_atual widget.
  int? ddwFuncaoAtualValue;
  FormFieldController<int>? ddwFuncaoAtualValueController;
  // State field(s) for ddw_funcao_anterior widget.
  int? ddwFuncaoAnteriorValue;
  FormFieldController<int>? ddwFuncaoAnteriorValueController;
  // State field(s) for txt_faccao_tres_locais_add widget.
  FocusNode? txtFaccaoTresLocaisAddFocusNode;
  TextEditingController? txtFaccaoTresLocaisAddTextController;
  String? Function(BuildContext, String?)?
      txtFaccaoTresLocaisAddTextControllerValidator;
  // State field(s) for ddw_faccao_integrou widget.
  int? ddwFaccaoIntegrouValue;
  FormFieldController<int>? ddwFaccaoIntegrouValueController;
  // State field(s) for ddw_faccao_aliada widget.
  int? ddwFaccaoAliadaValue;
  FormFieldController<int>? ddwFaccaoAliadaValueController;
  // State field(s) for ddw_faccao_inimiga widget.
  int? ddwFaccaoInimigaValue;
  FormFieldController<int>? ddwFaccaoInimigaValueController;
  // State field(s) for txt_procedimento_no widget.
  FocusNode? txtProcedimentoNoFocusNode;
  TextEditingController? txtProcedimentoNoTextController;
  String? Function(BuildContext, String?)?
      txtProcedimentoNoTextControllerValidator;
  // State field(s) for ddw_procedimento_unidade widget.
  String? ddwProcedimentoUnidadeValue;
  FormFieldController<String>? ddwProcedimentoUnidadeValueController;
  // State field(s) for ddw_procedimento_tipo widget.
  String? ddwProcedimentoTipoValue;
  FormFieldController<String>? ddwProcedimentoTipoValueController;
  // State field(s) for ddw_procedimento_crime widget.
  String? ddwProcedimentoCrimeValue;
  FormFieldController<String>? ddwProcedimentoCrimeValueController;
  // State field(s) for txt_procedimento_data widget.
  FocusNode? txtProcedimentoDataFocusNode;
  TextEditingController? txtProcedimentoDataTextController;
  final txtProcedimentoDataMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      txtProcedimentoDataTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for txt_processo_no_acao_penal widget.
  FocusNode? txtProcessoNoAcaoPenalFocusNode;
  TextEditingController? txtProcessoNoAcaoPenalTextController;
  String? Function(BuildContext, String?)?
      txtProcessoNoAcaoPenalTextControllerValidator;
  // State field(s) for ddw_processo_vara widget.
  String? ddwProcessoVaraValue;
  FormFieldController<String>? ddwProcessoVaraValueController;
  // State field(s) for ddw_processo_situacao_juridica widget.
  String? ddwProcessoSituacaoJuridicaValue;
  FormFieldController<String>? ddwProcessoSituacaoJuridicaValueController;
  // State field(s) for ddw_processo_regime widget.
  String? ddwProcessoRegimeValue;
  FormFieldController<String>? ddwProcessoRegimeValueController;
  // State field(s) for ddw_processo_situacao_reu widget.
  String? ddwProcessoSituacaoReuValue;
  FormFieldController<String>? ddwProcessoSituacaoReuValueController;
  // State field(s) for txt_historico widget.
  FocusNode? txtHistoricoFocusNode;
  TextEditingController? txtHistoricoTextController;
  String? Function(BuildContext, String?)? txtHistoricoTextControllerValidator;
  // State field(s) for txt_membro_atuacao widget.
  FocusNode? txtMembroAtuacaoFocusNode;
  TextEditingController? txtMembroAtuacaoTextController;
  String? Function(BuildContext, String?)?
      txtMembroAtuacaoTextControllerValidator;
  // State field(s) for SwitchAlerta widget.
  bool? switchAlertaValue;
  // State field(s) for txt_membro_alerta widget.
  FocusNode? txtMembroAlertaFocusNode;
  TextEditingController? txtMembroAlertaTextController;
  String? Function(BuildContext, String?)?
      txtMembroAlertaTextControllerValidator;
  // State field(s) for ChoiceChipsValidacoes widget.
  FormFieldController<List<String>>? choiceChipsValidacoesValueController;
  List<String>? get choiceChipsValidacoesValues =>
      choiceChipsValidacoesValueController?.value;
  set choiceChipsValidacoesValues(List<String>? val) =>
      choiceChipsValidacoesValueController?.value = val;
  // State field(s) for txt_validacoes_observacoes widget.
  FocusNode? txtValidacoesObservacoesFocusNode;
  TextEditingController? txtValidacoesObservacoesTextController;
  String? Function(BuildContext, String?)?
      txtValidacoesObservacoesTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MembrosRow? outputMembrosAdd;
  // Stores action output result for [Backend Call - API (ProcedimentoAdd )] action in Button widget.
  ApiCallResponse? apiResultProcedimentosAdd;
  // Stores action output result for [Backend Call - API (ProcessosAdd)] action in Button widget.
  ApiCallResponse? apiResultProcessosAdd;

  @override
  void initState(BuildContext context) {
    txtNomeCompletoTextControllerValidator =
        _txtNomeCompletoTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtNomeCompletoFocusNode?.dispose();
    txtNomeCompletoTextController?.dispose();

    txtAlcunhaAddFocusNode?.dispose();
    txtAlcunhaAddTextController?.dispose();

    txtMembroNaturalidadeFocusNode?.dispose();
    txtMembroNaturalidadeTextController?.dispose();

    txtDataNascimentoFocusNode?.dispose();
    txtDataNascimentoTextController?.dispose();

    txtNoIdentidadeFocusNode?.dispose();
    txtNoIdentidadeTextController?.dispose();

    txtNoCpfFocusNode?.dispose();
    txtNoCpfTextController?.dispose();

    txtNoInfopenFocusNode?.dispose();
    txtNoInfopenTextController?.dispose();

    txtFiliacaoMaeFocusNode?.dispose();
    txtFiliacaoMaeTextController?.dispose();

    txtFiliacaoPaiFocusNode?.dispose();
    txtFiliacaoPaiTextController?.dispose();

    txtMembrosEnderecosAddFocusNode?.dispose();
    txtMembrosEnderecosAddTextController?.dispose();

    txtFaccaoBastismoFocusNode?.dispose();

    txtFacaoLocalBastismoFocusNode?.dispose();
    txtFacaoLocalBastismoTextController?.dispose();

    txtMembrosFaccaoPadrinhoFocusNode?.dispose();
    txtMembrosFaccaoPadrinhoTextController?.dispose();

    txtMembroFaccaoSenhaFocusNode?.dispose();
    txtMembroFaccaoSenhaTextController?.dispose();

    txtFaccaoTresLocaisAddFocusNode?.dispose();
    txtFaccaoTresLocaisAddTextController?.dispose();

    txtProcedimentoNoFocusNode?.dispose();
    txtProcedimentoNoTextController?.dispose();

    txtProcedimentoDataFocusNode?.dispose();
    txtProcedimentoDataTextController?.dispose();

    txtProcessoNoAcaoPenalFocusNode?.dispose();
    txtProcessoNoAcaoPenalTextController?.dispose();

    txtHistoricoFocusNode?.dispose();
    txtHistoricoTextController?.dispose();

    txtMembroAtuacaoFocusNode?.dispose();
    txtMembroAtuacaoTextController?.dispose();

    txtMembroAlertaFocusNode?.dispose();
    txtMembroAlertaTextController?.dispose();

    txtValidacoesObservacoesFocusNode?.dispose();
    txtValidacoesObservacoesTextController?.dispose();
  }

  /// Action blocks.
  Future percentualValidado(BuildContext context) async {
    await percentualValidado(context);
  }

  /// Additional helper methods.
  String? get rbNacionalidadeValue => rbNacionalidadeValueController?.value;
}
