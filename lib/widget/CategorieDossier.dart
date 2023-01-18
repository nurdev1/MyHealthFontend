import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CategorieDossier extends StatelessWidget {
  String image;
  String text;
  Color color;
  CategorieDossier({Key? key,required this.image,required  this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Container(height: 170,width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HexColor('#54DEFC'),
          ),
          child: Column(children: [
            ClipRRect(
              //borderRadius: BorderRadius.circular(45),
              child: Image.asset(image,
                width: 90,height: 90,),
            ),
            SizedBox(height: 10,),
            Text(text,style: TextStyle(color: color,fontSize: 18),)
          ]
          ),
        ),
        onTap: (){},
      ),
    );
  }
}
