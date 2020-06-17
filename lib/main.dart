import 'package:fitnessapp/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: ThemeData(
        appBarTheme:AppBarTheme(
          color:Color(0xFF192A56),
        ),
      ),
      
    );
  }
}



