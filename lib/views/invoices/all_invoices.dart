import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';

class AllInvoices extends ConsumerWidget {
  const AllInvoices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(invoiceListProvider);
    final total = ref.watch(totalProvider);
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index){
        final invoice = invoices[index];
        return Card(
          color: Colors.blueGrey[50],
          child: ListTile(
            title: Text(invoice.invoiceNumber,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            subtitle: Text(invoice.client?.name ?? "No client selected"),
            trailing: Text('${total.toStringAsFixed(2)} \$'),
            onTap: () {
              // Navigate to invoice details page
              Navigator.of(context).pop();
            },),);
      });
  }
}