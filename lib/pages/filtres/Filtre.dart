import 'package:aeutna/class/Filtres.dart';
import 'package:flutter/material.dart';

class Filtre extends StatefulWidget {
  const Filtre({Key? key}) : super(key: key);

  @override
  State<Filtre> createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtres"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

    );
  }
}
