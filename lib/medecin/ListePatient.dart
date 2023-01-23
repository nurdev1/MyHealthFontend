import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PatientListePage.dart';

class ListePatientPage extends StatelessWidget {
  const ListePatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientListePage(),
    );
  }
}
