// import 'package:cloud_firestore/cloud_firestore.dart';
// class Products{
//   static const  ID ='id';
//   static const  NAME ='name';
//   static const  PICTURE ='picture';
//   static const  PRICE ='price';
//   static const  CATEGORY ='category';
//   static const  DETAILS ='details';
  
//   //private variable
//   String _category;
//   List _picture;
//   String _id;
//   String _name;
//   double _price;
//   String _details;
// //getter
//   String get category => _category;
//   List get picture => _picture;
//   String get id => _id;
//   String get name => _name;
//   double get price => _price;
//   String get details => _details;

//   Products.fromSnapshot(DocumentSnapshot snapshot){
//     Map data =snapshot.data;
//     _category = data[CATEGORY];
//     _picture = data[PICTURE];
//     _price = data[PRICE];
//     _id = data[ID];
//     _name = data[NAME];
//     _details = data[DETAILS];
//   }

// }




















































import 'package:flutter/material.dart';
import '../pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name":"test11",
      "picture":"images/test.jpg",
      "price":"58",
    },
     {
      "name":"Pillow",
      "picture":"images/product/books.jpg",
     
      "price":"200",
    },
    {
      "name":"Pillow",
      "picture":"images/product/studytable.jpg",
      
      "price":"400",
    },
    {
      "name":"Pillow",
      "picture":"images/product/matters.jpg",
     
      "price":"800",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_price: product_list[index]['price'],
              prod_contact: product_list[index]['contact'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
 final prod_price;
 final prod_contact;

  Single_prod({
    this.prod_name,
    this.prod_picture,
   this.prod_price,
   this.prod_contact
  });

//New Code
 @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(
               child: InkWell(onTap:() => 
           Navigator.of(context).push(
             new MaterialPageRoute(
               builder: (context)=> new ProductDetails(
                 product_detail_name: prod_name,
                 product_detail_new_price: prod_price,
                product_detail_picture: prod_picture,
                product_detail_contact: prod_contact,
               ))
           ),
           
           child: GridTile(
             footer:Container(
               color:Colors.white ,
               child:new Row(
                 children :<Widget>[
                    Expanded(
                      child: Text(prod_name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                      ),
                      new Text("Rs $prod_price",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold),)
                 ]
               ),
             ),
             child:Image.asset(
               prod_picture,
             fit:BoxFit.cover,),
           ),
         )
          ));
  
  }
}










