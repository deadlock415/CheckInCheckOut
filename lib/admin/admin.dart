import 'package:checkinout/admin/add_product.dart';
import 'package:checkinout/pages/home.dart';
import 'package:checkinout/pages/seller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 class Admin extends StatelessWidget {
  static const String _title = 'Click for add';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        Text("Click Here for Add Product"),
        Padding(
           padding:const EdgeInsets.all(70.0),
        child:MaterialButton(
         color: Colors.lightBlue,
          child:Text("Add Product",style: TextStyle(fontSize: 50),),
         
         
          onPressed: () {
            setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProduct()));
            });
          },
        ),)
        
       
      ],
    );
  }
}
