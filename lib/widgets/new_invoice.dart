// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/utilities/pdf_generator.dart';
import 'package:invoice_app_flutter/widgets/invoice_number.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class NewInvoice extends ConsumerWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final invoiceNumber = ref.watch(invoiceProvider).invoiceNumber;
    final invoiceDate = ref.watch(invoiceProvider).invoiceDate;
    return ListView(
      children: [
        Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            title: Text(invoiceNumber),
           
            trailing: Text(
                "${invoiceDate.day}/${invoiceDate.month}/${invoiceDate.year}"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return InvoiceNumberDialog();
                  });
            },
          ),
        ),
        Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            title: Text('Customer'),
            subtitle: ListTile(
              title: Text('Client name'),
              onTap: () {
                print('Client name clicked');
              },
            ),
            trailing: Text(
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
            onTap: () {
              print('Whole tile clicked');
              PdfGenerator().generatePdf(context);
            },
          ),
        ),
        Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.monetization_on),
              onPressed: () {
                print('Money icon clicked');
              },
            ),
            title: Text('INVNR002'),
            subtitle: ListTile(
              title: Text('Client name'),
              onTap: () {
                print('Client name clicked');
              },
            ),
            trailing: Checkbox(
                value: false,
                onChanged: (value) {
          
                  print('Checkbox clicked');
                }),
            onTap: () {
              print('Whole tile clicked');
            },
          ),
        )
      ],
    );
  }
}
