import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:furrl_ui_challenge/pages/generate.dart';
import 'package:furrl_ui_challenge/pages/home.dart';
import 'package:furrl_ui_challenge/pages/responsive/register_larger.dart';
import 'package:furrl_ui_challenge/pages/responsive/register_mobile.dart';
import 'package:furrl_ui_challenge/widgets/button.dart';
import 'package:furrl_ui_challenge/widgets/circles.dart';
import 'package:furrl_ui_challenge/widgets/edit_text.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: constraints.maxWidth <= 800 ? const RegisterMobile(): const RegisterLarge()
      );
    });
  }
}
