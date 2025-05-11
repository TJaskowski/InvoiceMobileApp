import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'InvoiceApp',
        centerTitle: true, 
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight), 
          child: Container()), ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader( 
              decoration: BoxDecoration(
                 gradient: LinearGradient(
              colors: [
                Colors.blueAccent.shade200, 
                Color.fromARGB(255, 159, 212, 255), 
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
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