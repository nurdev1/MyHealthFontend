import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masante/modeles/Hopital.dart';

import 'package:provider/provider.dart';

import '../../AllFile/provider/HopitalProvider.dart';
import 'elev_button.dart';


class AddProductDrawer extends StatefulWidget {
  const AddProductDrawer({Key? key}) : super(key: key);

  @override
  State<AddProductDrawer> createState() => _AddProductDrawerState();
}

class _AddProductDrawerState extends State<AddProductDrawer> {
  late final Hopital _newProduct = Hopital.empty();
  Hopital? _editProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController villeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _editProduct =
          Provider.of<HopitalProvider>(context, listen: false).EditToHopital;
      if (_editProduct != null) {
        nameController = TextEditingController(text: _editProduct!.nom);
        descController = TextEditingController(text: _editProduct!.adresse);
        imageController = TextEditingController(text: _editProduct!.photo);
        villeController =
            TextEditingController(text: _editProduct!.ville);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Text(
              _editProduct == null ? 'Ajouter Hôpital' : 'Modifier Hôpital',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nom"),
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.nom = value;
                } else {
                  _editProduct!.nom = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Adresse'),
              maxLines: 3,
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.adresse = value;
                } else {
                  _editProduct!.adresse = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image '),
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.photo = value;
                } else {
                  _editProduct!.photo = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: villeController,
              decoration: const InputDecoration(labelText: 'Ville '),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.ville;
                } else {
                  _editProduct!.ville ;
                }
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevButton(
                    text: _editProduct == null ? 'Ajouter Product' : 'Modifier',
                    icon: _editProduct == null ? Icons.add : Icons.edit,
                    onPressed: () {
                      if (_editProduct == null) {
                        Provider.of<HopitalProvider>(context, listen: false)
                            .addHopital(_newProduct);
                      } else {
                        Provider.of<HopitalProvider>(context, listen: false)
                            .editHopital(_editProduct!);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                _editProduct != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: ElevButton(
                          text: 'Delete',
                          icon: Icons.delete,
                          color: Colors.red,
                          onPressed: () {
                            Provider.of<HopitalProvider>(context, listen: false)
                                .deleteHopital(_editProduct!);
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
