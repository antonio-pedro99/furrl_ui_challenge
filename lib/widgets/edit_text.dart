import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({Key? key, this.controller, this.hintText, this.style})
      : super(key: key);

  final String? hintText;
  final TextStyle? style;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 285,
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          readOnly: true,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: InputDecoration(
              fillColor: materialColorFromColor(
                  const Color.fromRGBO(255, 255, 255, 1)),
              filled: true,
              hintText: hintText,
              hintStyle: style,
              labelStyle: style,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(52)))),
        ));
  }
}
