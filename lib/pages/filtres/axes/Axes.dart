import 'package:aeutna/class/Filtres.dart';
import 'package:aeutna/pages/filtres/axes/Andempona.dart';
import 'package:aeutna/pages/filtres/axes/Andrarony.dart';
import 'package:aeutna/pages/filtres/axes/Ankavanana.dart';
import 'package:aeutna/pages/filtres/axes/Ankavia.dart';
import 'package:aeutna/pages/filtres/axes/AntalahaVille.dart';
import 'package:aeutna/pages/filtres/axes/CapEst.dart';
import 'package:aeutna/utils/constant.dart';
import 'package:aeutna/widgets/donnees_vide.dart';
import 'package:flutter/material.dart';

class FiltresAxes extends StatefulWidget {
  const FiltresAxes({Key? key}) : super(key: key);

  @override
  State<FiltresAxes> createState() => _FiltresAxesState();
}

class _FiltresAxesState extends State<FiltresAxes> {

  List<Filtres> filtres = [
    Filtres("Ankavanana", Icons.list_alt),
    Filtres("Andempona", Icons.list_alt),
    Filtres("Andrarony", Icons.list_alt),
    Filtres("Cap-Est", Icons.list_alt),
    Filtres("Ankavia", Icons.list_alt),
    Filtres("Antalaha Ville", Icons.list_alt),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtre par Axes"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: filtres.length,
          itemBuilder: (context, i){
            Filtres filtre = filtres[i];
            String? key = filtre.nom;
            return Container(
              margin: EdgeInsets.all(1),
              child: Card(
                elevation: 1,
                child: InkWell(
                  onTap: (){
                    if(filtre.nom == "Ankavanana"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  Ankavanana();
                      }));
                    }else if(filtre.nom == "Andempona"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  Andempona();
                      }));
                    }else if(filtre.nom == "Andrarony"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  Andrarony();
                      }));
                    }else if(filtre.nom == "Cap-Est"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  CapEst();
                      }));
                    }else if(filtre.nom == "Ankavia"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  Ankavia();
                      }));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContexxt){
                        return  AntalahaVille();
                      }));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(filtre.iconData, size: 40.0, color: Colors.grey,),
                      Text("${filtre.nom}", style: style.copyWith(color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
