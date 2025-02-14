import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'main_home_widget.dart' show MainHomeWidget;
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainHomeModel extends FlutterFlowModel<MainHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in main_home widget.
  List<UsuariosRow>? outputQueryUsuarios;
  // Stores action output result for [Backend Call - Query Rows] action in main_home widget.
  List<TiposUsuariosRow>? outputQueryTipoUsuarios;
  // Stores action output result for [Backend Call - Query Rows] action in main_home widget.
  List<AgenciasRow>? outputQueryAgenciaNome;
  // Stores action output result for [Backend Call - API (CountUsuariosView)] action in main_home widget.
  ApiCallResponse? apiResultahoUsuarios;
  // Stores action output result for [Backend Call - API (CountMembrosView)] action in main_home widget.
  ApiCallResponse? apiResultMembros;
  // Stores action output result for [Backend Call - API (CountFaccoesView )] action in main_home widget.
  ApiCallResponse? apiResultFaccoes;
  // Stores action output result for [Backend Call - API (CountUsuariosAtivosView )] action in main_home widget.
  ApiCallResponse? apiResultUsuariosAtivos;
  // Model for web_nav component.
  late WebNavModel webNavModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
  }
}
