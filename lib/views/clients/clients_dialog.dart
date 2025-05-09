import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/views/clients/clients_listview.dart';

class ClientsDialog extends ConsumerWidget {
  const ClientsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Select Client'),
      content: SizedBox(
        width: double.maxFinite,
        child: const ClientsList(), 
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Close'),
        ),
      ],
    );
 
  }
}