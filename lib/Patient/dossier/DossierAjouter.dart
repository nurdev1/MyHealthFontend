import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masante/modeles/Patient.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*child: Dialog(
        child: Container(
            height: 320,
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              const Text('Select WiFi Network'),
              const Divider(),
              RadioListTile<ModelPatient>(
                title: const Text('Home WiFi'),
                value: ModelPatient.nom,
                groupValue: _wifi,
                onChanged: (WiFi? value) {
                  setState(() {
                    _wifi = value;
                  });
                },
              ),
              RadioListTile<WiFi>(
                title: const Text('Public WiFi'),
                value: WiFi.public,
                groupValue: _wifi,
                onChanged: (WiFi? value) {
                  setState(() {
                    _wifi = value;
                  });
                },
              ),
              RadioListTile<WiFi>(
                title: const Text('HotSpot WiFi'),
                value: WiFi.hotspot,
                groupValue: _wifi,
                onChanged: (WiFi? value) {
                  setState(() {
                    _wifi = value;
                  });
                },
              ),
              RadioListTile<WiFi>(
                title: const Text('Office WiFi'),
                value: WiFi.office,
                groupValue: _wifi,
                onChanged: (WiFi? value) {
                  setState(() {
                    _wifi = value;
                  });
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('CONNECT'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ])),
      ),*/
    );
  }
}
