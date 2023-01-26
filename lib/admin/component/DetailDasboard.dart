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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(30),
            boxShadow: [ BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0,
            offset: const Offset(
              10.0,
              15.0,
            ),
          )
        ]),
        child: Image.asset('assets/images/discussion.png'),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Hôpitaux Enregistrer', size: 18, fontWeight: FontWeight.w800),
          PrimaryText(
            text: '02 Janvier 20213',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      NouveauHopitaux(),
      NouveauHopitaux(),
      NouveauHopitaux()

    ]);
  }
}

class NouveauHopitaux extends StatelessWidget {
  const NouveauHopitaux({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0,right:20.0),
      visualDensity: VisualDensity.standard,
      leading: Container(
          width: 50.0,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset('images/h.jpg')
      ),
      title: PrimaryText(text: 'Hôpital hu Mali',size: 15,),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(text: 'Médecins',size: 14,color: Colors.black,),
          PrimaryText(text: '566',size: 14,color: Colors.black,),
        ],
      ),
    );
  }
}

