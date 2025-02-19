import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/modal/modal_message_ok/modal_message_ok_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'auth_login_widget.dart' show AuthLoginWidget;
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthLoginModel extends FlutterFlowModel<AuthLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txt_login_email widget.
  FocusNode? txtLoginEmailFocusNode;
  TextEditingController? txtLoginEmailTextController;
  String? Function(BuildContext, String?)? txtLoginEmailTextControllerValidator;
  String? _txtLoginEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jc4by7hx' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'tfxgr8x2' /* Error typing email! */,
      );
    }
    return null;
  }

  // State field(s) for txt_login_password widget.
  FocusNode? txtLoginPasswordFocusNode;
  TextEditingController? txtLoginPasswordTextController;
  late bool txtLoginPasswordVisibility;
  String? Function(BuildContext, String?)?
      txtLoginPasswordTextControllerValidator;
  String? _txtLoginPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fi11huhh' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in btn-login widget.
  List<UsuariosRow>? usuarioDiferenteNove;
  // State field(s) for ddw_agencia widget.
  int? ddwAgenciaValue;
  FormFieldController<int>? ddwAgenciaValueController;
  // State field(s) for txt_signup_nome widget.
  FocusNode? txtSignupNomeFocusNode;
  TextEditingController? txtSignupNomeTextController;
  String? Function(BuildContext, String?)? txtSignupNomeTextControllerValidator;
  String? _txtSignupNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7epcfb3x' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jhqn2e6f' /* Invalid username ! */,
      );
    }
    return null;
  }

  // State field(s) for txt_signup_email widget.
  FocusNode? txtSignupEmailFocusNode;
  TextEditingController? txtSignupEmailTextController;
  String? Function(BuildContext, String?)?
      txtSignupEmailTextControllerValidator;
  String? _txtSignupEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0oyc6zx2' /* Field is required! */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'dw2vhjan' /* Invalid email! */,
      );
    }
    return null;
  }

  // State field(s) for txt_signup_password widget.
  FocusNode? txtSignupPasswordFocusNode;
  TextEditingController? txtSignupPasswordTextController;
  late bool txtSignupPasswordVisibility;
  String? Function(BuildContext, String?)?
      txtSignupPasswordTextControllerValidator;
  String? _txtSignupPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9lz7n6fv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for txt_signup_confirm widget.
  FocusNode? txtSignupConfirmFocusNode;
  TextEditingController? txtSignupConfirmTextController;
  late bool txtSignupConfirmVisibility;
  String? Function(BuildContext, String?)?
      txtSignupConfirmTextControllerValidator;
  String? _txtSignupConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fyc3auc8' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in btn-signin widget.
  UsuariosRow? outputUsuarioAdd;

  @override
  void initState(BuildContext context) {
    txtLoginEmailTextControllerValidator =
        _txtLoginEmailTextControllerValidator;
    txtLoginPasswordVisibility = false;
    txtLoginPasswordTextControllerValidator =
        _txtLoginPasswordTextControllerValidator;
    txtSignupNomeTextControllerValidator =
        _txtSignupNomeTextControllerValidator;
    txtSignupEmailTextControllerValidator =
        _txtSignupEmailTextControllerValidator;
    txtSignupPasswordVisibility = false;
    txtSignupPasswordTextControllerValidator =
        _txtSignupPasswordTextControllerValidator;
    txtSignupConfirmVisibility = false;
    txtSignupConfirmTextControllerValidator =
        _txtSignupConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtLoginEmailFocusNode?.dispose();
    txtLoginEmailTextController?.dispose();

    txtLoginPasswordFocusNode?.dispose();
    txtLoginPasswordTextController?.dispose();

    txtSignupNomeFocusNode?.dispose();
    txtSignupNomeTextController?.dispose();

    txtSignupEmailFocusNode?.dispose();
    txtSignupEmailTextController?.dispose();

    txtSignupPasswordFocusNode?.dispose();
    txtSignupPasswordTextController?.dispose();

    txtSignupConfirmFocusNode?.dispose();
    txtSignupConfirmTextController?.dispose();
  }
}
