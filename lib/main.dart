import 'package:flutter/material.dart';
import 'package:qadamv2/screens/course.dart';
import 'package:qadamv2/screens/home.dart';
import 'package:qadamv2/screens/login.dart';
import 'package:qadamv2/screens/signup.dart';
import 'package:qadamv2/screens/welcome.dart';
import 'package:qadamv2/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: QadamTheme.themedata(),
      initialRoute: '/home',
      routes: {
        '/welcome':(context)=>WelcomeScreen(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
