import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/modeles/Dossier.dart';

import '../AllFile/repository/Dossier.dart';


class ListeDossier extends StatefulWidget {
  List<DossierModele> dossiers;
  ListeDossier({super.key, required this.dossiers});

  @override
  State<ListeDossier> createState() => _ListeDossierState();
}

class _ListeDossierState extends State<ListeDossier> {
  @override
  Widget build(BuildContext context) {
    final allDossier = widget.dossiers;
    final _updatename = TextEditingController();
    return ListView.builder(
        itemCount: allDossier.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/profil.jpg'),
                  child:
                      Text(allDossier[index].nom.substring(0, 2).toUpperCase()),
                ),
                title: Text(allDossier[index].nom),
                // subtitle: Text(allDossier[index].patient),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                  'mise en jours: ${allDossier[index].nom}'),
                              content: SingleChildScrollView(
                                child: Container(
                                  height: 250,
                                  child: Column(children: [
                                    TextField(
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.normal)),
                                      decoration: const InputDecoration(
                                          labelText: 'Nom',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      style: GoogleFonts.openSans(
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.normal)),
                                      decoration: const InputDecoration(
                                          labelText: 'Description',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                       /*   // ignore: unused_local_variable
                                          final dossier = DossierModele(
                                              iddossier:
                                                  allDossier[index].iddossier,
                                              nom: _updatename.text);
                                          updateDossier(dossier);*/
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          child: const Text('mise en jour'),
                                        ))
                                  ]),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Annuler');
                                    },
                                    child: const Text('Annuler'))
                              ],
                            ),
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          size: 32,
                          color: HexColor('#54DEFC'),
                        )),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'Voulez-vous vrament supprimer ${allDossier[index].iddossier}?'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            deleteDossier(
                                                allDossier[index].iddossier);
                                            Navigator.pop(context, 'oui');
                                          },
                                          child: const Text('oui')),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Annuler');
                                          },
                                          child: const Text('nom'))
                                    ],
                                  ));
                        },
                        child: Icon(
                          Icons.delete,
                          size: 32,
                          color: HexColor('#54DEFC'),
                        )),
                  ],
                )),
          );
        });
  }
}
