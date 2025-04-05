import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_app_flutter/models/client.dart';
import 'package:invoice_app_flutter/notifiers/client_notifier.dart';

final clientProvider = NotifierProvider<ClientNotifier, Client>(() {
  return ClientNotifier();
});