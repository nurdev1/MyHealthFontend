import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../AllFile/style/colors.dart';
import '../../AllFile/style/style.dart';
import '../config/size_config.dart';
import 'package:lottie/lottie.dart';

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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.0,
                offset: Offset(
                  10.0,
                  15.0,
                ),
              )
            ]),
        // child: Image.asset('assets/images/Masante6.png',width: 300,),
        child: Image.network(
            'https://cdn.pixabay.com/animation/2022/12/05/15/23/15-23-06-837_512.gif',
            )
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PrimaryText(
              text: 'Hôpitaux Enregistrer',
              size: 18,
              fontWeight: FontWeight.w800),
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
      contentPadding: EdgeInsets.only(left: 0, right: 20.0),
      visualDensity: VisualDensity.standard,
      leading: Container(
          width: 50.0,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset('images/h.jpg')),
      title: PrimaryText(
        text: 'Hôpital hu Mali',
        size: 15,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: 'Médecins',
            size: 14,
            color: Colors.black,
          ),
          PrimaryText(
            text: '566',
            size: 14,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

/* child:  (Lottie.network("https://assets10.lottiefiles.com/packages/lf20_tutvdkg0.json",
                  animate: true)*/
