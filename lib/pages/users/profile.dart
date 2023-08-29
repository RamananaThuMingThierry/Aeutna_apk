import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/filtres/Filtre.dart';
import 'package:aeutna/pages/filtres/axes/Andempona.dart';
import 'package:aeutna/pages/filtres/axes/Andrarony.dart';
import 'package:aeutna/pages/filtres/axes/Ankavanana.dart';
import 'package:aeutna/pages/filtres/axes/Ankavia.dart';
import 'package:aeutna/pages/filtres/axes/AntalahaVille.dart';
import 'package:aeutna/pages/filtres/axes/Axes.dart';
import 'package:aeutna/pages/filtres/axes/CapEst.dart';
import 'package:aeutna/pages/messages/chat.dart';
import 'package:aeutna/pages/nousContactez/nousContactez.dart';
import 'package:aeutna/pages/parametres/langue.dart';
import 'package:aeutna/pages/parametres/themes.dart';
import 'package:aeutna/pages/users/UpdatePassword.dart';
import 'package:aeutna/pages/users/modifierUsers.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/utils/functions.dart';
import 'package:aeutna/widgets/WidgetListTitle.dart';
import 'package:aeutna/widgets/button.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:aeutna/widgets/myTextFieldForm.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  final UserM userM;
  Profile({required this.userM});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // Déclartions des variables

  bool edit = false;

  RegExp regExp = RegExp(r'''
(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''');

  String? id, nom,prenom,roles, status, email, genre, niveau, facebook, adresse, contact,lieu_naissance, image,numero_carte_aeutna, filiere,image_cin, axes, sympathisant, cin, date_naissance;
  UserM? data;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    data = widget.userM;
    nom = data!.nom;
    prenom = data!.prenom;
    email = data!.email;
    genre = data!.genre;
    adresse = data!.adresse;
    contact = data!.contact;
    image_cin = data!.image_cin;
    image = data!.image;
    numero_carte_aeutna = data!.numero_carte_aeutna;
    filiere = data!.filiere;
    image_cin = data!.image_cin;
    axes = data!.axes;
    sympathisant = data!.sympathisant;
    cin = data!.cin;
    date_naissance = data!.date_naissance;
    lieu_naissance = data!.lieu_naissance;
    facebook = data!.facebook;
    roles = data!.roles;
    niveau = data!.niveau;
    status = data!.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
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
        // child: Container(
        //   width: double.infinity,
        //   color: Colors.grey,
        //   child: Card(
        //     elevation: 10,
        //     color: Colors.white,
        //     shape: Border(
        //         bottom: BorderSide(color: Colors.blueGrey, width: 3),
        //         left: BorderSide(color: Colors.blueGrey, width: 3),
        //         right: BorderSide(color: Colors.blueGrey, width: 3),
        //         top: BorderSide(color: Colors.blueGrey, width: 3)),
        //     child: Column(
        //       children: [
        //         SizedBox(height: 25,),
        //         Container(
        //           height: 130,
        //           width: double.infinity,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               CircleAvatar(
        //                 maxRadius: 65,
        //                 backgroundImage: AssetImage("assets/photo.png"),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //           child: Row(
        //             children: [
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //               Text(" Informations Personnels ", style: style.copyWith(color: Colors.teal, fontSize: 15, fontWeight: FontWeight.bold),),
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //             padding: EdgeInsets.only(left: 20),
        //             child: Column(
        //               children: [
        //                 _textTitre(titre: "Nom"),
        //                 _textValue(value: "${nom}"),
        //                 _textTitre(titre: "Prénom"),
        //                 _textValue(value: "${prenom}"),
        //                 _textTitre(titre: "Date de naissance"),
        //                 _textValue(value: "${date_naissance ?? "Néant"}"),
        //                 _textTitre(titre: "Lieu de naissance"),
        //                 _textValue(value: "${lieu_naissance ?? "Néant"}"),
        //                 _textTitre(titre: "Genre"),
        //                 _textValue(value: "${genre ?? "Néant"}"),
        //                 _textTitre(titre: "CIN"),
        //                 _textValue(value: "${cin ?? "Néant"}"),
        //                 _textTitre(titre: "Adresse email"),
        //                 _textValue(value: "${email ?? "Néant"}"),
        //                 _textTitre(titre: "Adresse"),
        //                 _textValue(value: "${adresse ?? "Néant"}"),
        //                 _textTitre(titre: "Contact"),
        //                 _textValue(value: "${contact ?? "Néant"}"),
        //               ],
        //             ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //           child: Row(
        //             children: [
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //               Text(" Informations AEUTNA ", style: style.copyWith(color: Colors.teal, fontSize: 15, fontWeight: FontWeight.bold),),
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(left: 20),
        //           child: Column(
        //             children: [
        //               _textTitre(titre: "Numéro carte AEUTNA"),
        //               _textValue(value: "${numero_carte_aeutna ?? "Aucun"}"),
        //               _textTitre(titre: "Filières"),
        //               _textValue(value: "${filiere ?? "Aucun"}"),
        //               _textTitre(titre: "Axes"),
        //               _textValue(value: "${axes ?? "Aucun"}"),
        //               _textTitre(titre: "Sympathisant(e)"),
        //               _textValue(value: "${sympathisant ?? "Aucun"}"),
        //               _textTitre(titre: "Facebook"),
        //               _textValue(value: "${facebook ?? "Aucun"}"),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //           child: Row(
        //             children: [
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //               Text(" Images C.I.N ", style: style.copyWith(color: Colors.teal, fontSize: 15, fontWeight: FontWeight.bold),),
        //               Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 100,
        //           child: Container(
        //             margin: EdgeInsets.symmetric(horizontal: 7),
        //             color: Colors.grey,
        //           ),
        //         ),
        //         SizedBox(height: 5,),
        //         SizedBox(
        //           height: 100,
        //           child: Container(
        //             margin: EdgeInsets.symmetric(horizontal: 7),
        //             color: Colors.grey,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 7),
        //           child: SizedBox(
        //             width: double.infinity,
        //             child: Button(
        //               color: Colors.blueAccent,
        //               name: "Modifier",
        //               onPressed: () => () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => ModifierUsers(userm: data, titre: "Profil",))),
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 5,)
        //       ],
        //     ),
        //   ),
        // ),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Card(
                elevation: 0,
                shape: Border(left: BorderSide(width: 5, color: Colors.blueGrey)),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 145,
                          child: CircleAvatar(
                            maxRadius: 65,
                            backgroundImage: AssetImage("assets/photo.png"),
                          ),
                        ),
                        showInformationPersonnels(nom: nom, prenom: prenom, genre: genre, cin: cin, date_naissance: date_naissance, lieu_naissance: lieu_naissance),
                        showInformationsAEUTNA(numero_carte_aeutna: numero_carte_aeutna, facebook: facebook, filiere: filiere, axes: axes, adresse: adresse, sympathisant: sympathisant)
                      ],
                    ),
                  ),
              ),
              WidgetListTitle(title: "Apropos", leading: Icons.info_outlined, trailing: Icons.chevron_right, onTap: () => () => _apropos(context)),
              WidgetListTitle(title: "Avis", leading: Icons.chat_outlined, trailing: Icons.chevron_right, onTap: () => () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => NousContactez()))),
              FiltreAll(),
              WidgetListTitle(title: "Messages", leading: Icons.message, trailing: Icons.chevron_right, onTap: () => () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Chat()))),
              WidgetListTitle(title: "Paramètres", leading: Icons.settings_outlined, trailing: Icons.chevron_right, onTap: () => () => Parametre(context)),
              WidgetListTitle(title: "Déconnections", leading: Icons.logout_outlined, trailing: Icons.chevron_right, onTap: () => () => deconnectionAlertDialog(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget showInformationPersonnels({String? nom, String? prenom, String? genre, String? cin, String? date_naissance, String? lieu_naissance}){
    return Container(
      color: Colors.white,
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: Colors.blueGrey,
            backgroundColor: Colors.white,
            title:  Text("Information Personnel", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            leading: Icon(Icons.menu, color: Colors.blueGrey,),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              _textTitre(titre: "Nom"),
              _CardText(iconData: Icons.account_box_rounded, value: nom),
              _textTitre(titre: "Prénom"),
              _CardText(iconData: Icons.account_box_rounded, value: prenom),
              _textTitre(titre: "Genre"),
              _CardText(iconData: Icons.person, value: genre),
              _textTitre(titre: "C.I.N"),
              _CardText(iconData: Icons.credit_card_outlined, value: cin),
              _textTitre(titre: "Date de naissance"),
              _CardText(iconData: Icons.calendar_month, value: genre),
              _textTitre(titre: "Lieu de naissance"),
              _CardText(iconData: Icons.location_city, value: genre),
            ]
          ),
      ),
    );
  }

  Widget FiltreAll(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        shape: Border(left: BorderSide(width: 5, color: Colors.blueGrey)),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              iconColor: Colors.blueGrey,
              backgroundColor: Colors.white,
              title:  Text("Filtres", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
              leading: Icon(Icons.pageview_outlined, color: Colors.blueGrey,),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ligne(color: Colors.blueGrey),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                   child: InkWell(
                     onTap: (){
                       FiltresAxesBottomShett(context);
                     },
                     child: Row(
                       children: [
                          RichText(text: TextSpan(children: [
                            WidgetSpan(child: Icon(Icons.local_library, color: Colors.grey,)),
                            TextSpan(text: "         Axes", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
                          ]))
                       ],
                     ),
                   ),
                 ),
                Ligne(color: Colors.blueGrey,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: InkWell(
                    onTap: (){
                     FiltresFilieresBottomShett(context);
                    },
                    child: Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          WidgetSpan(child: Icon(Icons.card_travel, color: Colors.grey,)),
                          TextSpan(text: "         Filières", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
                        ]))
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget showInformationsAEUTNA({String? numero_carte_aeutna, String? facebook, String? axes, String? sympathisant, String? filiere, String? niveau, String? adresse}){
    return Container(
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            backgroundColor: Colors.white,
            title:  Text("Informations AEUTNA", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
            leading: Icon(Icons.menu, color: Colors.blueGrey,),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textTitre(titre: "Numéro carte"),
              _CardText(iconData: Icons.confirmation_num, value: numero_carte_aeutna),
              _textTitre(titre: "Adresse"),
              _CardText(iconData: Icons.location_on, value: adresse),
              _textTitre(titre: "Facebook"),
              _CardText(iconData: Icons.facebook, value: facebook),
              _textTitre(titre: "Axes"),
              _CardText(iconData: Icons.local_library, value: axes),
              _textTitre(titre: "Filières"),
              _CardText(iconData: Icons.medical_information, value: filiere),
              _textTitre(titre: "Niveau"),
              _CardText(iconData: Icons.list_outlined, value: niveau),
              _textTitre(titre: "Sympathisant(e)"),
              _CardText(iconData: Icons.confirmation_num_outlined, value: sympathisant),
            ]
        ),
      ),
    );
  }


  Widget _CardText({IconData? iconData, String? value}){
    return TextFormField(
      enabled: false,
      style: TextStyle(color: Colors.blueGrey),
      onFieldSubmitted: (arg){},
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: "${value}",
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        prefixIcon: Icon(iconData, color: Colors.blueGrey, size: 20,),
      ),
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
    );
  }

  Padding _textTitre({String? titre}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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

  Widget mOption(var icon, var value){
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.white,
          ),
          SizedBox(width: 26,),
          Text("${value}", style: TextStyle(fontSize: 16, color: Colors.white),),
        ],
      ),
    );
  }

  FiltreBottomShett(BuildContext context){
    showModalBottomSheet(context: context,
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        builder: (context){
          return Container(
            height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Filtres", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  Ligne(color: Colors.white),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     TextButton(onPressed: (){
                  //       Navigator.pop(context);
                  //       Navigator.push(context, MaterialPageRoute(builder: (ctx) => FiltresAxes()));
                  //     },
                  //     child: RichText(text: TextSpan(
                  //         children: [
                  //           WidgetSpan(child: Icon(Icons.filter, color: Colors.grey,)),
                  //           TextSpan(text: "                                                                                   Axes", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                  //         ]
                  //     ),)),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     TextButton(onPressed: (){}, child: RichText(text: TextSpan(
                  //         children: [
                  //           WidgetSpan(child: Icon(Icons.card_giftcard_outlined, color: Colors.grey,)),
                  //           TextSpan(text: "                                                                              Filières", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                  //         ]
                  //     ),)),
                  //   ],
                  // ),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                    FiltresAxesBottomShett(context);
                  }, child: mOption(Icons.local_library, "Axes")),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                    FiltresFilieresBottomShett(context);
                  }, child: mOption(Icons.card_travel, "Filières")),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  }, child: mOption(Icons.local_library, "Quarties")),
                ],
              ),
          );
        });
  }

  Parametre(BuildContext context){
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        builder: (ctx){
          return Container(
            height: 200,
            color: Colors.blueGrey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Paramètres", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ],
                ),
                Ligne(color: Colors.white,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.language, color: Colors.white,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Langue()));
                        print("Change la langue");
                      }, child:  Text("Change la langue", style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.collections, color: Colors.white,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Themes()));
                        print("Change le thème");
                      }, child:  Text("Change le thème", style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.password_sharp, color: Colors.white,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => UpdatePassword()));
                      }, child:  Text("Changer le mot de passe", style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.password_sharp, color: Colors.white,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => ModifierUsers(userm: data, titre: "Modifier le profil")));
                      }, child:  Text("Modifier l'utilisateur", style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future _apropos(BuildContext context){
    return showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        backgroundColor: Colors.blueGrey,
        builder: (ctx){
          return Container(
            height: 175,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outlined, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Apropos", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
                Ligne(color: Colors.white,),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RichText(text: TextSpan(children: [
                    WidgetSpan(child: Text("A.E.U.T.N.A", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                    TextSpan(text: "est une Association des Etudiants à l'Université de Tananarivo Natifs d'Antalaha.", style: TextStyle(color: Colors.white,)),
                  ])),
                ),
                Spacer(),
                Ligne(color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Version : 1.25.1", style: TextStyle(color: Colors.white, fontSize: 15),),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        });
  }

  FiltresAxesBottomShett(BuildContext context){
    showModalBottomSheet(context: context,
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        builder: (context){
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Text("Filtres par axes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                Ligne(color: Colors.white),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Andempona()));
                    },
                     child: mOption(Icons.local_library, "Andempona")),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Andrarony()));
                }, child: mOption(Icons.local_library, "Andrarony")),
                InkWell(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ankavia()));
                }, child: mOption(Icons.local_library, "Ankavia")),
                InkWell(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ankavanana()));
                }, child: mOption(Icons.local_library, "Ankavanana")),
                InkWell(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AntalahaVille()));
                }, child: mOption(Icons.local_library, "Antalaha Ville")),
                InkWell(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CapEst()));
                }, child: mOption(Icons.local_library, "Cap-Est")),
              ],
            ),
          );
        });
  }

  FiltresFilieresBottomShett(BuildContext context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        backgroundColor: Colors.transparent,
        builder: (context){
          return DraggableScrollableSheet(
            initialChildSize: .6,
            minChildSize: .2,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blueGrey,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5,),
                      Text("Filtres par filieres", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      Ligne(color: Colors.white),
                      InkWell(onTap: (){ print("Infromatique");}, child: mOption(Icons.local_library, "Informatique")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Tourisme et Hôtelerie")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Anglais")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Français")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Droit")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Gestions")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Economie")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Managment")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Environnement")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Transite et Douane")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Paramède")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Sociologie")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Science Politique")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Malagasy")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Histoire et Géographie")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Mécanicien")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "Commerce et Marketing")),
                      InkWell(onTap: (){}, child: mOption(Icons.card_travel, "BTP")),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
