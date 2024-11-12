import '/components/modall/user_details_main/user_details_main_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'modal_user_widget.dart' show ModalUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalUserModel extends FlutterFlowModel<ModalUserWidget> {
  ///  Local state fields for this component.

  bool? showBack = false;

  ///  State fields for stateful widgets in this component.

  // Model for user_details_main component.
  late UserDetailsMainModel userDetailsMainModel;

  @override
  void initState(BuildContext context) {
    userDetailsMainModel = createModel(context, () => UserDetailsMainModel());
  }

  @override
  void dispose() {
    userDetailsMainModel.dispose();
  }
}
