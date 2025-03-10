// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/widgets/custom_button.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                print('Search button clicked');
              },
            ),
          ],
          title: Text('Clients'),
          backgroundColor: Colors.blueAccent.shade200,
        ),
        body: Center(child: Text('List of all clients')),
        floatingActionButton: CustomButton(onPressed: () {
          Navigator.pushNamed(context, '/add_client');
        },
        ),
      );
  }
}