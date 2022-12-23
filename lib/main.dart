import 'package:flutter/material.dart';
import 'package:flutter_finance/screen/home.dart';
import 'package:flutter_finance/screen/statistic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Statistic(),
    );
  }
}
