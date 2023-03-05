import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminPatientFiltreWidget extends StatelessWidget {
  const AdminPatientFiltreWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //for (int i=0;i<3;i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical:25, horizontal: 25),
              decoration: BoxDecoration(
                color: HexColor("EB455F"),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Specialite( image:"https://assets6.lottiefiles.com/packages/lf20_3xgahwks.json",nom: "",),
            ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(vertical:25, horizontal: 25),
            decoration: BoxDecoration(
              color: HexColor("EB455F"),
              borderRadius: BorderRadius.circular(30),
            ),
            child: etat( image:"https://assets9.lottiefiles.com/packages/lf20_gxh23h82.json",nom: "",),
          ),
        ],
      ),
    );
  }
}

class Specialite extends StatelessWidget {
  const Specialite({
    Key? key,
    required this.image,
    required this.nom,
  }) : super(key: key);

  final String image;
  final String nom;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Lottie.network(image,width: 45,),
        SizedBox(width: 10,),

        //on utiluse une variable pour changer l'icone en fonction
        Text(nom,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white
          ),
        )
      ],
    );
  }
}
class etat extends StatelessWidget {
  const etat({
    Key? key,
    required this.image,
    required this.nom,
  }) : super(key: key);

  final String image;
  final String nom;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Lottie.network(image,width: 55,),
        SizedBox(width: 10,),

        //on utiluse une variable pour changer l'icone en fonction
        Text(nom,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white
          ),
        )
      ],
    );
  }
}