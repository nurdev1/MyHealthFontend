import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:masante/modeles/Medecin.dart';
import 'package:masante/modeles/hopitalModel.dart';
import 'package:masante/service/Hopital.dart';
import 'package:masante/service/Medecin.dart';

import '../../AllFile/global/LaisonBankend.dart';
import '../../admin/common/theme_helper.dart';
import '../../widget/HeaderWidget.dart';
import 'InscriptionMedecin.dart';

//List listes = ["Moussa", "Aliou", "hawa", "Fatoumata"];

class InscriptionMedecin1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InscriptionMedecin1();
  }
}

class _InscriptionMedecin1 extends State<InscriptionMedecin1> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  //HopitalsModel hopitalsModel;
  //String nomPersonne = listes.first;
  String nomHopital='Hopital';
  TextEditingController motdepasseController = TextEditingController();
  TextEditingController hopitalController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController specialiteController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  MedecinService medecinService = MedecinService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 250,
              child: HeaderWidget(250, Icons.person_add_alt_1_rounded, false),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InscriptionMedecin()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
                                  border:
                                  Border.all(width: 5, color: Colors.white),
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
                        const SizedBox(
                          height: 130,
                        ),
                        /*Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: hopitalController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Spécialité", "Entrez votre spécialité"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter un une spécialité";
                              }
                              return null;
                            },
                          ),
                        ),*/
                        Container(
                          child: TextFormField(
                            controller: prenomController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Spécialité", "Entrez votre spécialité"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

                        SizedBox(height: 20.0),

                      FutureBuilder(
                          future: HopitalService().getHopitalModel(),
                          builder: (BuildContext context, AsyncSnapshot<List<HopitalsModel>> snapshot) {
                            if(snapshot.hasError) {
                              return Center(child: Text('Erreur : ${snapshot.error}'),);
                            } else if (snapshot.hasData) {
                              var data = snapshot.data!;
                              print('-------------------------------------data--------------------------');
                              print(snapshot.data);
                              return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index){
                                    return
                                      DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid, color: Colors.amber),
                                          )),
                                      value: data.first,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: data.map((hopital) {
                                        print(hopital.nom);
                                        print(hopital.idhopital);
                                        print(hopital.adresse);
                                        return DropdownMenuItem(
                                            value: hopital,
                                            child: Text(
                                              hopital.nom!,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.amber),
                                            ),
                                        );
                                      }).toList(),
                                      onChanged: (Object? valeur) {
                                        setState(() {

                                          data.first = valeur!.toString() as HopitalsModel;
                                        });
                                      },
                                    );

                                  });
                            }else{
                              return const Text('Hôpitaux');
                            }


                          }
                          ,),

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
                        SizedBox(height: 15.0),
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
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54)),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
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
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "S'inscrire".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String nom = nomController.text;
                                  String prenom = prenomController.text;
                                  String phone = telephoneController.text;
                                  String email = emailController.text;
                                  String hopital =hopitalController.text;
                                  String specialite = specialiteController.text;
                                  String motdepasse = motdepasseController.text;
                                  String retour = await MedecinService.addMedecin(
                                      nom, phone, prenom, email,motdepasse,hopital,specialite);
                                  prenomController.text = '';
                                  emailController.text = '';
                                  telephoneController.text = '';
                                  nomController.text='';
                                  motdepasseController.text='';
                                  prenomController.text='';
                                  specialiteController.text='';
                                  hopitalController.text='';
                                  print(retour);
                                  print("okkkkkkk");
                                }
                              }
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "Ou créez un compte en utilisant les médias sociaux",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Google Plus",
                                          "Vous appuyez sur l'icône sociale GooglePlus.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "Vous appuyez sur l'icône sociale Twitter.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "Vous tapez on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
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
}