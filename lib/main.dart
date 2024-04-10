import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_application/core/theme/theme.dart';
import 'package:flutter_clean_arc_application/features/auth/presentation/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
       theme: AppTheme.darkThemeMode,
      home: const SignUpPage(),
    );
  }
}

