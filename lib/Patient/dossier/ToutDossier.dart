import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masante/widget/ListeDossier.dart';

import '../modeles/Dossier.dart';

class AllDossier extends StatefulWidget {
  const AllDossier({Key? key}) : super(key: key);

  @override
  State<AllDossier> createState() => _AllDossierState();
}

class _AllDossierState extends State<AllDossier> {
  List<DossierModele> allDossier = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Dossier')
            .orderBy('nom')
            .snapshots(),
        builder: (context, snp) {
          if (snp.hasError) {
            return const Center(
              child: Text('Liste vide'),
            );
          }
          if (snp.hasData) {
            allDossier = snp.data!.docs
                .map((doc) =>
                    DossierModele .fromMap(doc.data() as Map<String, dynamic>))
                .toList();
            return ListeDossier(
              dossiers: allDossier,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
