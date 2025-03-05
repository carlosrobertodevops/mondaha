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
import 'package:intl/intl.dart';

Future docMembrosGerarPDF(List<MembrosViewPdfRow> membrosDoc) async {
  final pdf = pw.Document();
  final now = DateTime.now();
  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  final generatedDate = dateFormat.format(now);

  // Imagem de fundo com uma marca d'água ou logo da organização
  // Obtendo a URL da variável de app do FlutterFlow
  final String? backgroundImageUrl = FFAppState().backgroundImageUrl;
  final String? usuarioAtual = FFAppState().UsuarioAtualNomeCompleto;
  final String? agenciaAtual = FFAppState().UsuarioAtualAgenciaNome;

  // Imagem de fundo (marca d'água ou logo da organização)
  Uint8List? backgroundImage;
  if (backgroundImageUrl != null && backgroundImageUrl.isNotEmpty) {
    try {
      final response = await http.get(Uri.parse(backgroundImageUrl));
      if (response.statusCode == 200) {
        backgroundImage = response.bodyBytes;
      }
    } catch (e) {
      print("Erro ao carregar imagem de fundo: $e");
    }
  }

  for (var i = 0; i < membrosDoc.length; i++) {
    final membro = membrosDoc[i];
    final String imageUrl =
        membro.fotosPath.isNotEmpty ? membro.fotosPath.first : '';
    Uint8List? imageBytes;

    if (imageUrl.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          imageBytes = response.bodyBytes;
        }
      } catch (e) {
        print("Erro ao carregar imagem do membro: $e");
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (context) => pw.Stack(
          children: [
            // Imagem de fundo
            if (backgroundImage != null)
              pw.Positioned.fill(
                child: pw.Opacity(
                  opacity: 0.2,
                  child: pw.Image(pw.MemoryImage(backgroundImage),
                      fit: pw.BoxFit.cover),
                ),
              ),

            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Header(
                  level: 0,
                  child: pw.Text(
                    'POSSÍVEL MEMBRO DE FACÇÃO CRIMINOSA',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 14,
                      color: PdfColors.blue,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),

                if (imageBytes != null)
                  pw.Center(
                    child: pw.Image(
                      pw.MemoryImage(imageBytes),
                      width: 150,
                      height: 150,
                      fit: pw.BoxFit.cover,
                    ),
                  ),

                pw.SizedBox(height: 10),
                pw.Text('Facção: ${membro.faccaoNome ?? 'N/A'}',
                    style: pw.TextStyle(fontSize: 14)),

                pw.SizedBox(height: 10),
                pw.Text('Nome: ${membro.nomeCompleto ?? 'N/A'}',
                    style: pw.TextStyle(fontSize: 12)),

                pw.SizedBox(height: 10),
                pw.Text('Alcunha(s): ${membro.alcunha ?? 'N/A'}',
                    style: pw.TextStyle(fontSize: 12)),

                pw.SizedBox(height: 10),
                pw.Text('Função: ${membro.funcaoNome ?? 'N/A'}',
                    style: pw.TextStyle(fontSize: 12)),

                pw.SizedBox(height: 10),
                pw.Text('Endereço(s): ${membro.membroEndereco ?? 'N/A'}',
                    style: pw.TextStyle(fontSize: 12)),

                pw.SizedBox(height: 10),

                // Dados vinculados (exemplo: outros registros relacionados ao membro)
                // if (membro.dadosExtras != null)
                //   pw.Text('Outras Informações: ${membro.dadosExtras}',
                //       style: pw.TextStyle(fontSize: 12)),
                pw.Footer(
                  leading: null,
                  title: pw.Text(
                    '(DOCUMENTO RESERVADO - CHEGII) - ($agenciaAtual) - ($usuarioAtual) - Relatório gerado em: $generatedDate',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 10,
                      color: PdfColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // footer: (context) => pw.Text(
        //   '(DOCUMENTO RESERVADO - CHEGII) - Relatório gerado em: $generatedDate',
        //   style: pw.TextStyle(fontSize: 10, color: PdfColors.grey),
        //   textAlign: pw.TextAlign.center,
        // ),
      ),
    );
  }

  // Imprime o PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
