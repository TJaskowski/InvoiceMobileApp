class Summary {
  final double subtotal;
  final double tax;
  final double discount;

  Summary({
    required this.subtotal,
    required this.tax,
    required this.discount,
  });
  double get total {
    final discountAmount = (subtotal * discount) / 100;
    final taxAmount = (subtotal - discountAmount) * (tax / 100);
    return subtotal - discountAmount + taxAmount;
  }

  Summary copyWith({
    double? subtotal,
    double? tax,
    double? discount,
  }) {
    return Summary(
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
    );
  }
}