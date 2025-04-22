// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/utilities/pdf_invoice.dart';
import 'package:invoice_app_flutter/widgets/new_invoice/new_invoice.dart';

class AddInvoice extends StatelessWidget {
  const AddInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
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
            NewInvoice(),
            PdfInvoice(),
          ],
        ),));
  }
}

