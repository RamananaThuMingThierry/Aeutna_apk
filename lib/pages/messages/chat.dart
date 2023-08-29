import 'package:aeutna/model/Message.dart';
import 'package:aeutna/pages/messages/show_chat.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/utils/loading.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:aeutna/widgets/ligne_horizontale.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // Déclarations des variables

  List<Chats> _allChats = [];
  List<Chats> _resultListChats = [];

  final TextEditingController _searchController = TextEditingController();

  getChatsStream() async{
    var data = await FirebaseFirestore.instance.collection("chats").orderBy("date").get();
    setState(() {
      _allChats = data.docs.map((e) {
        return Chats.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
    searchResultList();
  }

  searchResultList(){
    List<Chats> showResults = [];
    if(_searchController.text != ""){
      for(var chatsSnapShot in _allChats){
        var date = chatsSnapShot.date.toString().toLowerCase();
        if(date.contains(_searchController.text.toLowerCase())){
          showResults.add(chatsSnapShot);
        }
      }
    }else{
      showResults = List.from(_allChats);
    }
    setState(() {
      _resultListChats = showResults;
    });
  }

  _onSearchChanged(){
    print(_searchController.text);
    searchResultList();
  }

  @override
  void didChangeDependencies() {
    getChatsStream();
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
    getChatsStream();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Messages"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.message)
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _resultListChats!.length,
          itemBuilder: (context, i){
            Chats chat = _resultListChats![i];
            return chat == null ?
                DonneesVide():
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListTile(
                      shape:Border(left: BorderSide(color: Colors.green, width: 3), bottom: BorderSide(color: Colors.green, width: 1), right: BorderSide(color: Colors.green, width: 3)),
                      onLongPress: () => deleteAlertDialog(context),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => ShowChats(c: chat))),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${chat.nom}", style: style.copyWith(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                          Text("${timeago.format(DateTime.parse(chat.date.toString()), locale: 'fr')}", style: style.copyWith(color: Colors.grey, fontSize: 12),),
                        ],
                      ),
                      leading: Icon(
                        Icons.message, color: Colors.green,
                      ),
                      subtitle: Text("${chat.message}", overflow: TextOverflow.ellipsis, style: style.copyWith(color: Colors.blue, fontSize: 14),),
                      trailing: Icon(
                        Icons.chevron_right, color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {  },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Alert pour la déconnection
  void deleteAlertDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext buildContext){
          return AlertDialog(
            title: Text("Confirmation", textAlign:TextAlign.center,style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),),
            content: SizedBox(
              height: 70,
              child: Column(
                children: [
                  Ligne(color: Colors.blueGrey,),
                  SizedBox(height: 5,),
                  Text("Voulez-vous vraiment supprimer ce message?", textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 15),),
                  SizedBox(height: 5,),
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    print("Annuler");
                  },
                  child: Text("Non", style: TextStyle(color: Colors.redAccent),)),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    print("Suppression autorisé!");
                  }, child: Text("Oui",style: TextStyle(color: Colors.blueGrey),)),
            ],
          );
        });
  }
}
