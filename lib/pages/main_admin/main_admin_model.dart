import '';
import '/backend/supabase/supabase.dart';
import '/components/modal/modal_profile_edit_admin/modal_profile_edit_admin_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/dropdowns/dropdown_usuario_admin_edit/dropdown_usuario_admin_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_admin_widget.dart' show MainAdminWidget;
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainAdminModel extends FlutterFlowModel<MainAdminWidget> {
  ///  Local state fields for this page.

  int? countUsuarios = 0;

  ///  State fields for stateful widgets in this page.

  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TextFieldPesquisaAdmin widget.
  FocusNode? textFieldPesquisaAdminFocusNode;
  TextEditingController? textFieldPesquisaAdminTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisaAdminTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextFieldPesquisaAdmin widget.
  List<UsuariosViewConcatSearchRow>? outputQueryUsuariosCount2;
  // Stores action output result for [Backend Call - Query Rows] action in TextFieldPesquisaAdmin widget.
  List<UsuariosViewConcatSearchRow>? outputQueryUsuariosCount1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsuariosViewConcatSearchRow>? outputQueryUsuariosCount3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in ListViewUsuarios widget.
  List<UsuariosViewConcatSearchRow>? outputCountUsuariosSearch1;
  // Stores action output result for [Backend Call - Query Rows] action in ListViewUsuariosGestor widget.
  List<UsuariosViewConcatSearchRow>? outputCountUsuariosSearch2;
  // Stores action output result for [Backend Call - Query Rows] action in ListViewUsuariosSearch widget.
  List<UsuariosViewConcatSearchRow>? outputCountUsuariosSearch2Copy;
  // Stores action output result for [Backend Call - Query Rows] action in ListViewUsuariosGestorSearch widget.
  List<UsuariosViewConcatSearchRow>? outputCountUsuariosSearch4;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    textFieldPesquisaAdminFocusNode?.dispose();
    textFieldPesquisaAdminTextController?.dispose();

    tabBarController?.dispose();
  }
}
