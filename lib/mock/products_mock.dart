import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/product.dart';

final productListProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: '1',
      name: 'Product 1',
      description: 'Description of Product 1',
      netPrice: 10.0,
    ),
     Product(
      id: '2',
      name: 'Product 2',
      description: 'Description of Product 2',
      netPrice: 70.0,
    ),
     Product(
      id: '3',
      name: 'Product 3',
      description: 'Description of Product 3',
      netPrice: 60.0,
    ),
     Product(
      id: '4',
      name: 'Product 4',
      description: 'Description of Product 4',
      netPrice: 30.0,
    ),
     Product(
      id: '5',
      name: 'Product 5',
      description: 'Description of Product 5',
      netPrice: 15.0,
    ),


  ];
});