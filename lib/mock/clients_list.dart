import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/client.dart';

final clientsListProvider = Provider<List<Client>>((ref) {
  return [
    Client( 
      name: 'John Doe',
      taxId: '123456789',
      address: '123 Main St',
      city: 'New York',
      zipCode: '10001',
      country: 'USA',
      email: ''),
    Client(
      name: 'Jane Smith',
      taxId: '987654321',
      address: '456 Elm St',
      city: 'Los Angeles',
      zipCode: '90001',
      country: 'USA',
      email: ''),
      ];
});

final selectedClientProvider = StateProvider<Client>(
  (ref) => Client(
    name: '',
    taxId: null,
    address: '',
    city: '',
    zipCode: null,
    country: '',
    email: null,
  ),
);
