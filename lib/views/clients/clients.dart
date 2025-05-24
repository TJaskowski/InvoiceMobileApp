// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/views/clients/clients_listview.dart';
import 'package:invoice_app_flutter/widgets/custom_appbar.dart';
import 'package:invoice_app_flutter/widgets/custom_add_button.dart';

class Clients extends StatelessWidget {
  
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
        appBar: CustomAppbar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                print('Search button clicked');
              },
            ),
          ],
          title: 'Clients',
        ),
        body: ClientsList(),
        floatingActionButton: CustomAddButton(onPressed: () {
          Navigator.pushNamed(context, '/add_client');
        },
        ),
      );
  }
}