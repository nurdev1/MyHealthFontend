import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0,3),
          )
        ]
      ),
      child: Row(children: [
        Padding(padding: EdgeInsets.only(left: 8),
        child: Icon(
          Icons.add,color: HexColor("54DEFC"),size: 30,)
          ,),
        Padding(padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.emoji_emotions_outlined,color: HexColor("54DEFC"),size: 30,)
          ,),
        Padding(padding: EdgeInsets.only(left: 10),
        child: Container(
          alignment: Alignment.centerRight,
          width: 270,
          child: TextField(
            decoration: InputDecoration(
              hintText: "texte",
              border: InputBorder.none
            ),
          ),
        ),
        ),
        Spacer(),
        Padding(padding: EdgeInsets.only(right: 5),
          child: Icon(Icons.send,color: HexColor("54DEFC"),size: 30,)
          ,)
      ],),
    );
  }
}
