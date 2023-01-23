import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/size_config.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import 'ActionDashboard.dart';

class DetailDasboard extends StatelessWidget {
  const DetailDasboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActionDashboard(),
        Column(
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical! * 5),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(
                      color: AppColors.iconGray,
                      blurRadius: 15.0,
                      offset: const Offset(10.0, 15.0)
                  )]
              ),
              child:  Image.asset('assets/images/profil.jpg',),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(text: "Hôpitaux Enregistrer",
                  size: 18,
                  fontWeight: FontWeight.w800,),
                PrimaryText(
                  text: "Javier 2023",size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,)
                ],
            ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2,
                ),
                Column(
                  children: [
                    PrimaryText(
                      text: "Février 2023",size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,)
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 5,),
            Column(
              //liste
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(text: "Traitement recente",
                  size: 18,
                  fontWeight: FontWeight.w800,),
                PrimaryText(
                  text: "Février 2023",size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,)
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,
            ),
            Column(
              children: [
                //liste
                PrimaryText(
                  text: "Février 2023",size: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,)
              ],
            ),
              ],
            ),

          ],
    );
  }
}

