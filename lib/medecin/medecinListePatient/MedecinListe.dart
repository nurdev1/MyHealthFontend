import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Patient/MenuPatient.dart';
import '../MedecinProfil.dart';

class MedecinListPatientPage extends StatefulWidget {
  @override
  _MedecinListViewPageState createState() => _MedecinListViewPageState();
}

class _MedecinListViewPageState extends State<MedecinListPatientPage> {

  double _headerHeight =  120;
  // Title List Here
  var titleList = [
    "Dr Aminata",
    "Dr Fatoumata",
    "Dr Mariam",
    "Dr Hawa",
    "Dr Sophia",
    "Dr Bintou",
    "Dr Aïchata"
  ];

  // Description List Here
  var descList = [
    "Neurologue",
    "Cardiologue",
    "Pédiatre",
    "Dentiste",
  /*  "Dermentologue",
    "Oncologue",
    "Généraliste"*/
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
  /*  "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg"*/
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        /*  title: Text("Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),*/
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.notifications),
                        GestureDetector(
                          child: const CircleAvatar(
                            radius: 30,
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
      // Main List View With Builder
      body:Stack(
        children: [
          Text('ygukgcbh,vh'),
         SizedBox(height: 24),
         /* Container(
            height: _headerHeight,
            child: EnteteWidhet(_headerHeight,  false),
          ),
          SizedBox(height: 150,),*/
          listePatientClasse(imgList: imgList, titleList: titleList, descList: descList, width: width),

        ],
      )
    );
  }
}

class listePatientClasse extends StatelessWidget {
  const listePatientClasse({
    Key? key,
    required this.imgList,
    required this.titleList,
    required this.descList,
    required this.width,
  }) : super(key: key);

  final List<String> imgList;
  final List<String> titleList;
  final List<String> descList;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // This Will Call When User Click On ListView Item
            showDialogFunc(context, imgList[index], titleList[index], descList[index]);
          },
          // Card Which Holds Layout Of ListView Item
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(imgList[index]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        titleList[index],
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
                          descList[index],
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
      },
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
            height: 320,
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
                SizedBox(
                  height: 10,
                ),
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
              ],
            ),
          ),
        ),
      );
    },
  );
}
