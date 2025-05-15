import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/summary.dart';


class SummaryNotifier extends Notifier<Summary> {
  @override
  Summary build() {
    return Summary(
      subtotal: 0.0,
      tax: 0.0,
      discount: 0.0,
    );
  }


  void setSubtotal(double value) {
    state = state.copyWith(subtotal: value);
  }

  void setTax(double value) {
    state = state.copyWith(tax: value);
  }

  void setDiscount(double value) {
    state = state.copyWith(discount: value);
  }
}