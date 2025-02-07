import '/backend/supabase/supabase.dart';
import '/components/dropdowns/dropdown_member_edit/dropdown_member_edit_widget.dart';
import '/components/modal/modal_membros_add/modal_membros_add_widget.dart';
import '/components/modal/modal_membros_edit/modal_membros_edit_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/adicionar_membros.dart';
import 'dart:math';
import 'dart:ui';
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
import 'package:text_search/text_search.dart';

class MainMembrosModel extends FlutterFlowModel<MainMembrosWidget> {
  ///  Local state fields for this page.

  List<MembrosViewRow> queryMembros = [];
  void addToQueryMembros(MembrosViewRow item) => queryMembros.add(item);
  void removeFromQueryMembros(MembrosViewRow item) => queryMembros.remove(item);
  void removeAtIndexFromQueryMembros(int index) => queryMembros.removeAt(index);
  void insertAtIndexInQueryMembros(int index, MembrosViewRow item) =>
      queryMembros.insert(index, item);
  void updateQueryMembrosAtIndex(
          int index, Function(MembrosViewRow) updateFn) =>
      queryMembros[index] = updateFn(queryMembros[index]);

  List<MembrosViewRow> queryMembrosSeach = [];
  void addToQueryMembrosSeach(MembrosViewRow item) =>
      queryMembrosSeach.add(item);
  void removeFromQueryMembrosSeach(MembrosViewRow item) =>
      queryMembrosSeach.remove(item);
  void removeAtIndexFromQueryMembrosSeach(int index) =>
      queryMembrosSeach.removeAt(index);
  void insertAtIndexInQueryMembrosSeach(int index, MembrosViewRow item) =>
      queryMembrosSeach.insert(index, item);
  void updateQueryMembrosSeachAtIndex(
          int index, Function(MembrosViewRow) updateFn) =>
      queryMembrosSeach[index] = updateFn(queryMembrosSeach[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? adicionarMembrosController;
  // Stores action output result for [Backend Call - Query Rows] action in main_membros widget.
  List<MembrosViewRow>? allMembros;
  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TextFieldPesquisa widget.
  FocusNode? textFieldPesquisaFocusNode;
  TextEditingController? textFieldPesquisaTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisaTextControllerValidator;
  List<String> simpleSearchResults = [];
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
    textFieldPesquisaFocusNode?.dispose();
    textFieldPesquisaTextController?.dispose();

    tabBarController?.dispose();
  }
}
