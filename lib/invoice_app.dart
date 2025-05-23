import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/views/clients/add_client.dart';
import 'package:invoice_app_flutter/views/invoices/add_invoice.dart';
import 'package:invoice_app_flutter/views/products/add_product.dart';
import 'package:invoice_app_flutter/views/clients/clients.dart';
import 'package:invoice_app_flutter/views/home.dart';
import 'package:invoice_app_flutter/views/invoices/invoices.dart';
import 'package:invoice_app_flutter/views/products/products.dart';
import 'package:invoice_app_flutter/views/settings.dart';

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/invoices': (context) => InvoicesView(),
        '/clients': (context) => Clients(),
        '/products': (context) => Products(),
        '/settings': (context) => Settings(),
        '/add_invoice': (context) => AddInvoice(),
        '/add_client': (context) => AddClient(),
        '/add_product': (context) => AddProduct(),
      },
      title: 'InvoiceApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade400),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
