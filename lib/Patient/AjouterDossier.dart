import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masante/modeles/Dossier.dart';

import '../AllFile/repository/Dossier.dart';
import '../common/theme_helper.dart';

class AjouterDossierPage extends StatelessWidget {
  //const AjouterDossier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnom = TextEditingController();
    // final cdesc = TextEditingController();
    // final cpat = TextEditingController();
    // final cdate = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TextField(
                  controller: cnom,
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.w500,color:Colors.black
                    ),
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40))))),
              const SizedBox(
                height: 20,
              ),
              // TextField(
              //     controller: cdesc,
              //     style: GoogleFonts.openSans(
              //       textStyle: const TextStyle(
              //         fontSize: 22,
              //         //fontWeight: FontWeight.w500,color:Colors.black
              //       ),
              //     ),
              //     decoration: const InputDecoration(
              //         labelText: 'Patient',
              //         border: OutlineInputBorder(
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(30))))
              //                 ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                    onPressed: () {
                      final Dossier dossier = Dossier(nom: cnom.text);
                      //, date: cdate.text, patient: cpat.text
                      addDossier(dossier);
                      cnom.text = '';
                      //  cpat.text = '';
                    },
                    style: ThemeHelper().buttonStyle(),
                    child: Container(
                      width: double.infinity,
                      //child: Icon(Icons.add,size: 32, ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          "Ajouter".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
