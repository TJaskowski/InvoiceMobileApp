import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateProvider<int>((ref) => 1); // TODO add quantity to some other provider

class QuantityCounterDialog extends ConsumerStatefulWidget {
  const QuantityCounterDialog({super.key});

  @override
  ConsumerState<QuantityCounterDialog> createState() => _QuantityCounterDialogState();
}

class _QuantityCounterDialogState extends ConsumerState<QuantityCounterDialog> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = ref.read(quantityProvider).toString();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void saveQuantity() {
    final int? quantity = int.tryParse(_quantityController.text);
    if (quantity != null && quantity > 0) {
      ref.read(quantityProvider.notifier).state = quantity;
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
