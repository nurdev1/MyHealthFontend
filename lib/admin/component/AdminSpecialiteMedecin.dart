import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminSpecialiteMedecinWidget extends StatelessWidget {
  const AdminSpecialiteMedecinWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
        // for (int i=0;i<4;i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical:30, horizontal: 35),
              decoration: BoxDecoration(
                color: HexColor("EB455F"),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Specialite( image: 'https://assets3.lottiefiles.com/private_files/lf30_4FGi6N.json',nom: "",),
            )
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
        Lottie.network(image,width: 50,),
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
