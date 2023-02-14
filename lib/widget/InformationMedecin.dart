import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Medecin.dart';
import 'package:masante/service/Medecin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MedecinInformation extends StatelessWidget {
  const MedecinInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
          future: MedecinService().getMedecinModel(),
          builder:
              (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'),);
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              print(
                  '-------------------------------------data--------------------------');
              print(data[1].toJson());

              return Wrap(
                direction: Axis.horizontal,

                children: data.map((medecin){
                  return    Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          //child: Image.asset("assets/images/docteur${index + 1}.jpg",
                          child: Image.asset("assets/images/profil.jpg",
                            // child: Image.asset(data[index].photo,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        //child: Text('DR Fatoumata',
                        child: Text(medecin.nom!,

                          //  child: Text(myProducts[index]["name"]),
                          style: TextStyle(
                              fontSize: 18,
                              // color: HexColor("54DEFC"),
                              color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        //child: Text('DR Fatoumata',
                        child: Text(medecin.specialite!,

                          //  child: Text(myProducts[index]["name"]),
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
                              Text(medecin.hopital!.nom!,
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
                    ],
                  );

                }).toList(),
              );

              // return GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //         maxCrossAxisExtent: 200,
              //         childAspectRatio: 3 / 2,
              //         crossAxisSpacing: 20,
              //         mainAxisSpacing: 20),
              //     itemCount: data.length,
              //     itemBuilder: (BuildContext ctx, index) {
              //
              //     });

            }else{
            return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
