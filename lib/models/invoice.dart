import 'package:invoice_app_flutter/models/client.dart';

class Invoice {
  final String invoiceNumber;
  final DateTime invoiceDate;
  //final Client? client;

  Invoice({
    required this.invoiceNumber,
    required this.invoiceDate,
  });

  Invoice copyWith({
    String? invoiceNumber,
    DateTime? invoiceDate,
  }) {
    return Invoice(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
    );
  }
}