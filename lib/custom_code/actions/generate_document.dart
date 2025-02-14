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

// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Documentero - Generate DOCX/PDF Action
// Action Accepts Template ID, Data in JSON Format & Account API Key & Document Format ('pdf' or 'docx') to generate DOCX or PDF Documents
// Output of action is expirable document download URL

// Get API Key - https://app.documentero.com/admin/account
// Create Document Template - https://app.documentero.com/admin/collections

// YouTube Tutorials - https://www.youtube.com/@documentero

Future<String> generateDocument(
    String? apiKey, String? documentId, String? format, dynamic data) async {
  final requestData = {
    'apiKey': apiKey,
    'document': documentId != null ? documentId : 'sample',
    'data': data != null ? data : {},
    'format': format != null ? format : ''
  };

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(
    Uri.parse('https://app.documentero.com/api'),
    headers: headers,
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final documentUrl = jsonResponse['data'];
    return documentUrl;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    print('Error message: ${response.body}');
    throw Exception('Failed to generate document - ${response.body}');
  }
}
