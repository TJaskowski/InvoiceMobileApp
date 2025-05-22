import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfInvoice extends ConsumerWidget {
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
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                  pw.Text('Invoice Number: ${invoice.invoiceNumber}'),
                  pw.Text(
                      'Invoice Date: ${invoice.invoiceDate.day}/${invoice.invoiceDate.month}/${invoice.invoiceDate.year}'),
                ]),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                         pw.Column(
                  children: [
                    pw.Text('Buyer:'),
                    if (invoice.client != null) ...[
                      pw.Text(' ${invoice.client!.name}'),
                      pw.Text(' ${invoice.client!.address}'),
                      pw.Text('${invoice.client!.email}'),
                    ]
                    else ...[
                      pw.Text('No client selected'),
                    ],
                  ],
                ),
                pw.SizedBox(width: 20),
                pw.Column(
                  children: [
                    pw.Text('Seller:'),
                    pw.Text('Your Company Name'),
                    pw.Text('Your Company Address'),
                    pw.Text('Your Company Email'),
                  ]
                ),],
                ),
                       pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Products:'),
                    pw.ListView.builder(
                      itemCount: invoice.products.length,
                      itemBuilder: (context, index) {
                        final product = invoice.products[index];
                        return pw.Text(
                            '${product.name} - ${product.netPrice}EUR');
                      },
                    ),
                  ]
                ),
                ],
            );
          },
        ),
      );
      return pdf;
    }

    return PdfPreview(
      actionBarTheme: PdfActionBarTheme(
        backgroundColor: Colors.blueAccent.shade200,
        iconColor: Colors.white,
      ),
      canChangeOrientation: false,
      canChangePageFormat: false,
      canDebug: false,
      //useActions: false, // Uncomment this line to disable the action bar
      //TODO: Is this the best way to show the invoice preview?
      build: (format) => generatePdf().then((pdf) => pdf.save()),
    );
  }
}
