import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CrudMedthods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(data) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
   Firestore.instance.collection("users").document(uid).collection("products").add(data) ; 




    // if (isLoggedIn()) {
    //   Firestore.instance.collection('testcrud').add(carData).catchError((e) {
    //     print(e);
    //   });
    //   //Using Transactions
    //   // Firestore.instance.runTransaction((Transaction crudTransaction) async {
    //   //   CollectionReference reference =
    //   //       await Firestore.instance.collection('testcrud');

    //   //   reference.add(carData);
    //   // });
    // } else {
    //   print('You need to be logged in');
    // }
  }

  getData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
   
  return  Firestore.instance.collection("users").document(uid).collection("products").snapshots(); 
    // return await Firestore.instance.collection('testcrud').snapshots();
  }

  updateData(selectedDoc, newValues) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    Firestore.instance
        .collection("users").document(uid).collection("products")
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteData(docId) async {
     final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    Firestore.instance
        .collection("users").document(uid).collection("products")
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}