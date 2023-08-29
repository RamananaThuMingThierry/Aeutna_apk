import 'package:aeutna/model/User.dart';
import 'package:aeutna/pages/users/showUsers.dart';
import 'package:aeutna/utils/loading.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:aeutna/widgets/showMembres.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class MembresAEUTNA extends StatefulWidget {
  const MembresAEUTNA({Key? key}) : super(key: key);

  @override
  State<MembresAEUTNA> createState() => _MembresAEUTNAState();
}

class _MembresAEUTNAState extends State<MembresAEUTNA> {
  // Déclarations des variables

  List<UserM> _allUsers = [];
  List<UserM> _resultList = [];

  final TextEditingController _searchController = TextEditingController();

  getUsersStream() async{
    var data = await FirebaseFirestore.instance.collection("users").orderBy("numero_carte_aeutna").get();
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
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Membres A.E.U.T.N.A"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.people)),
        ],
      ),
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
      // body: Center(),
    );
  }
}