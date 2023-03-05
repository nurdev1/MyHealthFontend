import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Medecin.dart';
import 'package:masante/service/Hopital.dart';
import 'package:masante/service/Medecin.dart';

import '../../AllFile/style/style.dart';
import '../../responsive.dart';

import '../config/size_config.dart';

class InfoMedecin extends StatelessWidget {
  const InfoMedecin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MedecinModel>>(
      future: MedecinService.getAllMedecin(),
      builder:
          (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
        if (snapshot.hasData) {
          var liste = snapshot.data as List<MedecinModel>;
          var compte =liste.length;
          return Container(
            constraints: BoxConstraints(
                minWidth: Responsive.isDesktop(context)
                    ? 200
                    : SizeConfig.screenWidth! / 2 - 40),
            padding: EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              bottom: 20.0,
              right: Responsive.isDesktop(context) ? 40.0 : 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: HexColor('#EB455F'),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/medecin.png', width: 35),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                const PrimaryText(
                  text: "Médecins",
                  color: Colors.black,
                  size: 16.0,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                 PrimaryText(
                  text: "$compte",
                  fontWeight: FontWeight.w700,
                  size: 18.0,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
