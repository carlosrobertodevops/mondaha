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

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

Timer? inactivityTimer;

Future<void> resetTimerAction(BuildContext context) async {
  // Pega o valor da variável 'inactivityTimeout' do App State
  int timeoutMinutes = FFAppState().inactivityTimeout;

  // Cancela qualquer timer ativo
  inactivityTimer?.cancel();

  // Inicia um novo timer com o valor obtido do App State
  inactivityTimer = Timer(Duration(minutes: timeoutMinutes), () async {
    // Exibe o diálogo antes de deslogar
    showDialog(
      context: context,
      barrierDismissible:
          false, // Impede que o usuário feche o diálogo tocando fora dele
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sessão Expirada"),
          content: Text("Você foi deslogado por inatividade."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    // Aguarda 3 segundos antes de deslogar
    await Future.delayed(Duration(seconds: 3));

    // Desloga o usuário
    await Supabase.instance.client.auth.signOut();

    // Redireciona para a página de login
    context.goNamed('loginPage');
  });
}
