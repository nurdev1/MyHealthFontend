import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../admin/common/theme_helper.dart';
import '../../widget/EntetePage.dart';
import '../profile/profile_page.dart';

class AjouterDossierPage extends StatelessWidget {
  const AjouterDossierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 180;

/*    String? valueChoose;

    List dossierItem =[
      "analyse",
      "consultation",
      "syntése médical",
      "Imagerie"
    ];*/

    // Initial Selected Value
    String dropdownvalue = 'Item 1';

    // List of items in our dropdown menu
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Material(
        child: Stack(
            children: [
              Container(
                height: _headerHeight,
                child: EnteteWidhet(_headerHeight,  false),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.chevron_left,
                                color: Colors.black,
                                size: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  GestureDetector(
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/profil.jpg",),
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PatientProfilePage()
                                      )
                                      );
                                    },
                                  ),
                                ],
                              )

                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                              "Salut Dr Fatoumata",
                              style:  GoogleFonts.openSans(
                                  textStyle:  TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                          ),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                  "Ajouter des information médical",
                                  style:  GoogleFonts.openSans(
                                      textStyle:  TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: HexColor('#EB455F')))
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          SingleChildScrollView(
                            child: Container(
                              width: 250,
                              margin: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  TextField(
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          labelText: 'Nom',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40)))
                                      )
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    // controller: cnom,
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          labelText: 'Description',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40))))),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          //fontWeight: FontWeight.w500,color:Colors.black
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                          labelText: 'Fichier',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(40))))),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Container(

                                      padding: EdgeInsets.only(left: 16,right: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black,width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      child: DropdownButton(
                                        hint: Text('Selectionner un dossier'),
                                        dropdownColor: HexColor('#54DEFC').withOpacity(0.5),
                                        elevation: 5,
                                        // Initial Value
                                        value: dropdownvalue,

                                        // Down Arrow Icon
                                        icon: const Icon(Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: items.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (value) {
                                         /* setState(() {
                                            dropdownvalue = value!;
                                          });*/
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: ThemeHelper().buttonBoxDecoration(context),
                                    child: ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ThemeHelper().buttonStyle(),
                                        child: Container(
                                          width: double.infinity,
                                          //child: Icon(Icons.add,size: 32, ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                            child: Text(
                                                "Ajouter".toUpperCase(),
                                                style:  GoogleFonts.openSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white))
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              )
            ]
        ));

  }
}

