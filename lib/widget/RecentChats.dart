import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../discutionAvis/Chat.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Column(
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: Container(
                  height: 65,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          "assets/images/profil.jpg",
                          height: 65,
                          width: 65,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DR Fatoumata",
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor("54DEFC"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Avez-vous tout vos médicament?....",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "20:56",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 23,
                              width: 23,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: HexColor("54DEFC"),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
