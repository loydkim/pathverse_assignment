import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_theme.dart';
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
      theme: appTheme,
      home: const Login(),
    );
  }
}
