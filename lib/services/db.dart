import 'dart:io';
import 'package:aeutna/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class DbServices{

  final CollectionReference userCol = FirebaseFirestore.instance.collection("users");

  Future saveUser(UserM user) async{
    try{
      await userCol.doc(user.id).set(user.toMap());
      return true;
    }catch(e){
      return false;
    }
  }

  Stream<List<UserM>> get getUsers{
    return userCol.orderBy('nom').snapshots().map((user){
      return user.docs.map((e) {
        return UserM.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<UserM?> getUser(String id) async{
    final donne = await userCol.doc(id).get();
    final user = UserM.fromJson(donne.data() as Map<String, dynamic>);
    if(user == null){
      return null;
    }else{
      return user;
    }
  }

  // Stream<List<Portes>> get getPortes{
  //   return portesCol.orderBy('numero_porte').snapshots().map((portes){
  //     return portes.docs.map((e) {
  //       return Portes.fromJson(e.data() as Map<String, dynamic>);
  //     }).toList();
  //   });
  // }

    Future<bool> updateUser(UserM userM) async{
    try{
      await userCol.doc(userM.id).update(userM.toMap());
      return true;
    }catch(e){
      return false;
    }
  }

  Future<String?> uploadImage(File file, {String? path}) async{
    var time = DateTime.now().toString();
    var ext = Path.basename(file.path).split(".")[1].toString();
    String image = path! + "_" + time + "." + ext;
    try{
      Reference ref = FirebaseStorage.instance.ref().child(path! + "/" + image);
      UploadTask uploadTask = ref.putFile(file);
      return await uploadTask.then((res) => res.ref.getDownloadURL());
    }catch(e){
      return null;
    }
  }

  Future<List<String>?> get getCarouselImage async{
    try{
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference imagesRef = storage.ref().child('carousel');
      final ListResult result = await imagesRef.listAll();
      final List<String> imageURLs = [];
      for (final Reference ref in result.items) {
        final String downloadURL = await ref.getDownloadURL();
        imageURLs.add(downloadURL);
      }
      return imageURLs;
    }catch(e){
      return null;
    }
  }
}