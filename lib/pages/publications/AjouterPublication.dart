import 'package:flutter/material.dart';

class AjouterPublications extends StatefulWidget {
  const AjouterPublications({Key? key}) : super(key: key);

  @override
  State<AjouterPublications> createState() => _AjouterPublicationsState();
}

class _AjouterPublicationsState extends State<AjouterPublications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Ajouter une publication"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),
    );
  }
}
