// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/client_provider.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/customer_bar.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/number_bar.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/product_bar.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/summary_bar.dart';

class NewInvoice extends ConsumerWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceNumber = ref.watch(invoiceProvider).invoiceNumber;
    final invoiceDate = ref.watch(invoiceProvider).invoiceDate;
    final customer = ref.watch(clientProvider);
    final summary = ref.watch(summaryProvider);
    final invoiceList = ref.watch(invoiceListProvider);
    // final customer =  ref.watch(invoiceProvider).client ;
    return ListView(
      children: [
        NumberBar(invoiceNumber: invoiceNumber, invoiceDate: invoiceDate),
        CustomerBar(
            customerName:
                customer.name), //TODO: send the client name from the provider
        // to navigate to client page use: Navigator.pushNamed(context, '/clients');
        ProductBar(),
        SummaryBar(),
        Row(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                  FloatingActionButton(// Button to show data on console
            child: Text('show data'),
            onPressed: () {
              print(ref.read(invoiceProvider).invoiceNumber);
              print(ref.read(invoiceProvider).invoiceDate);
              print(ref.read(invoiceProvider).client?.name);
              print(ref.read(invoiceProvider).products
                  .map((e) => e.name)
                  .toList());
          }
                   )  ,
        Expanded(
          child: summary.tax > 0
              ? FloatingActionButton(
                  child: Wrap(
                    children: [
                      Text('Delete tax'),
                      SizedBox(width: 10),
                      Icon(Icons.delete),
                    ],
                  ),
                  onPressed: () {
                    ref.read(summaryProvider.notifier).setTax(0);
                  })
              : Container(),
        ),
    
        Expanded(
          child: summary.discount > 0
              ? FloatingActionButton(
                  child: Wrap(
                    children: [
                      Text('Delete discount'),
                      SizedBox(width: 10),
                      Icon(Icons.delete),
                    ],
                  ),
                  onPressed: () {
                    ref.read(summaryProvider.notifier).setDiscount(0);
                  })
              : Container(),
        ),
                  ],
    ),
    SizedBox(height: 10,),
    FloatingActionButton( //TODO: this button can't be floating, it should be a normal button
      child: Text('Add invoice'),
      onPressed: (){
      invoiceList.add(ref.read(invoiceProvider));

    })
      ],
    );
  }
}
