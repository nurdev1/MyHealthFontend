import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masante/modeles/Hopital.dart';
import 'package:masante/service/Hopital.dart';
import '../../AllFile/style/colors.dart';
import '../../AllFile/style/style.dart';
import '../../responsive.dart';
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
        height: SizeConfig.blockSizeVertical! * 4,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 15.0,
                offset: Offset(
                  10.0,
                  15.0,
                ),
              )
            ]),
        child: Lottie.network(
          'https://assets1.lottiefiles.com/packages/lf20_tutvdkg0.json',
          width: 180,
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 4,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PrimaryText(
              text: 'Hôpitaux Enregistrer',
              size: 18,
              fontWeight: FontWeight.w800),
          PrimaryText(
            text: ' Mars 2023',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 1,
      ),
      NouveauHopitaux(),
    ]);
  }
}

class NouveauHopitaux extends StatelessWidget {
  const NouveauHopitaux({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*  */
    return FutureBuilder<List<Hopital>>(
      future: HopitalService.NouveauHopitaux(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Hopital>> snapshot) {
        if (snapshot.hasData) {
          List<Hopital> hopitaux = snapshot.data!;
          int startIndex = hopitaux.length >= 3 ? hopitaux.length - 3 : 0;
          print(
              'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
          print(hopitaux);
          int index = 0; // Define and initialize the index variable
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: hopitaux.length >= 3 ? 3 : hopitaux.length,
              itemBuilder: (BuildContext context, int index) {
                int hospitalIndex = startIndex + index;
                Hopital hopital = hopitaux[hospitalIndex];
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
                text: hopitaux[index].nom!!,
                size: 15,
                ),
                subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                PrimaryText(
                text: hopitaux[index].ville!!,
                size: 14,
                color: Colors.black,
                ),
                PrimaryText(
                text: '',
                size: 14,
                color: Colors.black,
                ),
                ],
                ),
                );
              }

        );
        }else if (snapshot.hasError) {
        return Text('${snapshot.error}');
        } else {
        return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

