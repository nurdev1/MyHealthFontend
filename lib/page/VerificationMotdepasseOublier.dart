import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../admin/common/theme_helper.dart';
import '../widget/HeaderWidget.dart';
import '../Patient/Profil.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(
                    _headerHeight, Icons.privacy_tip_outlined, true),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Verification',
                                style: GoogleFonts.openSans(
                                    textStyle:  const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,color:Colors.black54)
                                )
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Entrez le code de vérification que nous venons de vous envoyer sur votre adresse e-mail.',
                                style: GoogleFonts.openSans(
                                    textStyle:  const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,color:Colors.black54)
                                )
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            OTPTextField(
                              length: 4,
                              width: 300,
                              fieldWidth: 50,
                              style: const TextStyle(
                                  fontSize: 30
                              ),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onCompleted: (pin) {
                                setState(() {
                                  _pinSuccess = true;
                                });
                              },
                            ),
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Si vous n'avez pas reçu de code! ",
                                      style: GoogleFonts.openSans(
                                          textStyle:  const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,color:Colors.black)
                                      )
                                  ),
                                  TextSpan(
                                    text: 'Renvoyer',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ThemeHelper().alartDialog("Connexion succès",
                                                "Code de vérification renvoyé avec succès.",
                                                context);
                                          },
                                        );
                                      },
                                      style: GoogleFonts.openSans(
                                          textStyle:   TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor('EB455F'))
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: _pinSuccess ? ThemeHelper().buttonBoxDecoration(context):ThemeHelper().buttonBoxDecoration(context, "#AAAAAA","#757575"),
                              child: ElevatedButton(
                                style:  ElevatedButton.styleFrom(
                                  primary: HexColor('#54DEFC'),
                                  textStyle: const TextStyle(fontSize: 25),
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Verifier".toUpperCase(),
                                      style: GoogleFonts.openSans(
                                          textStyle:  const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,color:Colors.white)
                                      )
                                  ),
                                ),
                                onPressed: _pinSuccess ? () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => Profil()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                } : null,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
