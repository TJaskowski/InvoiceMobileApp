import 'package:flutter/material.dart';

class CustomerBar extends StatelessWidget {
  final String customerName;
  const CustomerBar({super.key, required this.customerName});

  @override
  Widget build(BuildContext context) {
    return  Card(
          color: Colors.blueGrey[200],
          child: ListTile(
            title: RichText(text: TextSpan(
              children: [
                const TextSpan(text: "Invoice to:  ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, )),
                TextSpan(text: customerName, style: const TextStyle(color: Colors.black)),
              ],
            )),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                print('Edit icon clicked');
              },
            ),
           
            
          ),
        );
  }
}