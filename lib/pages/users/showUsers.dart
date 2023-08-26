import 'package:aeutna/model/User.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/widgets/button.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:flutter/material.dart';

class ShowUsers extends StatefulWidget {

  UserM user;
  ShowUsers({required this.user});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apropos"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_box_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: Border(bottom: BorderSide(color: Colors.green, width: 3), top: BorderSide(color: Colors.green, width: 3)),
          elevation: 3,
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
                        Text("${widget.user.nom}", style: style.copyWith(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
              ),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.account_box_rounded, value: "${widget.user.genre ?? "Homme"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.calendar_month, value: "${widget.user.date_naissance ?? "Date de naissance"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.email, value: "${widget.user.email}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.phone, value: "${widget.user.contact}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.location_on_outlined, value: "${widget.user.adresse ?? "Adresse"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.credit_card_outlined, value: "${widget.user.cin ?? "C.I.N"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.local_library, value: "${widget.user.axes ?? "Axes"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.card_travel, value: "${widget.user.filiere ?? "Filière"}"),
              Ligne(color: Colors.grey),
              _info(iconData: Icons.card_giftcard_outlined, value: "${widget.user.sympathisant ?? "Sympathisant(e)"}"),
              Ligne(color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        onPressed: () => (){},
                        name: "Modifier",
                        color: Colors.blue
                    ),
                    Button(
                        onPressed: () => (){},
                        name: "Supprimer",
                        color: Colors.red
                    ),
                  ],
                ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(iconData, color: Colors.green,),
          SizedBox(width: 5,),
          Text("${value}", style: style.copyWith(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
