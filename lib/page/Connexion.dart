import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/home/PatientNew.dart';
import 'package:masante/modeles/Utilisateur.dart';
import 'package:masante/page/Choix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../Patient/Connexion/Connexion.dart';
import '../common/theme_helper.dart';
import '../medecin/AccueilMedecin.dart';
import '../widget/HeaderWidget.dart';
import 'MotdepasseOublier.dart';

class LoginPageMedecin extends StatefulWidget {
  const LoginPageMedecin({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {



  double _headerHeight =  250;
  Key _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
      children: [
      Container(
      height: _headerHeight,
      child: HeaderWidget(_headerHeight, MdiIcons.login, true),
    ),
        SafeArea(child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: Column(
              children: [
                 Text(
                  'Masante',
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(fontSize: 60,fontWeight: FontWeight.normal)
                  )
                ),
                 Text(
                  'connexion à votre compte',
                   style: GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 25,fontWeight: FontWeight.normal)
                )
                ),
                SizedBox(height: 30.0,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextField(
                            decoration: ThemeHelper().textInputDecoration('Email', 'Entrer votre email'),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration('Mot de passe', 'Entrer votre password'),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,0,10,20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push( context, MaterialPageRoute(
                                  builder: (context) => MotdepasseOublier()), );
                            },
                            child: const Text( "Mot de passe oublier?", style: TextStyle( color: Colors.grey, ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#54DEFC'), // Background color
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('Se connecter'.toUpperCase(), style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            ),
                            onPressed: (){
                              //After successful login we will redirect to profile page. Let's create profile page now
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => PatientFirst()));
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,20,10,20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: "Vous n'avez pas de compte ? "),
                                    TextSpan(
                                      text: 'Inscription',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => ChoixPage()
                                          )
                                          );
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                              )
                          ),
                        ),

                      ],
                    )
                ),
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
