import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SpecialiteMedecinWidget extends StatelessWidget {
  const SpecialiteMedecinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i=0;i<6;i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical:10, horizontal: 15),
            decoration: BoxDecoration(
              color: HexColor("54DEFC"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                /*Image.asset(
                  "assets/images/profil.jpg",
                  width: 40, height: 40,),*/
                Icon(MdiIcons.doctor,
                color: Colors.white,),
                //on utiluse une variable pour changer l'icone en fonction
                Text("Dentiste",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
