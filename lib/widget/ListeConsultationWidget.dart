import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Consultation.dart';
import 'package:masante/service/Consultation.dart';

class WidgetConsultation extends StatefulWidget {
  //const WidgetDossier({Key? key}) : super(key: key);

  @override
  State<WidgetConsultation> createState() => _WidgetConsultationState();

}

class _WidgetConsultationState extends State<WidgetConsultation> {

/*  List<String> fraiList =[
    "Ordonance ",
    "traitement",
    "Groupe Sangin",
    "Allergie",
    "analyse du sang",
    "Groupe Sangin",
    "Allergie",
    "analyse du sang"
  ];*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ConsultationService().getConsultation(),
        builder: (BuildContext context, AsyncSnapshot<List<ConsultationModele>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'),);
          } else if (snapshot.hasData){
            var data = snapshot.data!;
            print(
                '-------------------------------------data--------------------------');
            print(data[1].toJson());
            return ReorderableListView.builder(
              itemBuilder: ((context, index){
                String consultation = data[index] as String;
                return Card(
                    key: ValueKey(consultation),
                    child:ListTile(
                      title: Text(data[index].description!),
                      leading: Icon(Icons.file_present,color: HexColor('#54DEFC'),
                      ),
                      trailing: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.remove_red_eye,color: HexColor('#EB455F'),),
                      ),

                    )
                );
              }),
              itemCount: data.length,
              onReorder: ((oldIndex, newIndex) => setState(() {
                final index = newIndex;
                final dossier = data.removeAt(oldIndex);
                data.insert(index, dossier);
              })),
            );

          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }) ;
  }
}
