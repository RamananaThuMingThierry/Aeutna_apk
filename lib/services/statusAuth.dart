import 'package:aeutna/auth/signIn.dart';
import 'package:aeutna/pages/HomePage.dart';
import 'package:aeutna/services/authservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Status extends StatefulWidget{
  @override
  StatusState createState() {
    return StatusState();
  }

}

class StatusState extends State<Status>{
// Déclaration des variables
  User? user;
  AuthServices auth = AuthServices();

  Future<void> getUser() async {
    final userResult = await auth.user;
    setState(() {
      user = userResult;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCircle(
                  color: Colors.blueGrey,
                  size: 50,
                ),
              ],
            ),
          );
        }else{
          if(snapshot.hasData){
            return HomePage();
          }else{
            return Login();
          }
        }
      });
  }
}