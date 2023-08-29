import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:flutter/material.dart';

class Informatiques extends StatefulWidget {
  const Informatiques({Key? key}) : super(key: key);

  @override
  State<Informatiques> createState() => _InformatiquesState();
}

class _InformatiquesState extends State<Informatiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informatiques"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey,
      body: DonneesVide(),
    );
  }
}
