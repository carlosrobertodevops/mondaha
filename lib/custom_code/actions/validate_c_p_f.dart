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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<bool> validateCPF(String cpf) async {
  // Retorna True se o CPF estiver vazio
  if (cpf.isEmpty) {
    return true;
  }

  // Remove caracteres não numéricos
  cpf = cpf.replaceAll(RegExp(r'\D'), '');

  // Verifica se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return false;
  }

  // CPF com todos os dígitos iguais é inválido
  if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
    return false;
  }

  // Calcula o primeiro dígito verificador
  int sum1 = 0;
  for (int i = 0; i < 9; i++) {
    sum1 += int.parse(cpf[i]) * (10 - i);
  }
  int digit1 = 11 - (sum1 % 11);
  if (digit1 >= 10) {
    digit1 = 0;
  }
  if (digit1 != int.parse(cpf[9])) {
    return false;
  }

  // Calcula o segundo dígito verificador
  int sum2 = 0;
  for (int i = 0; i < 10; i++) {
    sum2 += int.parse(cpf[i]) * (11 - i);
  }
  int digit2 = 11 - (sum2 % 11);
  if (digit2 >= 10) {
    digit2 = 0;
  }
  if (digit2 != int.parse(cpf[10])) {
    return false;
  }

  return true; // CPF válido
}
