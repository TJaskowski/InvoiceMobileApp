import 'package:flutter/material.dart';
import 'package:invoice_app_flutter/widgets/custom_button.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Products'),
        backgroundColor: Colors.blueAccent.shade200,
      ),
      body: Center(
        child: Text('Products'),
      ),
      floatingActionButton: CustomButton(onPressed: () {
        Navigator.pushNamed(context, '/add_product');
      }),
    );
  }
}