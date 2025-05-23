import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/invoice.dart';
import 'package:invoice_app_flutter/notifiers/invoice_notifier.dart';

final invoiceProvider = NotifierProvider<InvoiceNotifier, Invoice>(() {
  return InvoiceNotifier();
});   

final invoiceListProvider = Provider<List<Invoice>>((ref) {
  return [];
});