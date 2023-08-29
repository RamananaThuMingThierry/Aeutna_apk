import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:flutter/material.dart';

class FiltresFilieres extends StatefulWidget {
  const FiltresFilieres({Key? key}) : super(key: key);

  @override
  State<FiltresFilieres> createState() => _FiltresFilieresState();
}

class _FiltresFilieresState extends State<FiltresFilieres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtre par Filière"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: DonneesVide(),
    );
  }
}
