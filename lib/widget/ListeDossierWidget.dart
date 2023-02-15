import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WidgetDossier extends StatefulWidget {
  //const WidgetDossier({Key? key}) : super(key: key);

  @override
  State<WidgetDossier> createState() => _WidgetDossierState();

}

class _WidgetDossierState extends State<WidgetDossier> {

  List<String> fraiList =[
    "Ordonance ",
    "traitement",
    "Groupe Sangin",
    "Allergie",
    "analyse du sang",
    "Groupe Sangin",
    "Allergie",
    "analyse du sang"
  ];
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
        itemBuilder: ((context, index){
          String dossier = fraiList[index];
          return Card(
            key: ValueKey(dossier),
            child:ListTile(
              title: Text(fraiList[index]),
              leading: Icon(Icons.file_present,color: HexColor('#54DEFC'),
              ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete,color: HexColor('#EB455F'),),
              ),

            )
          );
        }),
      itemCount: fraiList.length,
      onReorder: ((oldIndex, newIndex) => setState(() {
        final index = newIndex;
        final dossier = fraiList.removeAt(oldIndex);
        fraiList.insert(index, dossier);
      })),
    );
  }
}
