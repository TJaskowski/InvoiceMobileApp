import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/client.dart';

class ClientNotifier extends Notifier<Client> {
  @override
  Client build() {
    return Client(
      name: '',
      taxId: null,
      address: '',
      city: '',
      zipCode: null,
      country: '',
      email: null,
      phone: null,
    );
  }

  void setClient(Client client) {
    state = client;
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }
  void setTaxId(String? taxId) {
    state = state.copyWith(taxId: taxId);
  }

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setCity(String city) {
    state = state.copyWith(city: city);
  }

  void setZipCode(String? zipCode) {
    state = state.copyWith(zipCode: zipCode);
  }

  void setCountry(String country) {
    state = state.copyWith(country: country);
  }

  void setEmail(String? email) {
    state = state.copyWith(email: email);
  }

  void setPhone(String? phone) {
    state = state.copyWith(phone: phone);
  }
}