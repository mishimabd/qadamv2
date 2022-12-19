import 'package:flutter/material.dart';
import 'package:qadamv2/screens/course.dart';
import 'package:qadamv2/screens/home.dart';
import 'package:qadamv2/screens/login.dart';
import 'package:qadamv2/screens/quiz.dart';
import 'package:qadamv2/screens/result.dart';
import 'package:qadamv2/screens/signup.dart';
import 'package:qadamv2/screens/welcome.dart';
import 'package:qadamv2/screens/zoom.dart';
import 'package:qadamv2/theme.dart';

import 'data/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: QadamTheme.themedata(),
      initialRoute: '/welcome',
      routes: {
        '/welcome':(context)=>WelcomeScreen(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => ZoomScreen(),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}
