// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddInvoice extends StatelessWidget {
  const AddInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Invoice'),
          backgroundColor: Colors.blueAccent.shade200,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab( text: 'New'),
              Tab(text: 'Preview'),
           
            ],
          ),
        ),
        body: TabBarView(children: 
          [
            Center(child: Text('Create a new invoice here')),
            Center(child: Text('Preview of the invoice')),
          ],
        ),));
  }
}