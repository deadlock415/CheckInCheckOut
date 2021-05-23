import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeMain/userscreen.dart';
import '../MainData/crud/crudvisual.dart';
import '../MainData/user/collection.dart';
import '../main.dart';

 class Select extends StatelessWidget {
  static const String _title = 'CheckIn CheckOut';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
         actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=> UserScreen()));
              },
            ),
          
          ],
        ),
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
        child: Text("Choose IN Or OUT"),
        ),
        
        
                              //Check In

        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MaterialButton(
           child: Text("OUT",style:TextStyle(fontSize: 70)),
           
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  UserHome()));
              });
            },
          ),
        ),
        Divider(),

                              //Check Out

         Padding(
           padding: const EdgeInsets.all(50.0),
           child: MaterialButton(
             child: Text("IN",style:TextStyle(fontSize: 60)),
           
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> DashboardPage()));
              });
            },
        ),
         ),
       
      ],
    );
  }
  
}
