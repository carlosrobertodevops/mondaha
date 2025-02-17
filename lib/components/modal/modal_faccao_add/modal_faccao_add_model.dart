import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import 'modal_faccao_add_widget.dart' show ModalFaccaoAddWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalFaccaoAddModel extends FlutterFlowModel<ModalFaccaoAddWidget> {
  ///  Local state fields for this component.

  bool uploadImagem = false;

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
        '4spmowtt' /* Please enter a faction name... */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'k8todo97' /* Minimum of 2 characters entere... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'i135rulk' /* More than 50 characters typed */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wfu6up0n' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FaccoesRow? outputFaccaoUpdate;

  @override
  void initState(BuildContext context) {
    txtNomeFaccaoTextControllerValidator =
        _txtNomeFaccaoTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeFaccaoFocusNode?.dispose();
    txtNomeFaccaoTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
