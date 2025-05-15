import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';

class TaxDialog extends ConsumerStatefulWidget {
  const TaxDialog({super.key});

  @override
  ConsumerState<TaxDialog> createState() => _TaxDialogState();
}

class _TaxDialogState extends ConsumerState<TaxDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final currentTax = ref.read(summaryProvider).tax;
    _controller = TextEditingController(text: currentTax.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void saveTax() {
    final value = double.tryParse(_controller.text);
    if (value != null && value >= 0) {
      ref.read(summaryProvider.notifier).setTax(value);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid tax percentage')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set Tax (%)'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Tax percentage'),
      ),
      actions: [
        TextButton(
          onPressed: saveTax,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
