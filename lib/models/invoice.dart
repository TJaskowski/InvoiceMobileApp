class Invoice {
  final String invoiceNumber;
  final DateTime invoiceDate;

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