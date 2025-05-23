import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class AllInvoices extends ConsumerWidget {
  const AllInvoices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(invoiceListProvider);
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index){
        final invoice = invoices[index];
        return ListTile(
          title: Text('${invoice.invoiceNumber} - ${invoice.client?.name}'),
        );
      });
  }
}