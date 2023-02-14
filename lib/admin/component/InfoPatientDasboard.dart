import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../modeles/Patient.dart';
import '../../responsive.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import '../config/size_config.dart';


class InfoPatientDasboard extends StatelessWidget {
  const InfoPatientDasboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final   ModelPatient nombre;
    return Container(
      constraints: BoxConstraints(minWidth: Responsive.isDesktop(context) ? 200 : SizeConfig.screenWidth!/2 - 40),
      padding: EdgeInsets.only(
        top: 20.0, left: 20.0,
        bottom: 20.0,
        right: Responsive.isDesktop(context) ? 40.0:20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: HexColor('#EB455F'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ Image.asset('images/patients.png',width: 35),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          const PrimaryText(text: "Patient",color: Colors.black,size: 16.0,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          const PrimaryText(text: "9349",fontWeight: FontWeight.w700,size: 18.0,),
        ],

      ),
    );
  }
}
