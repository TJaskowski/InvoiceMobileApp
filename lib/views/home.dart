import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/views/invoices/invoices.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('InvoiceApp'),
        backgroundColor: Colors.blueAccent.shade200,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader( 
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('InvoiceApp'),
            ),
            ListTile(
              title: const Text('Invoices'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/invoices');
              },
            ),
            ListTile(
              title: const Text('Clients'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/clients');
              },
            ),
              ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/products');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to InvoiceApp',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text("The best app for managing your invoices"),
            const SizedBox(height: 20),
            Text("Click on the menu to get started"),
          ],
        ),
      ),
    );
  }
}