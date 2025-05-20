import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';
import 'package:invoice_app_flutter/models/selected_product.dart';
import 'package:invoice_app_flutter/models/summary.dart';
import 'package:invoice_app_flutter/notifiers/product_notifier.dart';
import 'package:invoice_app_flutter/notifiers/selected_products_notifier.dart';
import 'package:invoice_app_flutter/notifiers/summary_notifier.dart';

final productProvider = NotifierProvider<ProductNotifier, List<Product>>(() => ProductNotifier(
  
));

final selectedProductsProvider = NotifierProvider<SelectedProductsNotifier, List<SelectedProduct>>(
  () => SelectedProductsNotifier(),
);

final subtotalProvider = Provider<double>((ref) {
  final products = ref.watch(selectedProductsProvider);
  return products.fold<double>(
    0.0,
    (sum, item) =>
        sum + (item.product.netPrice * item.quantity),
  );
});

final totalProvider = Provider<double>((ref) {
  final subtotal = ref.watch(subtotalProvider);
  final tax = ref.watch(summaryProvider).tax;
  final discount = ref.watch(summaryProvider).discount;
  final discountAmount = (subtotal * discount) / 100;
  final taxAmount = (subtotal - discountAmount) * (tax / 100);
  return subtotal - discountAmount + taxAmount;
});

final summaryProvider = NotifierProvider<SummaryNotifier, Summary>(
  () => SummaryNotifier(),
);