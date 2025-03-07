import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/views/clients.dart';
import 'package:invoice_app_flutter/views/home.dart';
import 'package:invoice_app_flutter/views/invoices.dart';
import 'package:invoice_app_flutter/views/products.dart';
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
