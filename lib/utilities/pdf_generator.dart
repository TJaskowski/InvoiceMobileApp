import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:html' as web;
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';


class PdfGenerator {
  
  Future<void> generatePdf(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World'),
          );
        },)
    );
    final Uint8List pdfBytes = await pdf.save();

    if (kIsWeb) {
      // WEB: Pobierz PDF jako plik
      final base64Data = base64Encode(pdfBytes);
      final url = "data:application/pdf;base64,$base64Data";
       web.AnchorElement(href: url)
        ..setAttribute("download", "faktura.pdf")
        ..click();
    } else {
      // MOBILE/DESKTOP: Zapisz PDF do pliku
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/faktura.pdf');
      await file.writeAsBytes(pdfBytes);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('PDF zapisany'),
          content: Text('Zapisano do: ${file.path}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    }

}