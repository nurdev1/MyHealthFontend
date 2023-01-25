import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MedecinInformation extends StatelessWidget {
  const MedecinInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        children: [
          for(int i=0; i<18;i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical:8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    //child: Image.asset("assets/images/docteur${index + 1}.jpg",
                    child: Image.asset("assets/images/profil.jpg",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text('DR Fatoumata',
                    style: TextStyle(
                      fontSize: 18,
                     // color: HexColor("54DEFC"),
                      color: Colors.black
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(MdiIcons.hospital, color: HexColor("EB455F"),),
                        Text('Hôpital du Mali',
                          style: TextStyle(
                              fontSize: 13,
                              // color: HexColor("54DEFC"),
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                /*Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child:Icon(Icons.add, color: HexColor("54DEFC"),),
                ),*/
              ],
            ),
          )
        ],);
  }
}
