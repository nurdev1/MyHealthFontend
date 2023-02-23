import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/service/Medecin.dart';

import '../../AllFile/style/style.dart';
import '../../modeles/Medecin.dart';
import '../../responsive.dart';
import '../config/size_config.dart';
import '../data.dart';

class MedecinNouveau extends StatelessWidget {
  const MedecinNouveau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical: Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context) ? double.infinity: SizeConfig.screenHeight,
        child: FutureBuilder(
          future: MedecinService().getMedecinModel(),
          builder: (BuildContext context, AsyncSnapshot<List<MedecinModel>> snapshot){
            if(snapshot.hasError){
              return Center(child: Text('Erreur: ${snapshot.error}'),);
            }else if(snapshot.hasData){
              var data =snapshot.data!;
              print('-----------------------data------------------');
              print(data[1].toJson());
              return Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: List.generate(transactionHistory.length, (index) =>
                    TableRow(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 10.0,bottom: 10.0,left: 20.0),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundImage:AssetImage('assets/images/profil.jpg'),
                          ),
                        ),
                        Row(
                          children: [
                            PrimaryText(text: data[index].prenom!,size: 16,
                              color: Colors.black87,
                            ),
                            PrimaryText(text: data[index].nom!,size: 16,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        PrimaryText(text: data[index].hopital!.nom!,size: 16,
                          color: Colors.black87,
                        ),PrimaryText(text: data[index].specialite!,size: 16,
                          color: Colors.black87,
                        ),
                        Container(
                          width: 50,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: HexColor('#EB455F').withOpacity(0.5),
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: (){},
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.symmetric(horizontal: 2),
                                      decoration:  BoxDecoration(
                                        color: HexColor('#EB455F'),
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(10)
                                        ),

                                      ),
                                      child: IconButton(
                                        iconSize: 30,
                                        icon: const Icon(Icons.offline_pin_rounded),
                                        onPressed: () {
                                          // ...
                                        },
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                ),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }

          },
        )
      ),
    );
  }
}
