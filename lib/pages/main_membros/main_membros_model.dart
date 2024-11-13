import '/backend/supabase/supabase.dart';
import '/components/dropdowns/dropdown_member_edit/dropdown_member_edit_widget.dart';
import '/components/modal/modal_membros_add/modal_membros_add_widget.dart';
import '/components/modal/modal_membros_edit/modal_membros_edit_widget.dart';
import '/components/modals_extras/modal_command_palette/modal_command_palette_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/adicionar_membros.dart';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'main_membros_widget.dart' show MainMembrosWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainMembrosModel extends FlutterFlowModel<MainMembrosWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? adicionarMembrosController;
  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _qryMembrosMainManager = FutureRequestManager<List<MembrosRow>>();
  Future<List<MembrosRow>> qryMembrosMain({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MembrosRow>> Function() requestFn,
  }) =>
      _qryMembrosMainManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQryMembrosMainCache() => _qryMembrosMainManager.clear();
  void clearQryMembrosMainCacheKey(String? uniqueKey) =>
      _qryMembrosMainManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    adicionarMembrosController?.finish();
    webNavModel.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearQryMembrosMainCache();
  }
}
