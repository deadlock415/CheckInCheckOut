import 'dart:async';

import 'dart:core';

import 'package:flutter/material.dart';
import '../admincontrol/add_product.dart';

import 'crud.dart';




class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String productName;
  String productDetails;
  String productPrice;
  var products;

  CrudMedthods crudObj = new CrudMedthods();

  // Future<bool> addDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Add Data', style: TextStyle(fontSize: 15.0)),
  //           content: Container(
  //               height: 125.0,
  //               width: 150.0,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 TextField(
  //                   decoration: InputDecoration(hintText: 'Enter car Name'),
  //                   onChanged: (value) {
  //                     this.carModel = value;
  //                   },
  //                 ),
  //                 SizedBox(height: 5.0),
  //                 TextField(
  //                   decoration: InputDecoration(hintText: 'Enter car color'),
  //                   onChanged: (value) {
  //                     this.carColor = value;
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('Add'),
  //               textColor: Colors.blue,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 crudObj.addData({
  //                   'carName': this.carModel,
  //                   'color': this.carColor
  //                 }).then((result) {
  //                   dialogTrigger(context);
  //                 }).catchError((e) {
  //                   print(e);
  //                 });
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 200.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Product Name'),
                    onChanged: (value) {
                      this.productName = value;
                    },
                  ),
                  SizedBox(height: 3.2),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Product Details'),
                    onChanged: (value) {
                      this.productDetails = value;
                    },
                  ),
                   SizedBox(height: 3.2),
                    TextField(
                    decoration: InputDecoration(hintText: 'Enter Product Price'),
                    onChanged: (value) {
                      this.productPrice = value;
                    },
                  ),
                 
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'name': this.productName,
                    'details': this.productDetails,
                    'price':this.productPrice
                  }).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Job Done', style: TextStyle(fontSize: 15.0)),
            content: Text('Added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        products = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> AddProduct()));
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.refresh),
            //   onPressed: () {
            //     crudObj.getData().then((results) {
            //       setState(() {
            //         cars = results;
            //       });
            //     });
            //   },
            // )
          ],
        ),
        body: _productList());
  }

  Widget _productList() {
    if (products != null) {
      return StreamBuilder(
        stream: products,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, i) {
                return new ListTile(
                  // leading: Image.network(snapshot.data.document[i].data['picture']),
                  title: Text(snapshot.data.documents[i].data['name'],style:TextStyle(fontSize: 25.0)),
                  subtitle: Text(snapshot.data.documents[i].data['details']),
                  trailing: IconButton(icon:Icon(Icons.delete), onPressed: () { 
                    crudObj.deleteData(snapshot.data.documents[i].documentID);
                   },),
                  onTap: () {
                    updateDialog(
                        context, snapshot.data.documents[i].documentID);
                  },
                  // onLongPress: () {
                  //   crudObj.deleteData(snapshot.data.documents[i].documentID);
                  // },
                );
              },
            );
          } 
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }
}