import 'package:checkinout/admin/admin.dart';
import 'package:checkinout/pages/home.dart';
import 'package:checkinout/pages/seller.dart';
import 'package:checkinout/selection.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admin/add_product.dart';

 class Select extends StatelessWidget {
  static const String _title = 'CheckIn CheckOut';

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
        Padding(padding: const EdgeInsets.all(10.0),
        child: Text("Choose Admin Or User"),
        ),
        Padding(
          padding: const EdgeInsets.all(70.0),
          child: MaterialButton(
           child: Text("User",style:TextStyle(fontSize: 70)),
           
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Selection()));
              });
            },
          ),
        ),
        Divider(),
         Padding(
           padding: const EdgeInsets.all(70.0),
           child: MaterialButton(
             child: Text("Admin",style:TextStyle(fontSize: 60)),
           
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Admin()));
              });
            },
        ),
         ),
       
      ],
    );
  }
}
