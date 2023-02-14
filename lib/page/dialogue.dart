import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogueTest extends StatelessWidget {
 // const DialogueTest({Key? key}) : super(key: key);

  /* this is the function that handles getting the image from the device
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Les Dialogue')
      ),
      body:Center(
        child: Container(
        padding: EdgeInsets.all(50),
          child: Column(
            children: [
              AnimatedButton(
                  text:"boîte de dialogue d'avertissement",
                  color: Colors.orange,
                  pressEvent: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: 'Avertissement',
                      desc: "description de l'avertissement",
                      btnCancelOnPress: (){},
                      btnOkOnPress: (){},
                    ).show();
                  }
              ),
              SizedBox(height: 16,),
              AnimatedButton(
                  text:"boîte de dialogue d'erreur",
                  color: Colors.red,
                  pressEvent: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: 'erreur',
                      desc: "description de l'avertissement",
                      btnOkOnPress: (){},
                      btnOkIcon: Icons.cancel,
                      btnOkColor: Colors.red
                    ).show();
                  }
              ),
              SizedBox(height: 16,),
              AnimatedButton(
                  text:"boîte de dialogue de question",
                  color: Colors.amber,
                  pressEvent: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      showCloseIcon: true,
                      title: 'question',
                      desc: "description de question",
                     // btnCancelOnPress: (){},
                      btnOkOnPress: (){},
                    ).show();
                  }
              ),
              SizedBox(height: 16,),
              AnimatedButton(
                  text:"boîte de dialogue de succès",
                  color: Colors.green,
                  pressEvent: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: 'succès',
                      desc: "description de succés",
                      btnOkOnPress: (){},
                      btnCancelOnPress: (){},
                    ).show();
                  }
              ),



            ],
          ),
        ),
      )
    );
  }
}
