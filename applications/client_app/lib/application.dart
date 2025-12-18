import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fitness Tracker';
    return MaterialApp.router(
      title: title,
    );
  }
}
