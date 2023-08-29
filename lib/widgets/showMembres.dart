import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/users/showUsers.dart';
import 'package:aeutna/utils/functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowMembres extends StatefulWidget {
  UserM userM;
  ShowMembres({
    required this.userM
  });

  @override
  State<ShowMembres> createState() => _ShowMembresState();
}

class _ShowMembresState extends State<ShowMembres> {
  String? nom, prenom, adresse, contact, filiere, niveau, numero_aeutna, axes, sympathisant, image;
  UserM? data;
  @override
  void initState() {
    data = widget!.userM;
    nom = data!.nom;
    prenom = data!.prenom;
    adresse = data!.adresse;
    contact = data!.contact;
    filiere = data!.filiere;
    niveau = data!.niveau;
    numero_aeutna = data!.numero_carte_aeutna;
    axes = data!.axes;
    sympathisant = data!.sympathisant;
    image= data!.image;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.userM);
    return data == null ? CircularProgressIndicator() : Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      color: Colors.white,
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            title:  RichText(text: TextSpan(
                children: [
                  TextSpan(text: "N° : ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20)),
                  TextSpan(text: "${numero_aeutna}", style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold)),
                ]
            )),
            leading: (image == null)
                ?  CircleAvatar(
              foregroundColor: Colors.green, radius: 20.0,
              backgroundImage: Image.asset("assets/logo.jpeg").image,
            )
                :  CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  CachedNetworkImage(
                  imageUrl: image!,
                  placeholder: (context, url) => CircularProgressIndicator(), // Widget de chargement affiché pendant le chargement de l'image
                  errorWidget: (context, url, error) => Icon(Icons.error), // Widget d'erreur affiché si l'image ne peut pas être chargée
                ),
              ),
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: EdgeInsets.only(right: 80,bottom: 20),
            children: [
              listePortes(name: "Nom : ",value: "${nom ?? "Aucun"}"),
              listePortes(name: "Prénom : ",value: "${prenom ?? "Aucun"}"),
              listePortes(name: "Adresse : ",value: "${adresse ?? "Aucun"}"),
              listePortes(name: "Contact : ", value: "${contact ?? "Aucun"}"),
              listePortes(name: "Filière : ", value: "${filiere ?? "Aucun"}"),
              listePortes(name: "Niveau : ", value: "${niveau ?? "Aucun"}"),
              listePortes(name: "Axes : ", value: "${axes ?? "Aucun"}"),
              listePortes(name: "Sympathisant(e) : ", value: "${sympathisant ?? "Non"}"),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                    width: .8,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => ShowUsers(user: widget.userM!)));
                },
                child: Text("Voir plus", style: TextStyle(color: Colors.blue),),),
            ],
          )
      ),
    );
  }
}
