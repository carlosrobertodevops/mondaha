import '';
import '/backend/supabase/supabase.dart';
import '/components/modal/modal_membro_maps_view/modal_membro_maps_view_widget.dart';
import '/components/navs/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_mapa_widget.dart' show MainMapaWidget;
import 'package:community_testing_ryusdv/app_state.dart'
    as community_testing_ryusdv_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainMapaModel extends FlutterFlowModel<MainMapaWidget> {
  ///  Local state fields for this page.

  List<LatLng> membrosLngLat = [];
  void addToMembrosLngLat(LatLng item) => membrosLngLat.add(item);
  void removeFromMembrosLngLat(LatLng item) => membrosLngLat.remove(item);
  void removeAtIndexFromMembrosLngLat(int index) =>
      membrosLngLat.removeAt(index);
  void insertAtIndexInMembrosLngLat(int index, LatLng item) =>
      membrosLngLat.insert(index, item);
  void updateMembrosLngLatAtIndex(int index, Function(LatLng) updateFn) =>
      membrosLngLat[index] = updateFn(membrosLngLat[index]);

  List<MembrosViewConcatMapsSeachRow> mapaMembros = [];
  void addToMapaMembros(MembrosViewConcatMapsSeachRow item) =>
      mapaMembros.add(item);
  void removeFromMapaMembros(MembrosViewConcatMapsSeachRow item) =>
      mapaMembros.remove(item);
  void removeAtIndexFromMapaMembros(int index) => mapaMembros.removeAt(index);
  void insertAtIndexInMapaMembros(
          int index, MembrosViewConcatMapsSeachRow item) =>
      mapaMembros.insert(index, item);
  void updateMapaMembrosAtIndex(
          int index, Function(MembrosViewConcatMapsSeachRow) updateFn) =>
      mapaMembros[index] = updateFn(mapaMembros[index]);

  ///  State fields for stateful widgets in this page.

  // Model for web_nav component.
  late WebNavModel webNavModel;
  // State field(s) for TextFieldPesquisarMembros widget.
  FocusNode? textFieldPesquisarMembrosFocusNode;
  TextEditingController? textFieldPesquisarMembrosTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisarMembrosTextControllerValidator;
  // State field(s) for GoogleMapGeral widget.
  LatLng? googleMapGeralsCenter;
  final googleMapGeralsController = Completer<GoogleMapController>();
  // State field(s) for GoogleMapBusca widget.
  LatLng? googleMapBuscasCenter;
  final googleMapBuscasController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    textFieldPesquisarMembrosFocusNode?.dispose();
    textFieldPesquisarMembrosTextController?.dispose();
  }
}
