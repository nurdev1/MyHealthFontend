import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/Patient/dossier/AjouterDossier.dart';

class DossierPage extends StatelessWidget {
  const DossierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#54DEFC'),
            title: Text('Gestion des document'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.file_present_rounded,
                    size: 28,
                  ),
                  text: 'Ajouter',
                ),
                Tab(
                  icon: Icon(
                    Icons.file_present,
                    size: 28,
                  ),
                  text: 'Liste',
                ),
                Tab(
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  text: 'Rechercher',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AjouterDossierPage(),
              //const AllDossier(),
              const Center(
                child: Text('Page3'),
              )
            ],
          ),
        ));
  }
}
