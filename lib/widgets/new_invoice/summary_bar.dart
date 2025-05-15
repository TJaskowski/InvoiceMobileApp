import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';
import 'package:invoice_app_flutter/views/products/discount_dialog.dart';
import 'package:invoice_app_flutter/views/products/tax_dialog.dart';

class SummaryBar extends ConsumerWidget {
  const SummaryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(summaryProvider);
    return Card(
      color: Colors.blueGrey[50],
      child: Column(
        children: [
          ListTile(
            title: const Text('Discount'),
            trailing: Text('${summary.discount} %'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const DiscountDialog(),
              );
            },
          ),
          ListTile(
            title: const Text('Tax'),
            trailing: Text('${summary.tax} %'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const TaxDialog(),
              );
            },
          ),
          Divider(
            color: Colors.grey.shade600,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: ListTile(
                title: Text('Total due',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            trailing: Text('${summary.total}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
