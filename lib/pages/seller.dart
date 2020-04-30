import 'package:flutter/material.dart';
import '../pages/product_details.dart';

class Other extends StatefulWidget {
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  var product_list = [
    {
      "name":"test",
      "picture":"images/test.jpg",
      "price":"800",
    },
     
     
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
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
 final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
   this.prod_price,
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