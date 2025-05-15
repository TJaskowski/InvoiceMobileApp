import 'package:invoice_app_flutter/models/product.dart';

class SelectedProduct {
  final Product product;
  final int quantity;

  SelectedProduct({
    required this.product,
    required this.quantity,
  });
}