import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/responsive.dart';
import '../../config/size_config.dart';
import '../../style/colors.dart';
import '../../style/style.dart';


class InfoSpecialiteDasboard extends StatelessWidget {
  const InfoSpecialiteDasboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: Responsive.isDesktop(context) ?  150.0:100),
      padding: EdgeInsets.only(
        top: 20.0, left: 20.0,
        bottom: 20.0,
        right: Responsive.isDesktop(context) ? 40.0:20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: HexColor('#54DEFC'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ Image.asset('images/im2.png',width: 50.0,color: Colors.black,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: "Spécialité Médecin",color: Colors.black,size: 16.0,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: "934",fontWeight: FontWeight.w700,size: 18.0,),
        ],

      ),
    );
  }
}


