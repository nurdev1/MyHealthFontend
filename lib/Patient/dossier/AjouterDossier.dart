import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../AllFile/global/LaisonBankend.dart';
import '../../admin/common/theme_helper.dart';
import '../../page/DossierList.dart';
import '../../service/Dossier.dart';
import '../../widget/EntetePage.dart';
import '../profile/profile_page.dart';

class AjouterDossierPage extends StatefulWidget {
  const AjouterDossierPage({Key? key}) : super(key: key);

  @override
  State<AjouterDossierPage> createState() => _AjouterDossierPageState();
}

class _AjouterDossierPageState extends State<AjouterDossierPage> {
  TextEditingController nomCrontroller = TextEditingController();
  TextEditingController descriptionCrontroller = TextEditingController();
  TextEditingController patientCrontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 180;
    String _fichier = '';

    return Material(
        child: Stack(
            children: [
              Container(
                height: _headerHeight,
                child: EnteteWidhet(_headerHeight,  false),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  GestureDetector(
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/user.png",),
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PatientProfilePage()
                                      )
                                      );
                                    },
                                  ),
                                ],
                              )

                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                              "$nomUser",
                              style:  GoogleFonts.openSans(
                                  textStyle:  TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                          ),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                  "  information médical numérique",
                                  style:  GoogleFonts.openSans(
                                      textStyle:  TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: HexColor('#EB455F')))
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          SingleChildScrollView(
                            child: Container(
                              width: 250,
                              margin: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  TextField(
                                      controller: nomCrontroller,
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          labelText: 'Nom',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40)))
                                      )
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                      controller: descriptionCrontroller,
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          labelText: 'Description',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40))))),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  /*TextField(
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.upload),
                                          labelText: 'Fichier',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40))))),*/
                                  TextButton(
                                    onPressed: () async {
                                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        File file = File(result.files.single.path!);
                                        setState(() {
                                          _fichier = file.path;
                                        });
                                      }
                                    },
                                    child: Text('Sélectionner un fichier'),
                                  ),


                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: ThemeHelper().buttonBoxDecoration(context),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          String nom = nomCrontroller.text;
                                          String description = descriptionCrontroller.text;

                                          String retour = await DossierService.addDossier(nom,  description);
                                          nomCrontroller.text = '';
                                          descriptionCrontroller.text = '';
                                          // nomController.text='';
                                          print(retour);
                                          print("okkkkkkk");
                                          await Future.delayed(const Duration(milliseconds: 1000));
                                          await QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.success,
                                            text: " dossier creer avec succès !!.",
                                          );
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => DossierList()
                                          )
                                          );
                                        },
                                        style:  ElevatedButton.styleFrom(
                                          primary: HexColor('#54DEFC'),
                                          textStyle: const TextStyle(fontSize: 25),
                                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          //child: Icon(Icons.add,size: 32, ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                            child: Text(
                                                "Ajouter".toUpperCase(),
                                                style:  GoogleFonts.openSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white))
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              )
            ]
        ));

  }
}
