import '/backend/supabase/supabase.dart';
import '/components/modal/modal_membros_add/modal_membros_add_widget.dart';
import '/components/modal/modal_membros_edit/modal_membros_edit_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/dropdowns/dropdown_member_edit/dropdown_member_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/adicionar_membros.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_membros_widget.dart' show MainMembrosWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainMembrosModel extends FlutterFlowModel<MainMembrosWidget> {
  ///  Local state fields for this page.

  List<MembrosViewPdfRow> pdfMembros = [];
  void addToPdfMembros(MembrosViewPdfRow item) => pdfMembros.add(item);
  void removeFromPdfMembros(MembrosViewPdfRow item) => pdfMembros.remove(item);
  void removeAtIndexFromPdfMembros(int index) => pdfMembros.removeAt(index);
  void insertAtIndexInPdfMembros(int index, MembrosViewPdfRow item) =>
      pdfMembros.insert(index, item);
  void updatePdfMembrosAtIndex(
          int index, Function(MembrosViewPdfRow) updateFn) =>
      pdfMembros[index] = updateFn(pdfMembros[index]);

  List<MembrosViewPdfRow> pdfMembrosSearch = [];
  void addToPdfMembrosSearch(MembrosViewPdfRow item) =>
      pdfMembrosSearch.add(item);
  void removeFromPdfMembrosSearch(MembrosViewPdfRow item) =>
      pdfMembrosSearch.remove(item);
  void removeAtIndexFromPdfMembrosSearch(int index) =>
      pdfMembrosSearch.removeAt(index);
  void insertAtIndexInPdfMembrosSearch(int index, MembrosViewPdfRow item) =>
      pdfMembrosSearch.insert(index, item);
  void updatePdfMembrosSearchAtIndex(
          int index, Function(MembrosViewPdfRow) updateFn) =>
      pdfMembrosSearch[index] = updateFn(pdfMembrosSearch[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? adicionarMembrosController;
  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TextFieldPesquisarMembros widget.
  FocusNode? textFieldPesquisarMembrosFocusNode;
  TextEditingController? textFieldPesquisarMembrosTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisarMembrosTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    adicionarMembrosController?.finish();
    webNavModel.dispose();
    textFieldPesquisarMembrosFocusNode?.dispose();
    textFieldPesquisarMembrosTextController?.dispose();

    tabBarController?.dispose();
  }
}
