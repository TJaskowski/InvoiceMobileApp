import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceNumber extends StatefulWidget {
  const InvoiceNumber({super.key});

  @override
  State<InvoiceNumber> createState() => _InvoiceNumberState();
}

class _InvoiceNumberState extends State<InvoiceNumber> {
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
    print('Invoice number: ${_invoiceNumberController.text}');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Invoice Number'),
      content: Column(
        children: [
          TextField(
            controller: _invoiceNumberController,
            decoration: InputDecoration(
              labelText: 'Invoice Number',
            ),
          ),
          TextField(
            controller: _invoiceDateController,
            decoration: InputDecoration(
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
                setState(() {
                  _selectedDate = pickedDate;
                  _invoiceDateController.text =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                });
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
          child: Text('Save'),
        ),
      ],
    );
  }
}
