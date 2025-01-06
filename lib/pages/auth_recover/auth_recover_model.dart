import '/auth/supabase_auth/auth_util.dart';
import '/components/toasts/toast04/toast04_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'auth_recover_widget.dart' show AuthRecoverWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthRecoverModel extends FlutterFlowModel<AuthRecoverWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txt_recover_password widget.
  FocusNode? txtRecoverPasswordFocusNode;
  TextEditingController? txtRecoverPasswordTextController;
  late bool txtRecoverPasswordVisibility;
  String? Function(BuildContext, String?)?
      txtRecoverPasswordTextControllerValidator;
  String? _txtRecoverPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qe3efxn0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for txt_recover_confirm widget.
  FocusNode? txtRecoverConfirmFocusNode;
  TextEditingController? txtRecoverConfirmTextController;
  late bool txtRecoverConfirmVisibility;
  String? Function(BuildContext, String?)?
      txtRecoverConfirmTextControllerValidator;
  String? _txtRecoverConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ivz2lz4f' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtRecoverPasswordVisibility = false;
    txtRecoverPasswordTextControllerValidator =
        _txtRecoverPasswordTextControllerValidator;
    txtRecoverConfirmVisibility = false;
    txtRecoverConfirmTextControllerValidator =
        _txtRecoverConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    txtRecoverPasswordFocusNode?.dispose();
    txtRecoverPasswordTextController?.dispose();

    txtRecoverConfirmFocusNode?.dispose();
    txtRecoverConfirmTextController?.dispose();
  }
}
