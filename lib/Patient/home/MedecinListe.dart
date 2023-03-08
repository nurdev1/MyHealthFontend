import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/service/Medecin.dart';

import '../../modeles/Medecin.dart';

class MedecinListe extends StatelessWidget {
  const MedecinListe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: FutureBuilder(
          future: MedecinService().getMedecinModel(),
          builder: ((BuildContext context,
              AsyncSnapshot<List<MedecinModel>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erreur : ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              print(
                  '-------------------------------------data--------------------------');
              print(data[1].toJson());
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 300,
                          width: 200,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F8FF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFF2F8FF),
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      //child: Image.asset("assets/images/docteur${index + 1}.jpg",
                                      child: Image.asset(
                                        "assets/images/me.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].nom!,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("54DEFC")),
                                    ),
                                    Text(
                                      data[index].prenom!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87.withOpacity(0.6),
                                      ),
                                    ),
                                    Text(
                                      data[index].specialite!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
