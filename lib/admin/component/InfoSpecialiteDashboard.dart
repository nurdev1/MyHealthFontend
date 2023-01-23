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
      constraints: BoxConstraints(minWidth: Responsive.isDesktop(context) ?  200.0:160),
      padding: EdgeInsets.only(
        top: 20.0, left: 20.0,
        bottom: 20.0,
        right: Responsive.isDesktop(context) ? 40.0:20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: HexColor('#54DEFC'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Image.asset('images/im2.png',width: 35.0,color: Colors.white,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: "Spécialité Médecin",color: AppColors.secondarBg,size: 16.0,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: "934",fontWeight: FontWeight.w700,size: 18.0,),
        ],

      ),
    );
  }
}


