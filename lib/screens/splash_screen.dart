import 'package:aeutna/services/statusAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 3)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => Status()))
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(250), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(100), // Image radius
                child: Image.asset('assets/logo.jpeg', fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 45,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Divider(color: Color(0xffE2C222),thickness: 1,)),
                Text("A.E.U.T.N.A.", style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),),
                Expanded(child: Divider(color: Color(0xffE2C222),thickness: 1,)),
              ],
            ),
          ),
          SizedBox(height: 30,),
          SpinKitThreeBounce(
            color: Colors.blueGrey,
            size: 30,
          ),
        ],
      ),
    ),
    );
  }
}