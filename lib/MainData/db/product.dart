import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    _firestore.collection(ref).document(productId).setData(data);
  }
}

  // var id = Uuid();
  //   var ids =Uuid();
  //   String productsId =ids.v1();
  //   String productId = id.v1();
  //   data["id"] = productId;
  //   _firestore.collection(ref).document(productId).collection(ref2).document(productsId).setData(data);