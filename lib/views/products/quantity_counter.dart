import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';



class QuantityCounterDialog extends ConsumerStatefulWidget {
  final Product product;
  const QuantityCounterDialog({super.key, required this.product});

  @override
  ConsumerState<QuantityCounterDialog> createState() => _QuantityCounterDialogState();
}

class _QuantityCounterDialogState extends ConsumerState<QuantityCounterDialog> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = '1'; 
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void saveQuantity() { // TODO try to separate the save function from the dialog
    final int? quantity = int.tryParse(_quantityController.text);
    if (quantity != null && quantity > 0) {
      ref.read(selectedProductsProvider.notifier).addProduct(
        widget.product,
        quantity,
      );
      ref.read(invoiceProvider.notifier).addProduct(
        widget.product,
      );
      final double subtotal = widget.product.netPrice * quantity;
      ref.read(summaryProvider.notifier).setSubtotal(subtotal);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid quantity.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            saveQuantity();
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
