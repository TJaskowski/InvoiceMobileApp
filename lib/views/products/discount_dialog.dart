import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/providers/product_provider.dart';

class DiscountDialog extends ConsumerStatefulWidget {
  const DiscountDialog({super.key});

  @override
  ConsumerState<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends ConsumerState<DiscountDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final currentDiscount = ref.read(summaryProvider).discount;
    _controller = TextEditingController(text: currentDiscount.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void saveDiscount() {
    final value = double.tryParse(_controller.text);
    if (value != null && value >= 0) {
      ref.read(summaryProvider.notifier).setDiscount(value);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid discount percentage')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set Discount (%)'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Discount percentage'),
      ),
      actions: [
        TextButton(
          onPressed: saveDiscount,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
