import 'package:aeutna/model/User.dart';
import 'package:aeutna/utils/loading.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:aeutna/widgets/showMembres.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Andempona extends StatefulWidget {
  const Andempona({Key? key}) : super(key: key);

  @override
  State<Andempona> createState() => _AndemponaState();
}

class _AndemponaState extends State<Andempona> {
  
  // Déclarations des variables

  List<UserM> _allUsers = [];
  List<UserM> _resultList = [];

  final TextEditingController _searchController = TextEditingController();

  getUsersStream() async{
    var data = await FirebaseFirestore.instance.collection("users").where("axes", isEqualTo: "Andempona").get();
    setState(() {
      _allUsers = data.docs.map((e) {
        return UserM.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    searchResultList();
  }

  searchResultList(){
    List<UserM> showResults = [];
    if(_searchController.text != ""){
      for(var usersSnapShot in _allUsers){
        var numero_carte_aeutna = usersSnapShot.numero_carte_aeutna.toString().toLowerCase();
        if(numero_carte_aeutna.contains(_searchController.text.toLowerCase())){
          showResults.add(usersSnapShot);
        }
      }
    }else{
      showResults = List.from(_allUsers);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  _onSearchChanged(){
    print(_searchController.text);
    searchResultList();
  }

  @override
  void didChangeDependencies() {
    getUsersStream();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  var connectionStatus;
  late InternetConnectionChecker connectionChecker;

  int total = 0;
  @override
  void initState() {
    super.initState();
    getUsersStream();
    _searchController.addListener(_onSearchChanged);
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
    setState(() {
      total = _resultList!.length;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Andempona"),
        centerTitle: true,
        actions: [
          Chip(label: Text("${total}",style: TextStyle(color: Colors.blueGrey),))
        ],
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: Card(
              shape: Border(bottom: BorderSide(width: 2, color: Colors.blueGrey)),
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _searchController,
                  onFieldSubmitted: (arg){},
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.account_box_rounded, color: Colors.blueGrey,),
                    hintText: "Numéro carte AEUTNA",
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
                itemCount: _resultList!.length,
                itemBuilder: (context, i){
                  UserM user = _resultList![i];
                  return user == null
                      ?
                  DonneesVide()
                      :
                  ShowMembres(
                    userM: user,
                  );
                }),),
        ],
      ),
    );
  }
}
