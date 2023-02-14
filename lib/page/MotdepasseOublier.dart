import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Patient/Connexion/Connexion.dart';
import '../admin/common/theme_helper.dart';
import '../widget/HeaderWidget.dart';
import 'Connexion.dart';
import 'VerificationMotdepasseOublier.dart';

class MotdepasseOublier extends StatefulWidget {
const MotdepasseOublier({Key? key}) : super(key: key);

@override
_MotdepasseOublier createState() => _MotdepasseOublier();
}

class _MotdepasseOublier extends State<MotdepasseOublier> {
  final _formKey = GlobalKey<FormState>();

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
                child: HeaderWidget(_headerHeight, Icons.password_rounded,true),
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
                            Text('Mot de passe oublié?',
                                style: GoogleFonts.openSans(
                                    textStyle:  const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,color:Colors.black87)
                                )
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text("Saisissez l'\adresse e-mail associée à votre compte.",
                              style: GoogleFonts.openSans(
                                  textStyle:  const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,color:Colors.black)
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('Nous vous enverrons un code de vérification par e-mail pour vérifier votre authenticité.',
                                style: GoogleFonts.openSans(
                                    textStyle:  const TextStyle(
                                        fontSize:16,
                                        fontWeight: FontWeight.w500,color:Colors.black38)
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
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration("Email", "Enter your email"),
                                validator: (val){
                                  if(val!.isEmpty){
                                    return "L'e-mail ne peut pas être vide";
                                  }
                                  else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                    return "entrez une adresse e-mail valide";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Envoyer".toUpperCase(),
                                    style:  GoogleFonts.openSans(
                                  textStyle:  const TextStyle(
                                  fontSize: 16,
                                      fontWeight: FontWeight.w500,color:Colors.white)
                                )
                                  ),
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Verification()),
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "N'oubliez pas votre mot de passe? "
                                      ,style: GoogleFonts.openSans(
                                          textStyle:  const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,color:Colors.black)
                                      )
                                  ),
                                  TextSpan(
                                    text: 'Connexion',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {

                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
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
