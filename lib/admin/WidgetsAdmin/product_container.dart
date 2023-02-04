import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:masante/modeles/Hopital.dart';

class ProductContainer extends StatelessWidget {
  final Hopital hopital;
  const ProductContainer({Key? key, required this.hopital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 210,
          width: 300,
          child: ClipRRect(
            child: Image.network(
              hopital.photo!,
              fit: BoxFit.cover,
              cacheHeight: 300,
              cacheWidth: 300,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          hopital.nom!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          hopital.ville!,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
