// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/views/invoices/all_invoices.dart';
import 'package:invoice_app_flutter/widgets/custom_appbar.dart';
import 'package:invoice_app_flutter/widgets/custom_button.dart';

class InvoicesView extends StatelessWidget {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: 
        CustomAppbar(
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
          title: 'Invoices',
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab( text: 'All'),
              Tab(text: 'Outstanding'),
              Tab(text: 'Paid'),
            ],
          ),
        ),
        body: TabBarView(children: 
          [
            AllInvoices(),
            Center(child: Text('List of outstanding invoices')),
            Center(child: Text('List of paid invoices')),
          ],
        ),
        floatingActionButton: CustomButton(onPressed: () {
          Navigator.pushNamed(context, '/add_invoice');
        },
        ),
      ),
    );
  }
}