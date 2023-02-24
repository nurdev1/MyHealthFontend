import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/home/PatientNew.dart';
import 'package:masante/modeles/Patient.dart';
import 'package:http/http.dart' as http;
import 'package:masante/service/Patient.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:quickalert/quickalert.dart';


import '../../AllFile/showSnackBar.dart';
import '../../admin/common/theme_helper.dart';
import '../../firebase/authServices.dart';
import '../../page/Connexion.dart';
import '../../widget/HeaderWidget.dart';

class Inscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Inscription();
  }
}

class _Inscription extends State<Inscription> {

  bool inLoginProcess = false;

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;


  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController motdepasseController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  late ModelPatient patient;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              child: HeaderWidget(200, Icons.person_add_alt_1_rounded, false),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 60,),
                        Container(
                          child: TextFormField(
                            controller: prenomController,
                            decoration: ThemeHelper().textInputDecoration('Prenom', 'Entrez votre prénom'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: nomController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez nom';
                              }
                              return null;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                'Nom', 'Entrez votre nom '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: usernameController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez utilisateur';
                              }
                              return null;
                            },
                            decoration: ThemeHelper().textInputDecoration(
                                'num utilisateur', 'Entrez votre utilisateur '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Entrez votre email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) && !RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: telephoneController,
                            /*  validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrez numéro de téléphone';
                              }
                              return null;
                            },*/
                            decoration: ThemeHelper().textInputDecoration(
                                "Numéro téléphone",
                                "Entrez votre numéro de téléhone"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Entrez un numéro de téléphone valide";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: motdepasseController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "mot de passe*", "Entrer votre mot de passe"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "s'il vous plait entrez votre mot de passe";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                        "J'accepte tous les termes et conditions.",
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)
                                        )
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .errorColor, fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'Vous devez accepter les termes et conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(
                              context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: Text(
                                  "S'inscrire".toUpperCase(),
                                  style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)
                                  )
                              ),
                            ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String nom = nomController.text;
                                  String prenom = prenomController.text;
                                  String phone = telephoneController.text;
                                  String email = emailController.text;
                                  String password = motdepasseController.text;
                                  String username= usernameController.text;
                                  String retour = await PatientService.addPatient(
                                      nom, phone, prenom, email,password,username);
                                  prenomController.text = '';
                                  emailController.text = '';
                                  telephoneController.text = '';
                                  nomController.text='';
                                  motdepasseController.text='';
                                  prenomController.text='';
                                  usernameController.text='';
                                  print(retour);
                                  print("okkkkkkk");
                               /*   QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Félicitations, votre inscription a été effectuée avec succès !!',
                                  );*/
                                  await Future.delayed(const Duration(milliseconds: 1000));
                                  await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: "Félicitations, votre inscription a été effectuée avec succès !!.",
                                  );
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PatientFirst()
                                  )
                                  );

                                }
                              }

                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                            "Ou créez un compte en utilisant les médias sociaux",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                            )),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /* IconButton(
                              icon: FontAwesomeIcons.googlePlus, size: 35,
                              color: HexColor("#EC2D2F"),
                              onPressed: () {
                                // ...
                              },
                            ),*/
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
                              // onTap: () {
                              //   setState(() {
                              //     showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return ThemeHelper().alartDialog(
                              //             "Google Plus",
                              //             "Vous appuyez sur l'icône sociale GooglePlus.",
                              //             context);
                              //       },
                              //     );
                              //   });
                              // },
                               onTap: () => signIn(context),
                              //onPressed: () => signIn(context),
                            ),
                            const SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
                              ),
                              onTap: () {
                               /* setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "Vous appuyez sur l'icône sociale Twitter.",
                                          context);
                                    },
                                  );
                                });*/
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
                              onTap: () {
                               /* setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "Vous tapez on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });*/
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //google inscription

  Future signIn(BuildContext context) async {
    if (kIsWeb) {
      setState(() {
        inLoginProcess = true;
        AuthService().signInWithGoogle();
      });
    } else {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          setState(() async {
            inLoginProcess = true;
            AuthService().signInWithGoogle();
          });
        }
      } on SocketException catch (_) {
        showNotification(context, 'Aucune connexion internet');
      }
    }
  }





  Widget btn1(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                'Félicitations, votre inscription a été effectuée avec succès !'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
          },
          icon: Icon( // <-- Icon
            Icons.download,
            size: 24.0,
          ),
          label: Text('ok'), // <-- Text
        ),
      ],

    );
  }



  Widget btn2(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                'Désolé, une erreur s\'est produite lors de l\'inscription. Veuillez vérifier vos informations et essayer à nouveau.'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon( // <-- Icon
            Icons.download,
            size: 24.0,
          ),
          label: Text('ok'), // <-- Text
        ),
      ],

    );
  }
}


