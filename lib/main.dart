import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:furrl_ui_challenge/pages/generate.dart';
import 'package:furrl_ui_challenge/pages/home.dart';
import 'package:furrl_ui_challenge/pages/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furrl',
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          primarySwatch: materialColorFromColor(primary),
          backgroundColor: grey0),
      home: const RegisterPage(),
    );
  }
}
