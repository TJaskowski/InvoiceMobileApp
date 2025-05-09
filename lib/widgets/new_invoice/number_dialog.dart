import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class NumberDialog extends ConsumerStatefulWidget {
  const NumberDialog({super.key});

  @override
  ConsumerState<NumberDialog> createState() => _InvoiceNumberDialogState();
}

class _InvoiceNumberDialogState extends ConsumerState<NumberDialog> {
  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _invoiceDateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _invoiceDateController.dispose();
    super.dispose();
  }

  void saveInvoiceNumber() {
    if(_invoiceNumberController.text.isNotEmpty){
      ref.read(invoiceProvider.notifier).setInvoiceNumber(_invoiceNumberController.text);
    }
    Navigator.of(context).pop();
        if (_invoiceNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter an invoice number.'),
        ),
      );
      return;
    }
  }

  void saveInvoiceDate(DateTime? date) {
      ref.read(invoiceProvider.notifier).setInvoiceDate(date ?? DateTime.now());
      _invoiceDateController.text = DateFormat('yyyy-MM-dd').format(date!);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Invoice Number'),
      content: Column(
        children: [
          TextField(
            controller: _invoiceNumberController,
            decoration: InputDecoration(
              labelText: ref.read(invoiceProvider).invoiceNumber,
            ),
          ),
          TextField(
            controller: _invoiceDateController,
            decoration: const InputDecoration(
              labelText: 'Invoice Date',
            ),
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate!,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null && pickedDate != _selectedDate) {
                saveInvoiceDate(pickedDate);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            saveInvoiceNumber();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
