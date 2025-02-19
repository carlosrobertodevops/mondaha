// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> checkAcaopenalNoExists(
  List<DataTypesProcessosStruct> dataType,
  String acaoPenalNo,
) async {
  // Add your function code here!
  for (var processos in dataType) {
    if (processos.acaoPenalNo == acaoPenalNo) {
      return true;
    }
  }
  return false;
}
