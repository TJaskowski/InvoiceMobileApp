import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';

class ProductNotifier extends Notifier<List<Product>> {
  
  @override
  List<Product> build() {
    return [
      Product(
        id: '1',
        name: 'Product 1',
        description: 'Description of Product 1',
        netPrice: 10.0,
      ),
      Product(
        id: '2',
        name: 'Product 2',
        description: 'Description of Product 2',
        netPrice: 20.0, 
      ),
    ];
  }

  void addProduct(Product product) {
    state = [...state, product];
  }
  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }
  void updateProduct(Product product) {
    state = state.map((p) => p.id == product.id ? product : p).toList();
  }
  void clearProducts() {
    state = [];
  }
}

