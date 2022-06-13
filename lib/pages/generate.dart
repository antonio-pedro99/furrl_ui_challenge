import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
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
    return Scaffold(
      backgroundColor: grey0,
      body: SafeArea(
        child: Stack(children: [
          const BackgroundCircles(),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
                25, MediaQuery.of(context).size.height * .20, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
            ),
          )
        ]),
      ),
    );
  }
}
