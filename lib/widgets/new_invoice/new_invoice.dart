// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/customer_bar.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/number_bar.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/number_dialog.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class NewInvoice extends ConsumerWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final invoiceNumber = ref.watch(invoiceProvider).invoiceNumber;
    final invoiceDate = ref.watch(invoiceProvider).invoiceDate;
    final customer =  ref.watch(invoiceProvider).client ;
    return ListView(
      children: [
        NumberBar(invoiceNumber: invoiceNumber, invoiceDate: invoiceDate),
        CustomerBar(customerName: customer?.name ?? "Customer not added"),//TODO: send the client name from the provider
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
