import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change le mot de passe"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey,
      body: DonneesVide(),
    );
  }
}
