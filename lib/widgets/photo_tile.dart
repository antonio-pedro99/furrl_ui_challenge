import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/model/photo.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotTile extends StatelessWidget {
  const PhotTile({Key? key, this.photo}) : super(key: key);

  final Photo? photo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(photo!.downloadUrl!),
        Positioned(
            bottom: 20,
            right: 15,
            child: Text(
              photo!.author!,
              style: GoogleFonts.roboto(color: Colors.white),
            ))
      ],
    );
  }
}
