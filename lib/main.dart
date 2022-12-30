import 'package:flutter/material.dart';
import 'package:qadamv2/screens/admin.dart';
import 'package:qadamv2/screens/login.dart';
import 'package:qadamv2/screens/profile.dart';
import 'package:qadamv2/screens/quiz.dart';
import 'package:qadamv2/screens/signup.dart';
import 'package:qadamv2/screens/welcome.dart';
import 'package:qadamv2/screens/zoom.dart';
import 'package:qadamv2/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

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
        '/profile': (context) => ProfileScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}
