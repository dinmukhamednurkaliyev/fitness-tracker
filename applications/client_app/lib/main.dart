import 'package:client_app/application.dart';
import 'package:client_app/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const Application());
}
