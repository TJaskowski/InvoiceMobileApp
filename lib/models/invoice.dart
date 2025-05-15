import 'package:invoice_app_flutter/models/client.dart';
import 'package:invoice_app_flutter/models/product.dart';

class Invoice {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final Client? client;
  final List<Product> products;

  Invoice({
    required this.invoiceNumber,
    required this.invoiceDate,
    this.client,
    this.products = const [],
  });

  Invoice copyWith({
    String? invoiceNumber,
    DateTime? invoiceDate,
    Client? client,
    List<Product>? products,
  }) {
    return Invoice(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      client: client ?? this.client,
      products: products ?? this.products,
    );
  }
}