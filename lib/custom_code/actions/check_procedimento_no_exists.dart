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

Future<bool> checkProcedimentoNoExists(
  List<DataTypesProcedimentosStruct> dataType,
  String procedimentoNo,
) async {
  // Add your function code here!
  for (var procedimentos in dataType) {
    if (procedimentos.procedimentoNo == procedimentoNo) {
      return true; // Retorna true se o procedimento_no já existir
    }
  }
  return false; // Retorna false se não encontrar nenhum procedimento com o mesmo procedimento_no
}
