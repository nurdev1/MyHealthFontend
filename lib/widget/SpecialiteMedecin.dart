import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../modeles/Medecin.dart';
import '../service/Medecin.dart';

class SpecialiteMedecinWidget extends StatelessWidget {
  const SpecialiteMedecinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:FutureBuilder(
        future: MedecinService().getMedecinModel(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'),);
          } else if (snapshot.hasData) {
            List<MedecinModel> medecins = snapshot.data!;
            print(
                '-------------------------------------data--------------------------');
           // print(data[1].toJson());

            return Row(
              children: [
               // for (int i=0;i<6;i++)
                for (MedecinModel medecin in medecins)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical:10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: HexColor("54DEFC"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        /*Image.asset(
                  "assets/images/profil.jpg",
                  width: 40, height: 40,),*/
                        Icon(MdiIcons.doctor,
                          color: Colors.white,),
                        //on utiluse une variable pour changer l'icone en fonction
                        Text(medecin.specialite!!,
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
            );


          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
