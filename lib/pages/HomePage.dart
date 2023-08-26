import 'package:aeutna/class/Drawer.dart';
import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/nousContactez/nousContactez.dart';
import 'package:aeutna/pages/parametres/langue.dart';
import 'package:aeutna/pages/parametres/themes.dart';
import 'package:aeutna/pages/users/membres.dart';
import 'package:aeutna/pages/users/profile.dart';
import 'package:aeutna/services/authservices.dart';
import 'package:aeutna/services/db.dart';
import 'package:aeutna/utils/functions.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:aeutna/widgets/nav_menu.dart';
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

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return (userm == null) ? Container(
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
    ) : Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Accueil", style: TextStyle(color: Colors.white),),
        centerTitle: false,
        leading: IconButton(
          onPressed: (){
            _key.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white,),),
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(25), // Image radius
                child: Image.asset('assets/logo.jpeg', fit: BoxFit.cover,),
              ),
            ),
          ),
        ],
      ),
      drawer: ClipPath(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        clipper: OvalRightBorderClipper(),
        child: Drawer(
          width: 275.0,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                backgroundImage: (userm!.image == null) ? Image.asset("assets/logo.jpeg").image : Image.network(userm!.image!).image),
                accountName: Text("${userm!.nom ?? "Aucun"}"),
                accountEmail: Text("${userm!.email ?? "Aucun"}"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/no_image.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              navMenu(name: "Accueil", onTap: () => () => _key.currentState!.openEndDrawer(), iconData: Icons.home),
              Ligne(color: Colors.grey,),
              navMenu(name: "Profile", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return Profile(userM: userm!);
              }));}, iconData: Icons.account_box_rounded),
              Ligne(color: Colors.grey,),
              navMenu(name: "Membres", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (context){
                return StreamProvider<List<UserM>>.value(
                  child: MembresAEUTNA(),
                  value: DbServices().getUsers,
                  initialData: [],
                );
              }));}, iconData: Icons.people),
              Ligne(color: Colors.grey,),
              navMenu(name: "Apropos", onTap: () => (){ _key.currentState!.openEndDrawer(); aproposFunction(context);}, iconData: Icons.info),
              Ligne(color: Colors.grey,),
              navMenu(name: "Paramètre", onTap: () => (){ _key.currentState!.openEndDrawer(); _parametre(context);}, iconData: Icons.settings),
              Ligne(color: Colors.grey,),
              navMenu(name: "Contactez-nous", onTap: () => (){ _key.currentState!.openEndDrawer(); Navigator.push(context, MaterialPageRoute(builder: (context){
                return NousContactez();
              }));
                }, iconData: Icons.phone),
              Ligne(color: Colors.grey,),
              navMenu(name: "Message", onTap: () => (){ _key.currentState!.openEndDrawer(); _parametre(context);}, iconData: Icons.message),
              Ligne(color: Colors.grey,),
              navMenu(name: "Déconnection", onTap: () => (){ _key.currentState!.openEndDrawer(); deconnectionAlertDialog(context);}, iconData: Icons.logout),
              Ligne(color: Colors.grey,),
            ],
          ),
        ),
      ),
      body: Center(),
    );
  }
  
  Future _parametre(BuildContext context){
    return showModalBottomSheet(context: context,
        builder: (ctx){
          return Container(
            height: 160,
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings, color: Colors.blueGrey,),
                    SizedBox(width: 10,),
                    Text("Paramètres", style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                  ],
                ),
                Ligne(color: Colors.grey,),
               Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.wb_twighlight, color: Colors.blueGrey,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Themes()));
                        }, child:  Text("Sélectionner un thème", style: TextStyle(color: Colors.grey),),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.language, color: Colors.blueGrey,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Langue()));
                        print("Change de langue");
                      }, child:  Text("Change de langue", style: TextStyle(color: Colors.grey),),)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

