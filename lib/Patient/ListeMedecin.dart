import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ListeMedecin extends StatefulWidget {
 // const ListeMedecin({Key? key}) : super(key: key);

  @override
  State<ListeMedecin> createState() => _ListeMedecinState();
}

class _ListeMedecinState extends State<ListeMedecin> {

  double _headerHeight =  180;


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
    "Dermentologue",
    "Oncologue",
    "Généraliste"
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg",
    "assets/images/profil.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          // App Bar
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
            Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 35,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/profil.jpg"),
            ),
          ],

          title: Text(
            "Liste Medecin",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor:  HexColor("54DEFC"),

        ),
        // Main List View With Builder
        body: ListView.builder(
          itemCount: imgList.length,
          scrollDirection: Axis.horizontal,
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
