import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/dossier/AjouterDossier.dart';
import 'package:masante/Patient/PatientListeMedecin.dart';
import 'package:masante/page/DossierList.dart';

import '../../Patient/Connexion/Connexion.dart';
import '../../Patient/inscription/Inscription.dart';
import '../../Patient/home/PatientAccueil.dart';
import '../../Patient/profile/profile_page.dart';
import '../../medecin/profile/MedecinProfil.dart';
import '../../widget/EntetePage.dart';
import '../../widget/ListeDossierWidget.dart';
import '../MotdepasseOublier.dart';
import '../splash/SplashPage.dart';
import '../VerificationMotdepasseOublier.dart';

class DossierAjout extends StatefulWidget {
  const DossierAjout({Key? key}) : super(key: key);

  @override
  State<DossierAjout> createState() => _DossierAjoutState();
}

class _DossierAjoutState extends State<DossierAjout> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 200;
    return Material(
        child: Stack(children: [
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          GestureDetector(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/images/profil.jpg",
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedecinProfil()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Salut Dr Fatoumata",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Liste Dossier Médecal',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#EB455F'))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: HexColor('#54DEFC').withOpacity(0.5),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration:  BoxDecoration(
                            color: HexColor('#54DEFC'),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)
                            ),
                          ),
                          child: Icon(Icons.search),
                        ),
                      )
                  ),
                )
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 500,
              child: WidgetDossier(),
            ),
          ],
        ),
      )
    ]));
  }
}
