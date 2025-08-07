import 'package:flutter/material.dart';

class GardenPage extends StatelessWidget {
  const GardenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Binary Bonsai Garden')),
      body: const Center(
        child: Text('Welcome to your digital bonsai garden!'),
      ),
    );
  }
}
