import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';
import 'package:invoice_app_flutter/views/products/products_list.dart';

class ProductBar extends ConsumerWidget {
  const ProductBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProducts = ref.watch(selectedProductsProvider);
    final subtotal = ref.watch(subtotalProvider);
    return  Card(
          color: Colors.blueGrey[50],
          child: Column(
            children: [
              ListTile(
                title: ListTile(
                  title: Text('Add product'),
                  onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ProductsList();
                    },
                    );
                },),
              ),
              ...selectedProducts.map((product) {
                return ListTile(
                  title: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref.read(selectedProductsProvider.notifier).removeProduct(product);
                        },
                      ),
                      Text(product.product.name),
                    ],
                  ),
                  trailing: Text('${product.product.netPrice * product.quantity} €'),
                  
                );
              }),
              Divider(
                color: Colors.grey.shade600,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: ListTile(
                  title: Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold))),
                trailing: Text('${subtotal.toStringAsFixed(2)} €', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
  }
}