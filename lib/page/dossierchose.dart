import 'package:flutter/material.dart';
import 'package:masante/AllFile/global/LaisonBankend.dart';

import '../Patient/dossier/AjouterDossier.dart';
import '../Patient/profile/profile_page.dart';
import '../medecin/profile/MedecinProfil.dart';
import '../widget/CategorieDossier.dart';
import '../widget/EntetePage.dart';

class PatientNewT extends StatelessWidget {
//  const PatientNewT({Key? key}) : super(key: key);
  double _headerHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: HexColor("54DEFC"),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: _headerHeight,
                child: EnteteWidhet(_headerHeight, false),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  GestureDetector(
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        "assets/images/user.png",
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientProfilePage()));
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " $nom",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/doc.png',
                                          text: 'Consultation',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AjouterDossierPage())
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/research.png',
                                          text: 'Analyse',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AjouterDossierPage())
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/ana.png',
                                          text: 'Imagérie',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MedecinProfil())
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/examination.png',
                                          text: 'Systhése',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AjouterDossierPage())
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/pro.png',
                                          text: 'Prescription',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AjouterDossierPage())
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: CategorieDossier(
                                          image: 'assets/images/traitement.png',
                                          text: 'Traitement',
                                          color: Colors.white),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AjouterDossierPage())
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
