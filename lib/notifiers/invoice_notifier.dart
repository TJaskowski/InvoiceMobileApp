import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/invoice.dart';

class InvoiceNotifier extends Notifier<Invoice> {
  
  Invoice build() {
    return Invoice(invoiceNumber: 'INV000', invoiceDate: DateTime.now());
  }

  void setInvoiceNumber(String invoiceNumber) {
    if (invoiceNumber.isNotEmpty) {
    state = state.copyWith(invoiceNumber: invoiceNumber); 
    }
  }

  void setInvoiceDate(DateTime invoiceDate) {
    state = state.copyWith(invoiceDate: invoiceDate);
  }

}