import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/invoice.dart';

class InvoiceNotifier extends Notifier<Invoice> {
  
  Invoice build() {
    return Invoice(invoiceNumber: ' ', invoiceDate: DateTime.now());
  }

}