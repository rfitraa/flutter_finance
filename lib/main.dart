import 'package:flutter/material.dart';
import 'package:flutter_finance/data/model/add_date.dart';
import 'package:flutter_finance/screen/add.dart';
import 'package:flutter_finance/screen/home.dart';
import 'package:flutter_finance/screen/statistic.dart';
import 'package:flutter_finance/widget/bottomnavigationbar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_finance/screen/splash.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
