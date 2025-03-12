// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/widgets/invoice_number.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class NewInvoice extends ConsumerWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final invoiceNumber = ref.watch(invoiceProvider).invoiceNumber;
    return ListView(
      children: [
        Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            title: Text(invoiceNumber),
            subtitle: ListTile(
              title: Text('Client name'),
              onTap: () {
                print('Client name clicked');
              },
            ),
            trailing: Text(
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return InvoiceNumber();
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
                  value = true;
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
