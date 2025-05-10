import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';
import 'package:invoice_app_flutter/notifiers/product_notifier.dart';

final productProvider = NotifierProvider<ProductNotifier, List<Product>>(() => ProductNotifier(
  
));