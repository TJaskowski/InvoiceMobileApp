// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NewInvoice extends StatelessWidget {
  const NewInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text('INVNR001'),
            subtitle: ListTile(
              title: Text('Client name'),
              onTap: () {
                print('Client name clicked');
              },
            ),
            trailing: Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
            onTap: () {
              print('Whole tile clicked');
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.monetization_on),
              onPressed: () {
                print('Money icon clicked');
              },
            ),
            title: Text('INVNR002'),
            subtitle: ListTile(
              title: Text('Client name'),
              onTap: () {
                print('Client name clicked');
              },
            ),
            trailing: Checkbox(value: false, onChanged: (value) {value = true;
              print('Checkbox clicked');
            }),
            onTap: () {
              print('Whole tile clicked');
            },
          ),
        )
      ],
    );
  }
}