import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/mock/products_mock.dart';
import 'package:invoice_app_flutter/views/products/quantity_counter.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          color: Colors.blueGrey[50],
          child: ListTile(
            title: Text(product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            subtitle: Text(product.description),
            trailing: Text('${product.netPrice.toString()} €'),// TODO add currency
            onTap: () {
              showDialog(
                    context: context,
                    builder: (context) {
                      return QuantityCounterDialog(product: product);
                    },
                    );
            },
          ),
        );
      },
    );
  }
}