import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';
import 'package:furrl_ui_challenge/pages/generate.dart';
import 'package:furrl_ui_challenge/pages/home.dart';
import 'package:furrl_ui_challenge/widgets/button.dart';
import 'package:furrl_ui_challenge/widgets/circles.dart';
import 'package:furrl_ui_challenge/widgets/edit_text.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
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
                  "Welcome OnBoard!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: grey1),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 220,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: black50,
                        letterSpacing: .30),
                  ),
                ),
                const SizedBox(height: 40),
                EditTextField(
                  hintText: "Enter your name",
                  style: GoogleFonts.roboto(
                      letterSpacing: .30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: grey2),
                ),
                const SizedBox(height: 20),
                EditTextField(
                  hintText: "Enter your e-mail",
                  style: GoogleFonts.roboto(
                      letterSpacing: .30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: grey2),
                ),
                const SizedBox(height: 20),
                EditTextField(
                  hintText: "Enter your password",
                  style: GoogleFonts.roboto(
                      letterSpacing: .30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: grey2),
                ),
                const SizedBox(height: 20),
                EditTextField(
                  hintText: "Confirm your password",
                  style: GoogleFonts.roboto(
                      letterSpacing: .30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: grey2),
                ),
                const SizedBox(height: 40),
                RoundedButton(
                    label: "Sign Up",
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MyHomePage();
                        },
                      ));
                    }),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: black50,
                          letterSpacing: .30),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const KeyPage();
                          },
                        ))
                      },
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: primary,
                            letterSpacing: .30),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
