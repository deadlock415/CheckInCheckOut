
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class UserServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<String> getCurrentUID() async{
  return (await _firebaseAuth.currentUser()).uid;
}

  void createUser(Map data){
    _firestore.collection(collection).document(data["userId"]).setData(data);
  }
   void  updateUser(Map data) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
     _firestore.collection(collection).document(uid).collection("products").document(productId).setData(data);
  }
  Future<void> addProduct(data) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
   Firestore.instance.collection(collection).document(uid).collection("products").add(data) ; 
  }
  getData() async {
     final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    return  Firestore.instance.collection(collection).document(uid).collection("products").snapshots();
  }
  updateData(selectedDoc, newValues) async{
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    Firestore.instance.collection(collection).document(uid)
        .collection('products')
        .document(selectedDoc)
        .updateData(newValues);
      
  }

  deleteData(docId) async{
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid;
    Firestore.instance.collection(collection).document(uid)
        .collection('products')
        .document(docId)
        .delete();
        
  }

}