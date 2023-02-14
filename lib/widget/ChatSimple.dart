import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
        child: ClipPath(
          clipper:UpperNipMessageClipper(MessageType.receive),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: HexColor("54DEFC").withOpacity(0.8),
            ),
            child: Text("Bonjour Mariam avez vous tous les médicaments?",
            style:  GoogleFonts.roboto(
                textStyle:  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,color:Colors.white)
            ),
            ),
          ),
        ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(padding: EdgeInsets.only(top: 20,left: 80),
            child: ClipPath(
              clipper:LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: HexColor("EB455F").withOpacity(0.8),
                          ),
                child: Text("Bonjour docteur Fatoumata oui ,j'ai besoins d'explication concernant les médicaments.",
                  style:  GoogleFonts.roboto(
                      textStyle:  const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,color:Colors.white)
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
