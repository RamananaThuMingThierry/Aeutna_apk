import 'package:aeutna/model/User.dart';
import 'package:aeutna/utils/functions.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:aeutna/widgets/myInputTextFieldorm.dart';
import 'package:aeutna/widgets/myTextFieldForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModifierUsers extends StatefulWidget {
  UserM? userm;
  String? titre;
  ModifierUsers({required this.userm,required this.titre});

  @override
  State<ModifierUsers> createState() => _ModifierUsersState();
}

class _ModifierUsersState extends State<ModifierUsers> {
  // Déclarations des variables
  String? id, nom,prenom,titre, email, genre, adresse, contact, image,numero_carte_aeutna, filiere,image_cin, axes, sympathisant, cin, date_naissance, lieu_naissance, facebook, roles, status;
  UserM? users;
  int currStep = 0;
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    titre = widget.titre;
    users = widget.userm;
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

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Step>  steps = [
        Step(isActive: currStep == 0,
            title: Text("Informations Personnels"),
            state: StepState.indexed,
            content: Column(
              children: [
                TextTitre(name: "Nom"),
                 MyInputTextFieldForm(
                     name: "Nom",
                     onChanged: () => (value){},
                     validator: () => (value){},
                     iconData: Icons.person,
                     textInputType: TextInputType.text,
                     value: "${nom}"
                 ),
                SizedBox(height: 10,),
                TextTitre(name: "Prénom"),
                MyInputTextFieldForm(
                    name: "Prénom",
                    onChanged: () => (value){},
                    validator: () => (value){},
                    iconData: Icons.person,
                    textInputType: TextInputType.text,
                    value: "${prenom}"
                ),
                SizedBox(height: 10,),
                TextTitre(name: "C.I.N"),
                MyInputTextFieldForm(
                    name: "CIN",
                    onChanged: () => (value){},
                    validator: () => (value){},
                    iconData: Icons.credit_card_outlined,
                    textInputType: TextInputType.text,
                    value: "${cin ?? "Aucun"}"
                ),
              ],
            )),
        Step(isActive: currStep == 1,
          title: Text("Informations AEUTNA"),
          state: StepState.indexed,
          content: Column(
            children: [
              TextTitre(name: "Numéro Carte"),
              MyInputTextFieldForm(
                  name: "Numéro Carte",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.format_list_numbered_outlined,
                  textInputType: TextInputType.number,
                  value: "${numero_carte_aeutna}"
              ),
              SizedBox(height: 10,),
              TextTitre(name: "Axes"),
              MyInputTextFieldForm(
                  name: "Axes",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.location_on,
                  textInputType: TextInputType.text,
                  value: "${axes ?? "Aucun(e)"}"
              ),
              SizedBox(height: 10,),
              TextTitre(name: "Filière"),
              MyInputTextFieldForm(
                  name: "Filière",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.shopping_bag,
                  textInputType: TextInputType.text,
                  value: "${filiere ?? "Aucun"}"
              ),
            ],
          )),
        Step(
            title: Text("Genre,Date et Lieu de naissance"),
            isActive: currStep == 2,
            state: StepState.indexed,
            content: Column(
              children: [
                TextTitre(name: "Genre"),
                Card(
                  elevation: 0,
                  shape: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(5),
                            hint: Text(" Genre                                                 ", style: TextStyle(color: Colors.blueGrey),),
                            onChanged: (String? value){
                              setState(() {
                                genre = value;
                              });
                            },
                            dropdownColor: Colors.white,
                            value: genre,
                            items: [
                              DropdownMenuItem(value: "Homme", child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.man,color: Colors.blueGrey,size: 25,),
                                  Text("     Homme", style: TextStyle(color: Colors.blueGrey),),
                                ],)
                              ),
                              DropdownMenuItem(value: "Femme", child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.woman,color: Colors.pinkAccent,),
                                  Text("     Femme", style: TextStyle(color: Colors.pinkAccent),),
                                ],)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextTitre(name: "Date de naissance"),
                ListTile(
                  shape: Border(bottom: BorderSide(width: 1, color: Colors.blueGrey)),
                  onTap: () => _selectedDate(context),
                  title: Text("Date de naissance", style: TextStyle(color: Colors.blueGrey),),
                  subtitle: Text("${DateFormat.yMEd('fr').format(selectedDate!)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.date_range, color: Colors.teal,),
                    onPressed: () => _selectedDate(context),
                  ),
                ),
                MyInputTextFieldForm(
                    name: "Lieu de naissance",
                    onChanged: () => (value){},
                    validator: () => (value){},
                    iconData: Icons.location_city,
                    textInputType: TextInputType.text,
                    value: "${lieu_naissance ?? "Aucun"}"
                ),
              ],
            )),
        Step(
          title: Text("Contact"),
          isActive: currStep == 3,
          state: StepState.indexed,
          content: Column(
            children: [
              TextTitre(name: "Facebook"),
              MyInputTextFieldForm(
                  name: "Facebook",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.facebook,
                  textInputType: TextInputType.text,
                  value: "${facebook ?? "Aucun"}"
              ),
              SizedBox(height: 10,),
              TextTitre(name: "Contact"),
              MyInputTextFieldForm(
                  name: "Contact",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.phone,
                  textInputType: TextInputType.number,
                  value: "${contact}"
              ),
              SizedBox(height: 10,),
              TextTitre(name: "Email"),
              MyInputTextFieldForm(
                  name: "Email",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.email,
                  textInputType: TextInputType.number,
                  value: "${email}"
              ),
            ],
          )),
        Step(
          title: Text("Adresse"),
          isActive: currStep == 4,
          state: StepState.indexed,
          content: Column(
            children: [
              TextTitre(name: "Adresse"),
              MyInputTextFieldForm(
                  name: "Adresse",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.location_on_outlined,
                  textInputType: TextInputType.text,
                  value: "${adresse ?? "Aucun"}"
              ),
            ],
          )),
        Step(
          title: Text("Accès"),
          isActive: currStep == 5,
          state: StepState.indexed,
          content: Column(
            children: [
              TextTitre(name: "Rôles"),
              Card(
                elevation: 0,
                shape: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(5),
                          hint: Text(" Rôle                                                 ", style: TextStyle(color: Colors.blueGrey),),
                          onChanged: (String? value){
                            setState(() {
                              genre = value;
                            });
                          },
                          dropdownColor: Colors.white,
                          value: genre,
                          items: [
                            DropdownMenuItem(value: "Adminstrateurs", child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.key,color: Colors.blueGrey,size: 25,),
                                Text("     Administrateurs", style: TextStyle(color: Colors.blueGrey),),
                              ],)
                            ),
                            DropdownMenuItem(value: "Utilisateurs", child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.key_off,color: Colors.blueGrey,),
                                Text("     Utilisateurs", style: TextStyle(color: Colors.blueGrey),),
                              ],)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextTitre(name: "Status"),
              MyInputTextFieldForm(
                  name: "Status",
                  onChanged: () => (value){},
                  validator: () => (value){},
                  iconData: Icons.list_alt,
                  textInputType: TextInputType.text,
                  value: "${status ?? "En attente"}"
              ),
            ],
          )),
        Step(
          title: Text("Images"),
          isActive: currStep == 6,
          state: StepState.indexed,
          content: Column(
            children: [

            ],
          )),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Modifier un ${titre}"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.update))
          ],
        ),
        body: Container(
          child: Theme(
            data: ThemeData.light(),
            child: Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              controlsBuilder: (BuildContext context, ControlsDetails controls){
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(onPressed: controls.onStepCancel, child: Text("Annuler")),
                    SizedBox(width: 10,),
                    TextButton(onPressed: controls.onStepContinue, child: Text("Suivant")),
                  ],
                );
              },
              onStepContinue: (){
                setState(() {
                  if(currStep < steps.length - 1){
                    currStep += 1;
                  }else{
                    print("Finish");
                  }
                });
              },
              onStepCancel: (){
                setState(() {
                  if(currStep > 0){
                    currStep -= 1;
                  }else{
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step){
                setState(() {
                  currStep = step;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectedDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        helpText: "Selectionner la data d'ajout",
        initialDate: selectedDate!,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101),
        cancelText: "Annuler",
        confirmText: "Valider",
        fieldLabelText: "Date",
        fieldHintText: "Mois/jour/année",
        errorFormatText: "Entrer la date valide",
        errorInvalidText: "Enter date in valid range",
        builder: (BuildContext context, Widget? child){
          return Theme(data: ThemeData.light(), child: child!);
        }
    );

    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
