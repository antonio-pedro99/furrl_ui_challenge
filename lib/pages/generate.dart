import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:furrl_ui_challenge/pages/responsive/generate_mobile.dart';
import 'package:furrl_ui_challenge/response.dart';
import 'package:furrl_ui_challenge/services.dart';
import 'package:furrl_ui_challenge/widgets/button.dart';
import 'package:furrl_ui_challenge/widgets/circles.dart';
import 'package:furrl_ui_challenge/widgets/edit_text.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  late TextEditingController controllerID;

  @override
  void initState() {
    controllerID = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerID.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: constraints.maxWidth <= 800
              ? const GenerateMobile()
              : Container());
    });
  }
}
