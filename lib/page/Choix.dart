import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChoixPage extends StatefulWidget {
  const ChoixPage({Key? key}) : super(key: key);

  @override
  State<ChoixPage> createState() => _ChoixState();
}

class _ChoixState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/folder.png",),
                fit: BoxFit.cover,
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.3),
                  ]
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget> [
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:<Widget> [
                          MakeItem(image:'assets/images/profil.jpg'),
                          MakeItem(image:'assets/images/profil.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget MakeItem({image,titre}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor('#54DEFC')
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children:<Widget> [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/profil.jpg",),
                      fit: BoxFit.cover,
                    )
                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),
            Text('Patient', style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
            ),


          ],
        ),
      ),
    );

  }
}



