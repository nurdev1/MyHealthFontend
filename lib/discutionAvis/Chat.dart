import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masante/discutionAvis/ChatHome.dart';

import '../widget/ChatBottomSheet.dart';
import '../widget/ChatSimple.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: AppBar(leadingWidth: 30,backgroundColor:  HexColor("54DEFC"),
          title: Row
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            GestureDetector(
              child: Icon(Icons.chevron_left,color: Colors.white,size: 40,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ChatHome()
                )
                );
              },
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset("assets/images/profil.jpg", height: 45, width: 45,),
            ),
          const Padding(padding: EdgeInsets.only(left: 10),
            child: Text(
              "DR Fatoumata",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ],
          ),

          ),

        ),
      ),
      body: ListView(
      padding: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 80),
      children: [
        ChatSample(),
        ChatSample(),
        ChatSample(),
        ChatSample(),
        ChatSample(),
        ChatSample(),
        ChatSample(),
      ],
      ),
      bottomSheet: ChatBottomSheet(),
    );
  }
}
