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
import 'modal_membros_edit_widget.dart' show ModalMembrosEditWidget;
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

class ModalMembrosEditModel extends FlutterFlowModel<ModalMembrosEditWidget> {
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

  bool comoForamValidados = true;

  List<String> membrosFotoEdit = [];
  void addToMembrosFotoEdit(String item) => membrosFotoEdit.add(item);
  void removeFromMembrosFotoEdit(String item) => membrosFotoEdit.remove(item);
  void removeAtIndexFromMembrosFotoEdit(int index) =>
      membrosFotoEdit.removeAt(index);
  void insertAtIndexInMembrosFotoEdit(int index, String item) =>
      membrosFotoEdit.insert(index, item);
  void updateMembrosFotoEditAtIndex(int index, Function(String) updateFn) =>
      membrosFotoEdit[index] = updateFn(membrosFotoEdit[index]);

  bool uploadImageTemp = false;

  int? selectedCountValidados;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  // State field(s) for txt_nome_completo widget.
  FocusNode? txtNomeCompletoFocusNode;
  TextEditingController? txtNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      txtNomeCompletoTextControllerValidator;
  String? _txtNomeCompletoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'etcver8f' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for txt_alcunha_add widget.
  FocusNode? txtAlcunhaAddFocusNode;
  TextEditingController? txtAlcunhaAddTextController;
  String? Function(BuildContext, String?)? txtAlcunhaAddTextControllerValidator;
  // State field(s) for txt_membro_naturalidade widget.
  FocusNode? txtMembroNaturalidadeFocusNode;
  TextEditingController? txtMembroNaturalidadeTextController;
  String? Function(BuildContext, String?)?
      txtMembroNaturalidadeTextControllerValidator;
  // State field(s) for ddw_estado_civil widget.
  String? ddwEstadoCivilValue;
  FormFieldController<String>? ddwEstadoCivilValueController;
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
  // State field(s) for GoogleMapMembro widget.
  LatLng? googleMapMembrosCenter;
  final googleMapMembrosController = Completer<GoogleMapController>();
  // State field(s) for ddw_membro_faccao widget.
  int? ddwMembroFaccaoValue;
  FormFieldController<int>? ddwMembroFaccaoValueController;
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
  // State field(s) for ddw_membro_faccao_cargo_atual widget.
  int? ddwMembroFaccaoCargoAtualValue;
  FormFieldController<int>? ddwMembroFaccaoCargoAtualValueController;
  // State field(s) for ddw_membro_faccao_cargo_anterior widget.
  int? ddwMembroFaccaoCargoAnteriorValue;
  FormFieldController<int>? ddwMembroFaccaoCargoAnteriorValueController;
  // State field(s) for ddw_faccao_funcao_atual widget.
  int? ddwFaccaoFuncaoAtualValue;
  FormFieldController<int>? ddwFaccaoFuncaoAtualValueController;
  // State field(s) for ddw_faccao_funcao_anterior widget.
  int? ddwFaccaoFuncaoAnteriorValue;
  FormFieldController<int>? ddwFaccaoFuncaoAnteriorValueController;
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
  DateTime? datePicked;
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
  Future percentualValidado(BuildContext context) async {}

  /// Additional helper methods.
  String? get rbNacionalidadeValue => rbNacionalidadeValueController?.value;
}
