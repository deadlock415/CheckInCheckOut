
// import 'package:checkinout/usercontrol/product_details.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'dart:async';

//  class UserHome extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//         debugShowCheckedModeBanner: false,
//        home:Scaffold(
//          appBar: AppBar(title: new Text("Products"),),
//          body: ListPage(),
//        ));
// }}


// class ListPage extends StatefulWidget {
//   @override
//   _ListPageState createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {

//   Future _data;

//   Future getPosts() async{

//     var firestore = Firestore.instance;
//    QuerySnapshot qn = await firestore.collection("products").getDocuments() ;
//     return qn.documents;
//   }



// @override
// void initState()
// {
//  super.initState(); 
//  _data = getPosts();
// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//       future: _data,
//   builder:(_, snapshot){
//         if(snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: Text("Loading..."),
//           );
//         }else{
//            return
//             GridView.builder(
//             gridDelegate:
//              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemCount: snapshot.data.length,
//             itemBuilder: (_ , index){
//               return 
//                Single_prod(
//           prod_name: snapshot.data[index]['name'],
//           prod_image: snapshot.data[index]['picture'],
//           prod_price:snapshot.data[index]['price'],
//           prod_contact:snapshot.data[index]['contact']
//         );

              
//             });
//         }
//       }),
//     );
//   }
// }
//  class DetailPage extends StatefulWidget {
   
//    final DocumentSnapshot post;
//    DetailPage({this.post});

//    @override
//    _DetailPageState createState() => _DetailPageState();
//  }
 
//  class _DetailPageState extends State<DetailPage> {
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//             appBar: AppBar(
//               title:Text(widget.post.data["name"]),
//             ),
//             body: Container(
//          child: Card(
//            child: ListTile(
//              title: Text(widget.post.data["name"]),
//              subtitle: Text(widget.post.data["details"])
//            )
//          ),
         
//        ),
//      );
//    }
//  }

//  class Single_prod extends StatelessWidget {
//    final prod_name;
//   final prod_image;
//   final prod_price;
//   final prod_contact;

//    Single_prod({
//     this.prod_name,
//     this.prod_image,
//    this.prod_price,
//    this.prod_contact
//   });

//    @override
//    Widget build(BuildContext context) {
//      return Card(
//       child: Hero(
//         tag: new Text("Hero1"),
//          child: Material(
//            child: InkWell(onTap:() => 
//            Navigator.of(context).push(
//              new MaterialPageRoute(
//                builder: (context)=> new ProductDetails(
//                  product_detail_name: prod_name,
//                  product_detail_new_price: prod_price,
//                  product_detail_picture: prod_image,
//                  product_detail_contact: prod_contact,
//                ))
//            ),
           
//            child: GridTile(
//              footer:Container(
//                color:Colors.white ,
//                child:new Row(
//                  children :<Widget>[
//                     Expanded(
//                       child: Text(prod_name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
//                       ),
//                       new Text("Rs $prod_price",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold),)
//                  ]
//                ),
//              ),
//              child:Image.network(prod_image, fit:BoxFit.cover),
//            ),
//          )
//         ),
//        )
//     );
//    }
//  }