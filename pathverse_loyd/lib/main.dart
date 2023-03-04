import 'package:flutter/material.dart';
import 'package:pathverse_loyd/pages/home_landing/home_landing.dart';
import 'package:pathverse_loyd/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathverse Loyd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeLanding(),
    );
  }
}
