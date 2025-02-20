import '/backend/supabase/supabase.dart';
import '/components/toasts/toast04/toast04_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'modal_faccao_edit_widget.dart' show ModalFaccaoEditWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalFaccaoEditModel extends FlutterFlowModel<ModalFaccaoEditWidget> {
  ///  Local state fields for this component.

  bool? uploadImagemTemp = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txt_nome_faccao widget.
  FocusNode? txtNomeFaccaoFocusNode;
  TextEditingController? txtNomeFaccaoTextController;
  String? Function(BuildContext, String?)? txtNomeFaccaoTextControllerValidator;
  String? _txtNomeFaccaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yg28k56i' /* Please enter a faction name... */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '2bgiqjty' /* Minimum of 2 characters entere... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'ysfp5vt3' /* More than 50 characters typed */,
      );
    }

    return null;
  }

  // State field(s) for txt_description widget.
  FocusNode? txtDescriptionFocusNode;
  TextEditingController? txtDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtDescriptionTextControllerValidator;
  String? _txtDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fwvtuuff' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FaccoesRow>? outputFaccaoFileEdit;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FaccoesRow>? outputFaccaoPathEdit;

  @override
  void initState(BuildContext context) {
    txtNomeFaccaoTextControllerValidator =
        _txtNomeFaccaoTextControllerValidator;
    txtDescriptionTextControllerValidator =
        _txtDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeFaccaoFocusNode?.dispose();
    txtNomeFaccaoTextController?.dispose();

    txtDescriptionFocusNode?.dispose();
    txtDescriptionTextController?.dispose();
  }
}
