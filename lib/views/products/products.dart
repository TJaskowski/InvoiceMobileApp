import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';
import 'package:invoice_app_flutter/widgets/custom_appbar.dart';
import 'package:invoice_app_flutter/widgets/custom_button.dart';

class Products extends ConsumerWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              print('Search button clicked');
            },
          ),
        ],
        title: 'Products',
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: \$${product.netPrice}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(productProvider.notifier).removeProduct(product);
              },
            ),
          );
        }),
      floatingActionButton: CustomButton(onPressed: () {
        Navigator.pushNamed(context, '/add_product');
      }),
    );
  }
}