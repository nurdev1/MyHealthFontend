import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class ConsultationDateChoseWidget extends StatefulWidget {
  const ConsultationDateChoseWidget({Key? key}) : super(key: key);

  @override
  State<ConsultationDateChoseWidget> createState() => _ConsultationDateChoseWidgetState();
}

class _ConsultationDateChoseWidgetState extends State<ConsultationDateChoseWidget> {
  DateTime? dateChosie;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dateChosie == null ? "": DateFormat('EEE, d MMMM y').format(dateChosie!) ),
         // Text(dateChosie == null ? "Aucune date choisie": DateFormat('EEE, d MMMM y').format(dateChosie!) ),
          //DateFormat('EEE, d MMMM y', 'fr_FR').format(dateChosie!)
          TextButton(onPressed: (){
            showDatePicker(context: context, initialDate: DateTime.now(),
                firstDate: DateTime(2018), lastDate: DateTime.now()).then((value)
            {
              if(value == null) {
                return;
              }
              setState( (){
                dateChosie = value;
              });
            }
            );

          }, child: Text("Choisir une date",style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#54DEFC'))
          ),))
        ],
      ),
    );
  }
}
