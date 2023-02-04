import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/size_config.dart';
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
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
                text: 'Consultation', size: 18, fontWeight: FontWeight.w800),
            PrimaryText(
              text: '02 Janvier 2023',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        const Consultation(),
        const Consultation(),
        const Consultation(),
      ],
    );
  }
}

class Consultation extends StatelessWidget {
  const Consultation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,

      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          /*text: "Medecin",
          size: 14,
          fontWeight: FontWeight.w500),*/
          PrimaryText(
            text: 'Medecin',
            size: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
          PrimaryText(
            text: 'Patient',
            size: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
          PrimaryText(
              text: '4',
              size: 16,
              fontWeight: FontWeight.w600),
        ],
      ),
      onTap: () {
        print('tap');
      },
      selected: true,
    );
  }
}

