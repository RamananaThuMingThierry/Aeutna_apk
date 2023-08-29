import 'package:aeutna/widgets/button.dart';
import 'package:aeutna/widgets/myTextFieldForm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NousContactez extends StatefulWidget {
  const NousContactez({Key? key}) : super(key: key);

  @override
  State<NousContactez> createState() => _NousContactezState();
}

class _NousContactezState extends State<NousContactez> {
  // Déclarations des variables;
  String? nom;
  String? email;
  String? contact;
  String? message;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  RegExp regExp = RegExp(r'''
(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nous Contactez", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child:Form(
            key: _key,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Pseudo
                        MyTextFieldForm(name: "Nom",
                            edit: false,
                            value: "",
                            onChanged: () => (value) => {
                              setState(() {
                                nom = value;
                              })
                            },
                            validator:() => (value){
                              if(value.isEmpty){
                                return "Veuillez saisir votre nom!";
                              }
                            },
                            iconData: Icons.account_box,
                            textInputType: TextInputType.name),
                        // Email
                        MyTextFieldForm(
                            edit: false,
                            value: "",
                            name: "Adresse Email",
                            onChanged: () => (value) => {
                              setState(() {
                                email = value;
                              })
                            },
                            validator: () => (value){
                              if(value == ""){
                                return "Veuillez saisir votre adresse email!";
                              }else if(!regExp.hasMatch(value!)){
                                return "Email invalide!";
                              }
                            },
                            iconData: Icons.email,
                            textInputType: TextInputType.emailAddress),
                        // Contact
                        MyTextFieldForm(
                            edit: false,
                            value: "",
                            name: "Contact",
                            onChanged: () => (value) => {
                              setState(() {
                                contact = value;
                              })
                            },
                            validator: () => (value){
                              if(value == ""){
                                return "Veuillez saisir votre contact!";
                              }else if(value!.length != 10){
                                return "Votre numéro doit-être composé de 10 chiffres!";
                              }
                            },
                            iconData: Icons.phone,
                            textInputType: TextInputType.phone),
                        // Mot de passe
                        TextFormField(
                          onChanged: (value){
                            setState(() {
                              message = value;
                            });
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return "Veuillez saisir votre message!";
                            }
                          },
                          style: TextStyle(color: Colors.blueGrey),
                          decoration: InputDecoration(
                            hintText: "Message",
                            suffixIcon: Icon(Icons.message_outlined),
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            suffixIconColor: Colors.grey,
                            enabledBorder : UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          maxLines: 4,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  //Button
                  Container(
                    width: 325,
                    child: Button(
                        color: Colors.lightBlue,
                        onPressed: () => validation,
                        name: "Envoyer"),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                        Text(" Or ", style: GoogleFonts.roboto(color: Colors.brown, fontSize: 15),),
                        Expanded(child: Divider(color: Colors.blueGrey,thickness: 1,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  //Button
                  Container(
                    width: 325,
                    child: Button(
                        color: Colors.blueGrey,
                        onPressed: () => AppelezNous,
                        name: "Appellez-nous"),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  void validation() async{
    final FormState _formkey = _key!.currentState!;
    if(_formkey.validate()){
      print("Valide");
    }else{
      print("Non");
    }
  }

  void AppelezNous() async {
    final Uri url = Uri(
      scheme: 'tel',
      path: "+261 32 75 637 70"
    );
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      print("${url}");
    }
  }
}
