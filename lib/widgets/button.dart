import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.label,
      this.labelColor = Colors.white,
      required this.onPress,
      this.height = 56,
      this.width = 325})
      : super(key: key);

  final double? height;
  final double? width;
  final Color labelColor;
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Text(label,
            style: GoogleFonts.roboto(
              color: labelColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
  }
}
