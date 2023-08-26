import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Apropos de cette application
void aproposFunction(BuildContext context){
   showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outlined, color: Colors.green,),
                SizedBox(width: 10,),
                Text("Informations", textAlign:TextAlign.center,style: TextStyle(color: Colors.green),),
              ],
            ),
          ),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Ligne(color: Colors.grey,),
                SizedBox(height: 10,),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(text: "A.E.U.T.N.A", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15)),
                          TextSpan(text: "  est une application de gestions des étudiants réside à Antananarivo.", style: TextStyle(color: Colors.blueGrey, fontSize: 15)),
                        ]
                    )),
                Ligne(color: Colors.grey,),
                SizedBox(height: 10,),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(text: "A.E.U.T.N.A : ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15)),
                          TextSpan(text: "Associations des Etudiants à l'Universite de Tananarive Natifs d'Antalaha", style: TextStyle(color: Colors.grey, fontSize: 15)),
                        ]
                    )),
              ],
            ),
          ),
          contentPadding: EdgeInsets.only(top: 2.0, left: 5.0, right: 5.0),
          actions: [
            Ligne(color: Colors.grey,),
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Ferme", style: TextStyle(color: Colors.redAccent),)),
          ],
        );
      });
}

Row info({String? name}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("${name} :", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
    ],
  );
}

Row donnees({String? value}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("${value}", style: TextStyle(color: Colors.grey , fontSize: 15)),
    ],
  );
}

// Alert pour la déconnection
void deconnectionAlertDialog(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: Text("Déconnection", textAlign:TextAlign.center,style: TextStyle(color: Colors.green),),
          content: SizedBox(
            height: 80,
            child: Column(
              children: [
                Ligne(color: Colors.blueGrey,),
                SizedBox(height: 5,),
                Text("Voulez-vous vraiment vous déconnecter?", textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 17),),
                SizedBox(height: 5,),
              ],
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  print("Annuler");
                },
                child: Text("Annuler", style: TextStyle(color: Colors.redAccent),)),
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  onLoading(context);
                }, child: Text("Ok",style: TextStyle(color: Colors.blueGrey),)),
          ],
        );
      });
}

void onLoading(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        Future.delayed(Duration(seconds: 3), () async {
          Navigator.pop(context);
          await FirebaseAuth.instance.signOut();
        });
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 100),
          content: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.green,),
                SizedBox(height: 16,),
                Text("Déconnection...", style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
        );
      });
}