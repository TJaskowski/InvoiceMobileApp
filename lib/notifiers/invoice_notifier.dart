import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/client.dart';
import 'package:invoice_app_flutter/models/invoice.dart';
import 'package:invoice_app_flutter/models/product.dart';

class InvoiceNotifier extends Notifier<Invoice> {
  
  @override
  Invoice build() {
    return Invoice(invoiceNumber: 'INV000', invoiceDate: DateTime.now(), client: null, products: []);
  }

  void setInvoiceNumber(String invoiceNumber) {
    if (invoiceNumber.isNotEmpty) {
    state = state.copyWith(invoiceNumber: invoiceNumber); 
    }
  }

  void setInvoiceDate(DateTime invoiceDate) {
    state = state.copyWith(invoiceDate: invoiceDate);
  }

  void setClient(Client client) {
    state = state.copyWith(client: client);
  }
  void addProduct(Product product) {
    state = state.copyWith(products: [...state.products, product]);
  }

}