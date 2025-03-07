import 'package:flutter/material.dart';

class InvoicesView extends StatelessWidget {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: Center(
        child: Text('Invoices'),
      ),
    );
  }
}