import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';
import 'package:invoice_app_flutter/models/selected_product.dart';

class SelectedProductsNotifier extends Notifier<List<SelectedProduct>> {
  @override
  List<SelectedProduct> build() {
    return [];
  }

  void addProduct(Product product, int quantity) {
    state = [...state, SelectedProduct(product: product, quantity: quantity)];
  }

  void removeProduct(SelectedProduct product) {
    state = state.where((p) => p.product.id != product.product.id).toList();
  }

  void clearProducts() {
    state = [];
  }

}