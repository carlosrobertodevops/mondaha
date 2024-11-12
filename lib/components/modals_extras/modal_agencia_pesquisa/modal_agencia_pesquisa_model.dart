import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'modal_agencia_pesquisa_widget.dart' show ModalAgenciaPesquisaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ModalAgenciaPesquisaModel
    extends FlutterFlowModel<ModalAgenciaPesquisaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txt_pesquisa widget.
  final txtPesquisaKey = GlobalKey();
  FocusNode? txtPesquisaFocusNode;
  TextEditingController? txtPesquisaTextController;
  String? txtPesquisaSelectedOption;
  String? Function(BuildContext, String?)? txtPesquisaTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtPesquisaFocusNode?.dispose();
  }
}
