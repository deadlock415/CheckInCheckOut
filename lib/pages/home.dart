import 'package:provider/provider.dart';

import '../pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports
import '../componets/horizontal_listview.dart';
import '../componets/product.dart';
import '../pages/cart.dart';
import '../provider/user_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    TextEditingController _searchController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/product/chair.jpg'),
          AssetImage('images/product/smallstable.jpg'),
          AssetImage('images/product/books.jpg'),
          AssetImage('images/product/kitchen1.jpg'),
          AssetImage('images/product/studytable.jpg'),
          AssetImage('images/product/matters.jpg'),
          AssetImage('images/product/kitchen2.jpg'),

        ],
        autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
     animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 4.0,
      ),
    );

    return Scaffold(
   
       appBar: new AppBar(
         elevation: 0.1,
        backgroundColor: Colors.red.shade900,
          title:Text('CHECK-IN CHECK-OUT',
            style: TextStyle(
              fontSize: 17.4,
            )),
        
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('user test'),
              accountEmail: Text('user@mail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red.shade900
              ),
            ),

//            body

            // InkWell(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>new HomePage()));
            //   },
            //   child: ListTile(
            //     title: Text('Home Page'),
            //     leading: Icon(Icons.home),
            //   ),
            // ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            // InkWell(
            //   onTap: (){
               
            //   },
            //   child: ListTile(
            //     title: Text('My Orders'),
            //     leading: Icon(Icons.shopping_basket),
            //   ),
            // ),

          
         

            Divider(),

            InkWell(
              onTap: (){
                user.signOut();
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),
 resizeToAvoidBottomInset: false, // set it to false
  body: SingleChildScrollView(child: new Column(
        children: <Widget>[
          //image carousel begins here
        image_carousel,

         
            new Padding(padding: const EdgeInsets.all(8.0),
            child:new Text('Categories'),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child:new Text('Recently Added Products'),),

          // Gridview
          Container(
            height:320.0,
            child: Products(),
          )

        ],
      ),)
    );
  }
}
