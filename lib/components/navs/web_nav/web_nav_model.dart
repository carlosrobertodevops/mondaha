import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/logos/main_logo_bar/main_logo_bar_widget.dart';
import '/components/logos/main_logo_bar_minimal/main_logo_bar_minimal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'web_nav_widget.dart' show WebNavWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebNavModel extends FlutterFlowModel<WebNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for main_logo_bar component.
  late MainLogoBarModel mainLogoBarModel;
  // Model for main_logo_bar_minimal component.
  late MainLogoBarMinimalModel mainLogoBarMinimalModel;

  @override
  void initState(BuildContext context) {
    mainLogoBarModel = createModel(context, () => MainLogoBarModel());
    mainLogoBarMinimalModel =
        createModel(context, () => MainLogoBarMinimalModel());
  }

  @override
  void dispose() {
    mainLogoBarModel.dispose();
    mainLogoBarMinimalModel.dispose();
  }
}
