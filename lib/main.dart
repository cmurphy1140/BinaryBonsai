import 'package:flutter/material.dart';

import 'pages/garden_page.dart';
import 'theme.dart';

void main() {
  runApp(const BinaryBonsaiApp());
}

class BinaryBonsaiApp extends StatelessWidget {
  const BinaryBonsaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binary Bonsai',
      theme: ZenTheme.lightTheme,
      darkTheme: ZenTheme.darkTheme,
      home: const GardenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}