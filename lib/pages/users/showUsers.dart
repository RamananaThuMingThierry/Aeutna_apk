import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/users/modifierUsers.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/widgets/button.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:aeutna/utils/functions.dart';
import 'package:flutter/material.dart';

class ShowUsers extends StatefulWidget {

  UserM user;
  ShowUsers({required this.user});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {

  UserM? users;
  String? id, nom,prenom, email, genre,niveau, adresse, contact, image,numero_carte_aeutna, filiere,image_cin, axes, sympathisant, cin, date_naissance, lieu_naissance, facebook, roles, status;

  @override
  void initState() {
    users = widget.user;
    id = users!.id;
    nom = users!.nom;
    prenom = users!.prenom;
    email = users!.email;
    genre = users!.genre;
    adresse = users!.adresse;
    contact = users!.contact;
    image = users!.image;
    numero_carte_aeutna = users!.numero_carte_aeutna;
    filiere = users!.filiere;
    image_cin = users!.image_cin;
    axes = users!.axes;
    sympathisant = users!.sympathisant;
    cin = users!.cin;
    date_naissance = users!.date_naissance;
    lieu_naissance = users!.lieu_naissance;
    facebook = users!.facebook;
    roles = users!.roles;
    status = users!.status;
    niveau = users!.niveau;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Information"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_box_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: Border(bottom: BorderSide(color: Colors.blueGrey, width: 2)),
          elevation: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/logo.jpeg"),
                      ),
                    ),
                    Column(
                      children: [
                        Text("${nom}", style: style.copyWith(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Numéro carte AEUTNA"),
              _info(iconData: Icons.format_list_numbered_outlined, value: "${numero_carte_aeutna ?? "Vide"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Nom"),
              _info(iconData: Icons.person, value: "${nom ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Prénom"),
              _info(iconData: Icons.person, value: "${prenom ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Date de naissance"),
              _info(iconData: Icons.calendar_month, value: "${date_naissance ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              TextTitre(name: "Genre"),
              _info(iconData: Icons.account_box_rounded, value: "${genre ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Date de naissance"),
              _info(iconData: Icons.calendar_month, value: "${date_naissance ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Lieu de naissance"),
              _info(iconData: Icons.location_city, value: "${lieu_naissance ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Adresse Email"),
              _info(iconData: Icons.email, value: "${email ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Contact"),
              _info(iconData: Icons.phone, value: "${contact ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Adresse"),
              _info(iconData: Icons.location_on_outlined, value: "${adresse ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Numéro C.I.N"),
              _info(iconData: Icons.credit_card_outlined, value: "${cin ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Facebook"),
              _info(iconData: Icons.facebook, value: "${facebook ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Filières"),
              _info(iconData: Icons.card_travel, value: "${filiere ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Niveau"),
              _info(iconData: Icons.opacity_outlined, value: "${niveau ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Axes"),
              _info(iconData: Icons.local_library, value: "${axes ?? "Aucun"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Sympathisant(e)"),
              _info(iconData: Icons.card_giftcard_outlined, value: "${sympathisant ?? "Non"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Rôles"),
              _info(iconData: roles == "Administrateurs" ? Icons.key: Icons.key_off, value: "${roles ?? "Utilisateurs"}"),
              Ligne(color: Colors.grey),
              SizedBox(height: 5,),
              TextTitre(name: "Status"),
              _info(iconData: Icons.list_alt, value: "${status ?? "En attente"}"),
              Ligne(color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => ModifierUsers(userm: users, titre: "utilisateur",)));
                        },
                        child: RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(child: Icon(Icons.edit, color: Colors.blueGrey,)),
                                TextSpan(text: " Modifiier", style: TextStyle(color: Colors.blueGrey))
                              ]
                          ),
                        )),
                    Text("|", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),),
                    TextButton(
                        onPressed: () => print("Supprimer"),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(child: Icon(Icons.delete, color: Colors.redAccent,)),
                                TextSpan(text: " Supprimer", style: TextStyle(color: Colors.redAccent))
                              ]
                          ),
                        )),
                  ],
                )
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Padding _info({IconData? iconData, String? value}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(iconData, color: Colors.blueGrey,),
          SizedBox(width: 5,),
          Text("${value}", style: style.copyWith(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),),
        ],
      ),
    );
  }
}
