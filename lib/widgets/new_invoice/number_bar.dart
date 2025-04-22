import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/number_dialog.dart';


class NumberBar extends StatelessWidget {
  final String invoiceNumber;
  final DateTime invoiceDate;
  const NumberBar({super.key, required this.invoiceNumber, required this.invoiceDate});

  @override
  Widget build(BuildContext context) {
    return Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            title: Text(invoiceNumber,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
           
            trailing: Text(
                "${invoiceDate.day}/${invoiceDate.month}/${invoiceDate.year}"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return NumberDialog();
                  });
            },
          ),
        );
  }
}