import '';
import '/backend/supabase/supabase.dart';
import '/components/modal/modal_faccao_add/modal_faccao_add_widget.dart';
import '/components/modal/modal_faccao_edit/modal_faccao_edit_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/dropdowns/dropdown_faccao_edit/dropdown_faccao_edit_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_faccoes_widget.dart' show MainFaccoesWidget;
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainFaccoesModel extends FlutterFlowModel<MainFaccoesWidget> {
  ///  Local state fields for this page.

  int? countFaccoes = 0;

  ///  State fields for stateful widgets in this page.

  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TextFieldPesquisarFaccoes widget.
  FocusNode? textFieldPesquisarFaccoesFocusNode;
  TextEditingController? textFieldPesquisarFaccoesTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisarFaccoesTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextFieldPesquisarFaccoes widget.
  List<FaccoesViewConcatSearchRow>? outputQueryFaccaoCount2;
  // Stores action output result for [Backend Call - Query Rows] action in TextFieldPesquisarFaccoes widget.
  List<FaccoesViewConcatSearchRow>? outputQueryFaccaoCount1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<FaccoesViewConcatSearchRow>? outputQueryFaccaoCount3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in ListViewFaccao widget.
  List<FaccoesViewConcatSearchRow>? outputCountFaccoesSearch1;
  // Stores action output result for [Backend Call - Query Rows] action in ListViewFaccaoBuscar widget.
  List<FaccoesViewConcatSearchRow>? outputCountFaccoesSearch2;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    textFieldPesquisarFaccoesFocusNode?.dispose();
    textFieldPesquisarFaccoesTextController?.dispose();

    tabBarController?.dispose();
  }
}
