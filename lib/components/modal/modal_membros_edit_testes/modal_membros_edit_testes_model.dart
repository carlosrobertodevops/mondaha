import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'modal_membros_edit_testes_widget.dart'
    show ModalMembrosEditTestesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalMembrosEditTestesModel
    extends FlutterFlowModel<ModalMembrosEditTestesWidget> {
  ///  Local state fields for this component.

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

  MembrosViewRow? membrosRowLocal;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode17;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode18;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode19;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode20;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode21;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode22;
  TextEditingController? textController22;
  String? Function(BuildContext, String?)? textController22Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode23;
  TextEditingController? textController23;
  String? Function(BuildContext, String?)? textController23Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode24;
  TextEditingController? textController24;
  String? Function(BuildContext, String?)? textController24Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode25;
  TextEditingController? textController25;
  String? Function(BuildContext, String?)? textController25Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode26;
  TextEditingController? textController26;
  String? Function(BuildContext, String?)? textController26Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode27;
  TextEditingController? textController27;
  String? Function(BuildContext, String?)? textController27Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode28;
  TextEditingController? textController28;
  String? Function(BuildContext, String?)? textController28Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode29;
  TextEditingController? textController29;
  String? Function(BuildContext, String?)? textController29Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode30;
  TextEditingController? textController30;
  String? Function(BuildContext, String?)? textController30Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode31;
  TextEditingController? textController31;
  String? Function(BuildContext, String?)? textController31Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode32;
  TextEditingController? textController32;
  String? Function(BuildContext, String?)? textController32Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode33;
  TextEditingController? textController33;
  String? Function(BuildContext, String?)? textController33Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode34;
  TextEditingController? textController34;
  String? Function(BuildContext, String?)? textController34Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode35;
  TextEditingController? textController35;
  String? Function(BuildContext, String?)? textController35Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode36;
  TextEditingController? textController36;
  String? Function(BuildContext, String?)? textController36Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode37;
  TextEditingController? textController37;
  String? Function(BuildContext, String?)? textController37Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode38;
  TextEditingController? textController38;
  String? Function(BuildContext, String?)? textController38Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode39;
  TextEditingController? textController39;
  String? Function(BuildContext, String?)? textController39Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode40;
  TextEditingController? textController40;
  String? Function(BuildContext, String?)? textController40Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    textFieldFocusNode11?.dispose();
    textController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController12?.dispose();

    textFieldFocusNode13?.dispose();
    textController13?.dispose();

    textFieldFocusNode14?.dispose();
    textController14?.dispose();

    textFieldFocusNode15?.dispose();
    textController15?.dispose();

    textFieldFocusNode16?.dispose();
    textController16?.dispose();

    textFieldFocusNode17?.dispose();
    textController17?.dispose();

    textFieldFocusNode18?.dispose();
    textController18?.dispose();

    textFieldFocusNode19?.dispose();
    textController19?.dispose();

    textFieldFocusNode20?.dispose();
    textController20?.dispose();

    textFieldFocusNode21?.dispose();
    textController21?.dispose();

    textFieldFocusNode22?.dispose();
    textController22?.dispose();

    textFieldFocusNode23?.dispose();
    textController23?.dispose();

    textFieldFocusNode24?.dispose();
    textController24?.dispose();

    textFieldFocusNode25?.dispose();
    textController25?.dispose();

    textFieldFocusNode26?.dispose();
    textController26?.dispose();

    textFieldFocusNode27?.dispose();
    textController27?.dispose();

    textFieldFocusNode28?.dispose();
    textController28?.dispose();

    textFieldFocusNode29?.dispose();
    textController29?.dispose();

    textFieldFocusNode30?.dispose();
    textController30?.dispose();

    textFieldFocusNode31?.dispose();
    textController31?.dispose();

    textFieldFocusNode32?.dispose();
    textController32?.dispose();

    textFieldFocusNode33?.dispose();
    textController33?.dispose();

    textFieldFocusNode34?.dispose();
    textController34?.dispose();

    textFieldFocusNode35?.dispose();
    textController35?.dispose();

    textFieldFocusNode36?.dispose();
    textController36?.dispose();

    textFieldFocusNode37?.dispose();
    textController37?.dispose();

    textFieldFocusNode38?.dispose();
    textController38?.dispose();

    textFieldFocusNode39?.dispose();
    textController39?.dispose();

    textFieldFocusNode40?.dispose();
    textController40?.dispose();
  }

  /// Action blocks.
  Future percentualValidado(BuildContext context) async {}
}
