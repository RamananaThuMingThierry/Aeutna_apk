import 'package:aeutna/class/Drawer.dart';
import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/messages/chat.dart';
import 'package:aeutna/pages/nousContactez/nousContactez.dart';
import 'package:aeutna/pages/parametres/langue.dart';
import 'package:aeutna/pages/parametres/themes.dart';
import 'package:aeutna/pages/publications/AjouterPublication.dart';
import 'package:aeutna/pages/publications/Publication.dart';
import 'package:aeutna/pages/users/membres.dart';
import 'package:aeutna/pages/users/profile.dart';
import 'package:aeutna/pages/users/showUsers.dart';
import 'package:aeutna/services/authservices.dart';
import 'package:aeutna/services/db.dart';
import 'package:aeutna/utils/loading.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:aeutna/widgets/nav_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Déclaration des variables
  UserM? userm;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  AuthServices auth = AuthServices();
  var theme;
  var connectionStatus;
  late InternetConnectionChecker connectionChecker;

  Future<void> getUser() async{
    User? user = await auth.user;
    final userResult = await DbServices().getUser(user!.uid);
    setState(() {
      userm = userResult;
      UserM.current = userResult;
    });
  }

  // Déclarations des variables
  @override
  void initState() {
    super.initState();
    getUser();
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

  // @override
  // Widget build(BuildContext context) {
  //   return (userm == null) ? Container(
  //     color: Colors.white,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SpinKitCircle(
  //           color: Colors.blueGrey,
  //           size: 50,
  //         ),
  //       ],
  //     ),
  //   ) : Scaffold(
  //     key: _key,
  //     backgroundColor: Colors.grey,
  //     appBar: AppBar(
  //       title: Text("Accueil", style: TextStyle(color: Colors.white),),
  //       centerTitle: false,
  //       leading: IconButton(
  //         onPressed: (){
  //           _key.currentState!.openDrawer();
  //         },
  //         icon: Icon(Icons.menu, color: Colors.white,),),
  //       elevation: 1,
  //       automaticallyImplyLeading: false,
  //       backgroundColor: Colors.blueGrey,
  //       actions: [
  //         InkWell(
  //           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Publication())),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(10), // Image border
  //               child: SizedBox.fromSize(
  //                 size: Size.fromRadius(25), // Image radius
  //                 child: Image.asset('assets/logo.jpeg', fit: BoxFit.cover,),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     drawer: ClipPath(
  //       clipBehavior: Clip.antiAliasWithSaveLayer,
  //       clipper: OvalRightBorderClipper(),
  //       child: Drawer(
  //         width: 275.0,
  //         child: ListView(
  //           children: [
  //             UserAccountsDrawerHeader(
  //               currentAccountPicture: CircleAvatar(
  //               backgroundImage: (userm!.image == null) ? Image.asset("assets/logo.jpeg").image : Image.network(userm!.image!).image),
  //               accountName: Text("${userm!.nom ?? "Aucun"}"),
  //               accountEmail: Text("${userm!.email ?? "Aucun"}"),
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/no_image.jpg"),
  //                       fit: BoxFit.cover
  //                   )
  //               ),
  //             ),
  //             navMenu(name: "Accueil", onTap: () => () => _key.currentState!.openEndDrawer(), iconData: Icons.home),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Profile", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (ctx){
  //               return Profile(userM: userm!);
  //             }));}, iconData: Icons.account_box_rounded),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Membres", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (context){
  //               return StreamProvider<List<UserM>>.value(
  //                 child: MembresAEUTNA(),
  //                 value: DbServices().getUsers,
  //                 initialData: [],
  //               );
  //             }));}, iconData: Icons.people),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Apropos", onTap: () => (){ _key.currentState!.openEndDrawer(); aproposFunction(context);}, iconData: Icons.info),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Paramètre", onTap: () => (){ _key.currentState!.openEndDrawer(); _parametre(context);}, iconData: Icons.settings),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Contactez-nous", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (context){
  //               return NousContactez();
  //             }));
  //               }, iconData: Icons.phone),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Message", onTap: () => (){ _key.currentState!.openEndDrawer(); _parametre(context);}, iconData: Icons.message),
  //             Ligne(color: Colors.grey,),
  //             navMenu(name: "Déconnection", onTap: () => (){ _key.currentState!.openEndDrawer(); deconnectionAlertDialog(context);}, iconData: Icons.logout),
  //             Ligne(color: Colors.grey,),
  //           ],
  //         ),
  //       ),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           Container(
  //             child: Card(
  //               shape: Border(),
  //               child: Column(
  //                 children: [
  //                  Row(
  //                    children: [
  //                      Spacer(),
  //                      CircleAvatar(
  //                          backgroundImage: Image.asset("assets/logo.jpeg").image
  //                      ),
  //                      Spacer(),
  //                      Column(
  //                        children: [
  //                          Row(
  //                            children: [
  //                              Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
  //                            ],
  //                          ),
  //                          Row(
  //                            children: [
  //                              Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
  //                            ],
  //                          )
  //                        ],
  //                      ),
  //                      Spacer(flex: 15,),
  //                      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  //                    ],
  //                  ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Container(
  //                     height: 200,
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Row(
  //                     children: [
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
  //                       Spacer(),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(
  //             child: Card(
  //               shape: Border(),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Spacer(),
  //                       CircleAvatar(
  //                           backgroundImage: Image.asset("assets/logo.jpeg").image
  //                       ),
  //                       Spacer(),
  //                       Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       Spacer(flex: 15,),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  //                     ],
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Container(
  //                     height: 200,
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Row(
  //                     children: [
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
  //                       Spacer(),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(
  //             child: Card(
  //               shape: Border(),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Spacer(),
  //                       CircleAvatar(
  //                           backgroundImage: Image.asset("assets/logo.jpeg").image
  //                       ),
  //                       Spacer(),
  //                       Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       Spacer(flex: 15,),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  //                     ],
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Container(
  //                     height: 200,
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Row(
  //                     children: [
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
  //                       Spacer(),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(
  //             child: Card(
  //               shape: Border(),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Spacer(),
  //                       CircleAvatar(
  //                           backgroundImage: Image.asset("assets/logo.jpeg").image
  //                       ),
  //                       Spacer(),
  //                       Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       Spacer(flex: 15,),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  //                     ],
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Container(
  //                     height: 200,
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Row(
  //                     children: [
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
  //                       Spacer(),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(
  //             child: Card(
  //               shape: Border(),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Spacer(),
  //                       CircleAvatar(
  //                           backgroundImage: Image.asset("assets/logo.jpeg").image
  //                       ),
  //                       Spacer(),
  //                       Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Text("Thierry", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15),),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               Text("28 Août 2023", style: TextStyle(color: Colors.grey, fontSize: 12),),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                       Spacer(flex: 15,),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  //                     ],
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Container(
  //                     height: 200,
  //                   ),
  //                   Ligne(color: Colors.blueGrey),
  //                   Row(
  //                     children: [
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.lens_outlined)),
  //                       Spacer(),
  //                       IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> page = [
      Publication(),
      Container(),
      Container(),
      MembresAEUTNA(),
      userm == null
          ?
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: Colors.blueGrey,
              size: 50,
            ),
          ],
        ),
      )
          :
      Profile(userM: userm!),
    ];

    return
    Scaffold(
      key: _key,
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
          if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => Chat()));
            setState(() {
              currentIndex = 0;
            });
          }
          if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => AjouterPublications()));
            setState(() {
              currentIndex = 0;
            });
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Acceuil",
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: "Message",
          ),BottomNavigationBarItem(
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add),
            label: "Publication",
          ),BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              activeIcon: Icon(Icons.people),
              label: "Membres",
              backgroundColor: Colors.white
          ),BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget showMembres({UserM? users, String? nom, String? prenom, String? adresse, String? contact, String? filiere, String? numero_aeutina, String? axes, String? sympathisant, String? image}){
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      color: Colors.white,
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            title:  RichText(text: TextSpan(
                children: [
                  TextSpan(text: "N° : ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20)),
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
              _listePortes(name: "Nom : ",value: "${nom ?? "Aucun"}"),
              _listePortes(name: "Prénom : ",value: "${prenom ?? "Aucun"}"),
              _listePortes(name: "Adresse : ",value: "${adresse ?? "Aucun"}"),
              _listePortes(name: "Contact : ", value: "${contact ?? "Aucun"}"),
              _listePortes(name: "Filière : ", value: "${filiere ?? "Aucun"}"),
              _listePortes(name: "Axes : ", value: "${axes ?? "Aucun"}"),
              _listePortes(name: "Sympathisant(e) : ", value: "${sympathisant ?? "Non"}"),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                    width: .8,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => ShowUsers(user: users!)));
                },
                child: Text("Voir plus", style: TextStyle(color: Colors.blue),),),
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
          style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "${value}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal)),
          ]
      )),
    );
  }
}

