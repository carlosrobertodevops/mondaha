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

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future docMembrosGerarPDF(List<MembrosViewPdfRow> membrosDoc) async {
// Add your function code here!
  final pdf = pw.Document();

  // Definindo estilos personalizados
  final pw.TextStyle headerStyle =
      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12);
  final pw.TextStyle cellStyle = pw.TextStyle(fontSize: 10);

  for (var i = 0; i < membrosDoc.length; i++) {
    final membro = membrosDoc[i];

    // Obtém a URL da primeira foto, se existir
    final String imageUrl = membro.fotosPath.isNotEmpty == true
        ? membro.fotosPath.first
        : 'SEM FOTO';

    Uint8List? imageBytes;
    if (imageUrl.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          imageBytes = response.bodyBytes;
        }
      } catch (e) {
        print("Erro ao carregar imagem: $e");
      }
    }

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Header(
              level: 0,
              child: pw.Text(
                'FICHA CADASTRAL DE UM POSSÍVEL MEMBRO DE FACÇÃO CRIMINOSA',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 14,
                  color: PdfColors.blue,
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Exibe a foto se existir
            if (imageBytes != null)
              pw.Center(
                child: pw.Image(
                  pw.MemoryImage(imageBytes),
                  width: 150,
                  height: 150,
                  fit: pw.BoxFit.cover,
                ),
              ),

            pw.SizedBox(height: 20),
            pw.Text(
              'ID: ${i + 1}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
            ),

            pw.SizedBox(height: 10),
            pw.Text(
              'Facção: ${membro.faccaoNome ?? 'N/A'}',
              style: pw.TextStyle(fontSize: 12),
            ),

            pw.SizedBox(height: 10),
            pw.Text(
              'Nome: ${membro.nomeCompleto ?? 'N/A'}',
              style: pw.TextStyle(fontSize: 12),
            ),

            pw.SizedBox(height: 10),
            pw.Text(
              'Alcunha(s): ${membro.alcunha ?? 'N/A'}',
              style: pw.TextStyle(fontSize: 12),
            ),

            pw.SizedBox(height: 10),
            pw.Text(
              'Função: ${membro.funcaoNome ?? 'N/A'}',
              style: pw.TextStyle(fontSize: 12),
            ),

            pw.SizedBox(height: 10),
            pw.Text(
              'Endereço(s): ${membro.membroEndereco ?? 'N/A'}',
              style: pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // Print the pdf file
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
