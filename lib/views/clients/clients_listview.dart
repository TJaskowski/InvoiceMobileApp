import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/mock/clients_list.dart';
import 'package:invoice_app_flutter/providers/client_provider.dart';
import 'package:invoice_app_flutter/providers/invoice_provider.dart';

class ClientsList extends ConsumerWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsListProvider);

    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        return Card(
          color: Colors.blueGrey[50],
          child: ListTile(
            title: Text(client.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            subtitle: Text(client.name),
            trailing: Text(client.taxId ?? "No tax ID"),
            onTap: () {
              ref.read(clientProvider.notifier).setClient(client); // TODO: which provider to use?
              ref.read(invoiceProvider.notifier).setClient(client);
              Navigator.of(context).pop();
            },
          ),
        );
      }
    );
  }
}