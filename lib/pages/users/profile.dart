import 'package:aeutna/model/User.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/widgets/button.dart';
import 'package:aeutna/widgets/myTextFieldForm.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  UserM userM;
  Profile({required this.userM});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Déclartions des variables
  bool edit = false;
  RegExp regExp = RegExp(r'''
(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''');
  String? id, nom,prenom, email, genre,facebook, adresse, contact,lieu_naissance, image,numero_carte_aeutna, filiere,image_cin, axes, sympathisant, cin, date_naissance;

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nom = widget.userM.nom;
    prenom = widget.userM.prenom;
    email = widget.userM.email;
    genre = widget.userM.genre;
    adresse = widget.userM.adresse;
    contact = widget.userM.contact;
    image_cin = widget.userM.image_cin;
    image = widget.userM.image;
    numero_carte_aeutna = widget.userM.numero_carte_aeutna;
    filiere = widget.userM.filiere;
    image_cin = widget.userM.image_cin;
    axes = widget.userM.axes;
    sympathisant = widget.userM.sympathisant;
    cin = widget.userM.cin;
    date_naissance = widget.userM.date_naissance;
    lieu_naissance = widget.userM.lieu_naissance;
    facebook = widget.userM.facebook;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        // child:  Container(
        //   width: double.infinity,
        //   padding: EdgeInsets.symmetric(horizontal: 5),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Stack(
        //         children: [
        //           Container(
        //             height: 130,
        //             width: double.infinity,
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 CircleAvatar(
        //                   maxRadius: 65,
        //                   backgroundImage: AssetImage("assets/photo.png"),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           (edit == true)
        //               ? Padding(
        //             padding: EdgeInsets.only(left: 185, top: 80),
        //             child: Card(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(30),
        //               ),
        //               child: CircleAvatar(
        //                 child: Icon(Icons.edit,color: Colors.blueGrey,),
        //                 backgroundColor: Colors.transparent,
        //               ),
        //             ),
        //           )
        //               : Container()
        //         ],
        //       ),
        //       Container(
        //         height: 400,
        //         width: double.infinity,
        //         child: Column(
        //           children: [
        //             Container(
        //                 height: 380,
        //                 padding: EdgeInsets.symmetric(horizontal: 10),
        //                 child: edit == true
        //                     ? Column(
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     MyTextFieldForm(
        //                         edit: true,
        //                         value: "${nom}",
        //                         name: "Nom",
        //                         onChanged: () => (value){
        //                           setState(() {
        //                             nom = value;
        //                           });
        //                         },
        //                         validator: () => (value){
        //                           if(value!.isEmpty){
        //                             return "Veuillez saisir votre nom!";
        //                           }
        //                         },
        //                         iconData: Icons.account_box,
        //                         textInputType: TextInputType.name
        //                     ),
        //                     SizedBox(height: 5,),
        //                     MyTextFieldForm(
        //                         edit: true,
        //                         value: "${prenom}",
        //                         name: "Prénom",
        //                         onChanged: () => (value){
        //                           setState(() {
        //                             prenom = value;
        //                           });
        //                         },
        //                         validator: () => (value){
        //                           if(value!.isEmpty){
        //                             return "Veuillez saisir votre prénom!";
        //                           }
        //                         },
        //                         iconData: Icons.account_box,
        //                         textInputType: TextInputType.name
        //                     ),
        //                     SizedBox(height: 5,),
        //                     MyTextFieldForm(
        //                         edit: true,
        //                         value: "${email}",
        //                         name: "Email",
        //                         onChanged: () => (value){
        //                           setState(() {
        //                             email = value;
        //                           });
        //                         },
        //                         validator: () => (value){
        //                           if(value!.isEmpty){
        //                             return "Veuillez saisir votre email!";
        //                           }else if(!regExp.hasMatch(value!)){
        //                             return "Email invalide!";
        //                           }
        //                         },
        //                         iconData: Icons.email,
        //                         textInputType: TextInputType.emailAddress),
        //                     SizedBox(height: 5,),
        //                     Padding(
        //                       padding: EdgeInsets.symmetric(horizontal: 0,),
        //                       child: Card(
        //                         elevation: 0.2,
        //                         child: Container(
        //                           width: double.infinity,
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               DropdownButtonHideUnderline(
        //                                 child: DropdownButton(
        //                                   borderRadius: BorderRadius.circular(5),
        //                                   hint: Text(" Genre                                                        "),
        //                                   onChanged: (String? value){
        //                                     setState(() {
        //                                       genre = value;
        //                                     });
        //                                   },
        //                                   value: genre,
        //                                   items: [
        //                                     DropdownMenuItem(value: "Homme", child: Row(
        //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                       children: [
        //                                         Icon(Icons.man,color: Colors.blueGrey,),
        //                                         Text("Homme", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),),
        //                                       ],)
        //                                     ),
        //                                     DropdownMenuItem(value: "Femme", child: Row(
        //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                       children: [
        //                                         Icon(Icons.woman,color: Colors.pinkAccent,),
        //                                         Text("Femme", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pinkAccent),),
        //                                       ],)
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),),
        //                     SizedBox(height: 5,),
        //                     MyTextFieldForm(
        //                         edit: true,
        //                         value: "${adresse}",
        //                         name: "Adresse",
        //                         onChanged: () => (value){
        //                           setState(() {
        //                             adresse = value;
        //                           });
        //                         },
        //                         validator: () => (value){
        //                           if(value!.isEmpty){
        //                             return "Veuillez saisir votre adresse";
        //                           }
        //                         },
        //                         iconData: Icons.local_library,
        //                         textInputType: TextInputType.text),
        //                     SizedBox(height: 5,),
        //                     MyTextFieldForm(
        //                         edit: true,
        //                         value: "${contact}",
        //                         name: "Contact",
        //                         onChanged: () => (value){
        //                           setState(() {
        //                             contact = value;
        //                           });
        //                         },
        //                         validator: () => (value){
        //                           if(value!.isEmpty){
        //                             return "Veuillez saisir votre contact!";
        //                           }else if(int.parse(value) < 11){
        //                             return "Votre numéro doit être comporte par 10 chiffres!";
        //                           }
        //                         },
        //                         iconData: Icons.phone,
        //                         textInputType: TextInputType.phone),
        //                   ],
        //                 )
        //                     :  Column(
        //                   children: [
        //                     Card(
        //                       shape: Border(bottom: BorderSide(color: Colors.green, width: 3), top: BorderSide(color: Colors.green, width: 3)),
        //                     ),
        //                     SizedBox(height: 20,),
        //                     _CardText(type: "Nom", value: "${nom}"),
        //                     SizedBox(height: 20,),
        //                     _CardText(type: "Prénom", value: "${prenom}"),
        //                     SizedBox(height: 5,),
        //                     _CardText(type: "Email", value: "${email}"),
        //                     SizedBox(height: 5,),
        //                     _CardText(type: "Genre", value: "${genre}"),
        //                     SizedBox(height: 5,),
        //                     _CardText(type: "Adresse", value: "${adresse}"),
        //                     SizedBox(height: 5,),
        //                     _CardText(type: "Contact", value: "${contact}"),
        //                   ],
        //                 )
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //           width: 325,
        //           child: edit == false
        //               ? Button(
        //             name: "Modifier",
        //             onPressed: () => (){ setState(() {
        //               edit = !edit;
        //             }); print("Modifier profile!");},
        //             color: Colors.green,
        //           )
        //               : Container()
        //       ),
        //     ],
        //   ),
        // ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 1),
          color: Colors.grey,
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: Border(
                bottom: BorderSide(color: Colors.blueGrey, width: 3),
                left: BorderSide(color: Colors.blueGrey, width: 3),
                right: BorderSide(color: Colors.blueGrey, width: 3),
                top: BorderSide(color: Colors.blueGrey, width: 3)),
            child: Column(
              children: [
                SizedBox(height: 25,),
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: AssetImage("assets/photo.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                      Text(" Informations Personnels ", style: style.copyWith(color: Colors.purple, fontSize: 15, fontWeight: FontWeight.bold),),
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        _textTitre(titre: "Nom"),
                        _textValue(value: "${nom}"),
                        _textTitre(titre: "Prénom"),
                        _textValue(value: "${prenom}"),
                        _textTitre(titre: "Date de naissance"),
                        _textValue(value: "${date_naissance ?? "Néant"}"),
                        _textTitre(titre: "Lieu de naissance"),
                        _textValue(value: "${lieu_naissance ?? "Néant"}"),
                        _textTitre(titre: "Genre"),
                        _textValue(value: "${genre ?? "Néant"}"),
                        _textTitre(titre: "CIN"),
                        _textValue(value: "${cin ?? "Néant"}"),
                        _textTitre(titre: "Adresse email"),
                        _textValue(value: "${email ?? "Néant"}"),
                        _textTitre(titre: "Adresse"),
                        _textValue(value: "${adresse ?? "Néant"}"),
                        _textTitre(titre: "Contact"),
                        _textValue(value: "${contact ?? "Néant"}"),
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                      Text(" Informations AEUTNA ", style: style.copyWith(color: Colors.purple, fontSize: 15, fontWeight: FontWeight.bold),),
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      _textTitre(titre: "Numéro carte AEUTNA"),
                      _textValue(value: "${numero_carte_aeutna ?? "Néant"}"),
                      _textTitre(titre: "Filières"),
                      _textValue(value: "${filiere ?? "Néant"}"),
                      _textTitre(titre: "Axes"),
                      _textValue(value: "${axes ?? "Néant"}"),
                      _textTitre(titre: "Sympathisant(e)"),
                      _textValue(value: "${sympathisant ?? "Néant"}"),
                      _textTitre(titre: "Facebook"),
                      _textValue(value: "${facebook ?? "Néant"}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                      Text(" Images C.I.N ", style: style.copyWith(color: Colors.purple, fontSize: 15, fontWeight: FontWeight.bold),),
                      Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(
                  height: 100,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SizedBox(
                    width: double.infinity,
                    child: Button(
                      color: Colors.blueAccent,
                      name: "Modifier",
                      onPressed: () => (){},
                    ),
                  ),
                ),
                SizedBox(height: 5,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TextField({String? name, String? value}){
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        hintText: "${name}",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }

  Padding _textTitre({String? titre}){
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text("${titre}", style: TextStyle(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Row _textValue({String? value}){
    return Row(
        children: [
        Text("${value}", style: style.copyWith(color: Colors.grey, fontSize: 15),),
    ],
    );
  }
}
