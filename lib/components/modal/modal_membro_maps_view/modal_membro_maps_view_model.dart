import '';
import '/backend/supabase/supabase.dart';
import '/components/modal/user_details_membro_maps_view/user_details_membro_maps_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'modal_membro_maps_view_widget.dart' show ModalMembroMapsViewWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalMembroMapsViewModel
    extends FlutterFlowModel<ModalMembroMapsViewWidget> {
  ///  Local state fields for this component.

  bool? showBack = false;

  ///  State fields for stateful widgets in this component.

  // Model for user_details_membro_maps_view component.
  late UserDetailsMembroMapsViewModel userDetailsMembroMapsViewModel;

  @override
  void initState(BuildContext context) {
    userDetailsMembroMapsViewModel =
        createModel(context, () => UserDetailsMembroMapsViewModel());
  }

  @override
  void dispose() {
    userDetailsMembroMapsViewModel.dispose();
  }
}
