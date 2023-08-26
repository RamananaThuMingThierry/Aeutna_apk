import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/users/showUsers.dart';
import 'package:aeutna/utils/loading.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class MembresAEUTNA extends StatefulWidget {
  const MembresAEUTNA({Key? key}) : super(key: key);

  @override
  State<MembresAEUTNA> createState() => _MembresAEUTNAState();
}

class _MembresAEUTNAState extends State<MembresAEUTNA> {

  var connectionStatus;
  late InternetConnectionChecker connectionChecker;

  @override
  void initState() {
    super.initState();
    connectionChecker = InternetConnectionChecker();
    connectionChecker.onStatusChange.listen((status) {
      setState(() {
        connectionStatus = status.toString();
      });
      if (connectionStatus ==
          InternetConnectionStatus.disconnected.toString()) {
        Message(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<UserM> users = Provider.of<List<UserM>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Membres"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.people)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
            child: Card(
              shape: Border(),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  onFieldSubmitted: (arg){},
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.account_box_rounded, color: Colors.blueGrey,),
                    hintText: "Recherche",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    prefixIcon: Icon(Icons.search, color: Colors.blueGrey, size: 20,),
                  ),
                  textInputAction: TextInputAction.search,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, i){
                UserM user = users![i];
                String? key = users![i].nom;
                return user == null
                    ?
                      DonneesVide()
                    : showMembres(
                    numero_aeutina: user.numero_carte_aeutna,
                    nom: user.nom,
                    prenom: user.prenom,
                    adresse: user.adresse,
                    contact: user.contact,
                    filiere: user.filiere,
                    axes: user.axes,
                    sympathisant: user.sympathisant,
                    image: user.image
                );
              }),),
        ],
      ),
    );
  }

  Widget showMembres({String? nom, String? prenom, String? adresse, String? contact, String? filiere, String? numero_aeutina, String? axes, String? sympathisant, String? image}){
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            title:  RichText(text: TextSpan(
                children: [
                  TextSpan(text: "N° :", style: TextStyle(color: Colors.green)),
                  TextSpan(text: "${numero_aeutina}", style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold)),
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
              _listePortes(name: "Nom : ",value: "${nom}"),
              _listePortes(name: "Prénom : ",value: "${prenom}"),
              _listePortes(name: "Adresse : ",value: "${adresse}"),
              _listePortes(name: "Contact : ", value: "${contact}"),
              _listePortes(name: "Filière : ", value: "${filiere}"),
            ],
          )
      ),
    );
  }

  Widget _listePortes({String? name, String? value}){
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child:  RichText(text: TextSpan(
          text: "${name}",
          style: TextStyle(color: Colors.blueGrey,),
          children: [
            TextSpan(text: "${value}", style: TextStyle(color: Colors.grey)),
          ]
      )),
    );
  }
}
