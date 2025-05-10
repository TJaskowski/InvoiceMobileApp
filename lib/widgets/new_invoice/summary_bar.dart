import 'package:flutter/material.dart';

class SummaryBar  extends StatelessWidget {
  const SummaryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[200],
      child: Column(
        children: [
          ListTile(
            title: const Text('Discount'),
            trailing: const Text('0.00'),
            onTap: () {
              print('Discount clicked');
            },),
          ListTile(
            title: const Text('Tax'),
            trailing: const Text('0.00'),
            onTap: () {
              print('Tax clicked');
            },),  
          Divider(
            color: Colors.grey.shade600,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          const ListTile(
            title: ListTile(
              title: Text('Total due', style: TextStyle(fontWeight: FontWeight.bold))),
            trailing: Text('0.00', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}