import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/home/PatientAccueil.dart';
import 'package:masante/page/Choix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../admin/common/theme_helper.dart';
import '../../page/MotdepasseOublier.dart';
import '../../widget/HeaderWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  /*final SignInController controllerpassword = Get.find<SignInController>();
  final SignInController controllerusername = Get.find<SignInController>();
  final SignInController controllersignin = Get.find<SignInController>();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, MdiIcons.login, true),
            ),
            SafeArea(
                child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                child: Column(
                  children: [
                    Text('Masante',
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold))),
                    Text('Connexion à votre compte',
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.normal))),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                               // controller: controllerusername.usernameController,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Email', 'Entrer votre nom utiliseteur'),

                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                              //  controller: controllerpassword.passwordController,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Mot de passe', 'Entrer votre password'),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MotdepasseOublier()),
                                  );
                                },
                                child: Text("Mot de passe oublier?",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor('EB455F')))),
                              ),
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                onPressed:(){},
                               // controllersignin.signIn ,
                                child: Padding(
                                  padding:
                                       const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Se connecter'.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Vous n'avez pas de compte ? ",
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal))),
                                TextSpan(
                                    text: 'Inscription',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChoixPage()));
                                      },
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor('54DEFC'))))
                              ])),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
