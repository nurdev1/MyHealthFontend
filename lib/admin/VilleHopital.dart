import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AdminVilleHopitalWidget extends StatelessWidget {
  const AdminVilleHopitalWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i=0;i<2;i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical:30, horizontal: 30),
              decoration: BoxDecoration(
                color: HexColor("EB455F"),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Specialite( image: 'assets/images/city.png',nom: "Bamako",),
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
        Image.asset(image,width: 50,),
        SizedBox(width: 10,),

        //on utiluse une variable pour changer l'icone en fonction
        Text(nom,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white
          ),
        ),
      ],
    );
  }
}
