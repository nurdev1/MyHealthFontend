import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/medecin/consultation/consultation.dart';
import 'package:masante/modeles/Medecin.dart';
import 'package:masante/modeles/Patient.dart';
import 'package:masante/service/Medecin.dart';
import 'package:masante/service/Patient.dart';


import '../../Patient/MenuPatient.dart';
import '../profile/MedecinProfil.dart';


class MedecinListPatientPage extends StatefulWidget {
  @override
  _MedecinListViewPageState createState() => _MedecinListViewPageState();
}

class _MedecinListViewPageState extends State<MedecinListPatientPage> {



  double _headerHeight =  80;



  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste patient",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          // height: 50,
                          decoration: BoxDecoration(
                            color:HexColor('#EB455F').withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(children: [
                            Icon(Icons.search, size: 40,),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 30,
                              width: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "rechercher"
                                ),
                              ),
                            ),
                          ],
                          ),
                        ),
                        GestureDetector(
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("assets/images/profil.jpg",),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MedecinProfil()
                            )
                            );
                          },
                        ),
                      ],
                    )

                  ],
                ),
              ],
            ),
          )
        ],
      ),
      drawer: PatientMenu(),
      // Main List View With Builder,
      body: Container(child:




    FutureBuilder(
    future: PatientService().getPatientModel(),
    builder: (BuildContext context, AsyncSnapshot<List<ModelPatient>> snapshot) {
    if(snapshot.hasError) {
    return Center(child: Text('Erreur : ${snapshot.error}'),);
    } else if (snapshot.hasData) {
    var data = snapshot.data!;
    print('-------------------------------------data--------------------------');
    print(snapshot.data);
    return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index){
      return Stack(
        children: [

          listePatientClasse(img: data[index].prenom!, title: data[index].nom!, desc: data[index].email!, width: width),

        ],
      );
    });
    }else{
    return const Center(child: CircularProgressIndicator());
    }


    }
        ,),
      ),
    );
  }
}
//late final ModelPatient modelPatient;
class listePatientClasse extends StatelessWidget {


  final String img;
  final String title;
  final String desc;
  final double width;

  const listePatientClasse({
    Key? key,
    required this.img,
    required this.title,
    required this.desc,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


        return GestureDetector(
          onTap: () {
            // This Will Call When User Click On ListView Item
            showDialogFunc(context, img, title, desc);
          },
          // Card Which Holds Layout Of ListView Item
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(img),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        child: Text(
                         desc,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );

  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 350,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('#54DEFC'), // Background color
                  ),
                  onPressed:(){
                 /*   Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Consulation()
                    )
                    );*/
                  },
                  // controllersignin.signIn ,
                    child: Text(
                      'Consultation'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
