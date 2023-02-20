import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante/page/Choix.dart';

import '../../admin/common/theme_helper.dart';

import '../../modeles/hopitalModel.dart';
import '../../service/Hopital.dart';
import '../../service/Medecin.dart';
import '../../widget/HeaderWidget.dart';

class InscriptionMedecin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InscriptionMedecin();
  }
}

class _InscriptionMedecin extends State<InscriptionMedecin> {

TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController nomController =TextEditingController();
TextEditingController motdepasseController = TextEditingController();
TextEditingController hopitalController = TextEditingController();
TextEditingController specialiteController = TextEditingController();
TextEditingController villeController = TextEditingController();
TextEditingController adresseController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

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
                                  builder: (context) => ChoixPage()));
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
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: TextFormField(
                            controller: prenomController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Prenom', 'Entrez votre prénom'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: nomController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Nom', 'Entrez votre nom '),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Entrez votre email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
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


