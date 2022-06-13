import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:furrl_ui_challenge/services.dart';
import 'package:furrl_ui_challenge/widgets/button.dart';
import 'package:furrl_ui_challenge/widgets/circles.dart';
import 'package:furrl_ui_challenge/widgets/edit_text.dart';
import 'package:google_fonts/google_fonts.dart';

class GenerateMobile extends StatefulWidget {
  const GenerateMobile({Key? key}) : super(key: key);

  @override
  State<GenerateMobile> createState() => _GenerateMobileState();
}

class _GenerateMobileState extends State<GenerateMobile> {
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
    var media = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(
      children: [
        const BackgroundCircles(),
        Positioned(
            left: media.width * 0.05,
            right: media.width * 0.05,
            bottom: media.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Generate ID",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: grey1),
                ),
                const SizedBox(height: 150),
                RoundedButton(
                    label: "Click Me",
                    onPress: () async {
                      var handler = await Services.getID();
                      if (handler.hasData) {
                        String id = handler.data as String;
                        controllerID.text = id.substring(0, id.length - 6);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  (handler.error as String),
                                ))));
                      }
                    }),
                const SizedBox(height: 40),
                EditTextField(
                  controller: controllerID,
                  hintText: "ID will be shown here",
                  style: GoogleFonts.roboto(
                      letterSpacing: .30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: materialColorFromColor(
                          const Color.fromRGBO(215, 215, 215, 1))),
                )
              ],
            )),
      ],
    ));
  }
}
