import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfInvoice extends ConsumerWidget{
  const PdfInvoice({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     Future<pw.Document> generatePdf() async {
    final invoice = ref.read(invoiceProvider);
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Invoice Number: ${invoice.invoiceNumber}'),
              pw.Text('Invoice Date: ${invoice.invoiceDate.day}/${invoice.invoiceDate.month}/${invoice.invoiceDate.year}'),
            ],
          );
        },
      ),
    );
    return pdf;
  }
    return PdfPreview(
    build: (format) => generatePdf().then((pdf) => pdf.save()),
  );
  }
}

