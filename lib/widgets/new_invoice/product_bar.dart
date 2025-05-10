import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductBar extends ConsumerWidget {
  const ProductBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Card(
          color: Colors.blueGrey[200],
          child: Column(
            children: [
              ListTile(
                
                title: ListTile(
                  title: Text('Add product'),
                  onTap: () => print('Choose the product'),),
                trailing: Text('1 x 0.00'), 
                onTap: () {
                  print('Whole tile clicked');
                },
              ),
              Divider(
                color: Colors.grey.shade600,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: ListTile(
                  title: Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold))),
                trailing: Text('0.00', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
  }
}