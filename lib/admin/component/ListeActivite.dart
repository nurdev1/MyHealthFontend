import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';


class ListeActiviteRecente extends StatelessWidget {
  final String? icon;
  final String? nom;
  final String? nombre;
  const ListeActiviteRecente({
    Key? key,this.icon,  this.nom,
    this.nombre
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0,right: 20.0),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50.0,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Image.asset(icon!,width: 20.0,),
      ),
      title: PrimaryText(text: nom!, size: 14.0, fontWeight: FontWeight.w500,),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(text: "successfuly", size: 12.0,color: AppColors.black,),
          PrimaryText(text: nombre!, size: 16.0,color: AppColors.secondarBg,fontWeight: FontWeight.w600,)
        ],
      ),
    );
  }
}

