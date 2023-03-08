import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedecinInformation extends StatelessWidget {
  const MedecinInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des médecins'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedecinDetail(
                      nom: 'Nom du médecin',
                      prenom: 'Prénom du médecin',
                      email: 'email@medecin.com',
                      telephone: '0123456789',
                      specialite: 'Spécialité du médecin',
                    ),
                  ),
                );
              },
              child: const Text('Médecin 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedecinDetail(
                      nom: 'Nom du médecin',
                      prenom: 'Prénom du médecin',
                      email: 'email@medecin.com',
                      telephone: '0123456789',
                      specialite: 'Spécialité du médecin',
                    ),
                  ),
                );
              },
              child: const Text('Médecin 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class MedecinDetail extends StatelessWidget {
  final String nom;
  final String prenom;
  final String email;
  final String telephone;
  final String specialite;

  const MedecinDetail({
    Key? key,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.specialite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$nom $prenom'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom : $nom',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Prénom : $prenom',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Email : $email',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Téléphone : $telephone',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Spécialité : $specialite',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
