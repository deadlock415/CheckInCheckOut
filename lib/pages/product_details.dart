import 'package:checkinout/select.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_contact;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
   this.product_detail_picture,
   this.product_detail_contact
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>new Select()));
                  },
          child: Text('CHECK-IN CHECK-OUT',
          style: TextStyle(
            fontSize: 17.4,
          )),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.white), onPressed: (){}),
          
        ],
      ),body: new ListView(
        children:<Widget>[
            new Container(
              height:300.0,
              child: GridTile(
                child: Container(
                  color:Colors.white,
                  child: Image.asset(widget.product_detail_picture)
                ),

              footer: new Container(
                color:Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                  style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0),),
                  title:new Row(
                    children:<Widget>[
                     
                       Expanded(child: new Text("Rs ${widget.product_detail_new_price}",
                       style:TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
                    ]
                  ) ,
                )
              ),
            )
          ),

         
          Divider(),
          //  new ListTile(
          //   title:new Text("Seller Name"),
          //   subtitle: new Text("admin"),
          // ),
          // new ListTile(
          //   title:new Text("Product Details"),
          //   subtitle: new Text("this is good"),
          // ),
           new ListTile(
            title:new Text("Phone Number"),
            subtitle: new Text('${widget.product_detail_contact}'),
          ),

        //   Divider(),
        // new Row(
        //   children:<Widget>[
        //     Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
        //     child:new Text("Product Name",style:TextStyle(color: Colors.grey,)))
        //    , Padding(padding: EdgeInsets.all(5.0),
        //     child: new Text(widget.product_detail_name),
        //    )          
        //   ]
        // ),

//         new Row(
//           children:<Widget>[
//             Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
//             child:new Text("Product brand",style:TextStyle(color: Colors.grey,))),

// //        Remember to create the product of brand
//             Padding(padding: EdgeInsets.all(5.0),
//             child: new Text("Camlin"),
//            )          
//           ]
//         ),

//        Remember to create the Condition of product
        // new Row(
        //   children:<Widget>[
        //     Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
        //     child:new Text("Product Condition",style:TextStyle(color: Colors.grey,))), 
        //     Padding(padding: EdgeInsets.all(5.0),
        //     child: new Text("New"),
        //    )          
        //   ]
        // ),

        // Divider(),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: new Text("Similar Products"),
        // ) ,

//          Similar Product Section
        // Container(
        //   height:360.0,
        //   child:Similar_products(),
        // )

        ],
      ),
    );
  }
}


// class Similar_products extends StatefulWidget {
  
//   @override
//   _Similar_productsState createState() => _Similar_productsState();
// }

// class _Similar_productsState extends State<Similar_products> {
  
//   var product_list =[
//     {
//       "name":"Chair",
//       "picture":"images/product/chair.jpg",
//       "old_price":"1200",
//       "price":"800",
//     },
//      {
//       "name":"Pillow",
//       "picture":"images/product/books.jpg",
//       "old_price":"300",
//       "price":"200",
//     },
    
//     {
//       "name":"Pillow",
//       "picture":"images/product/matters.jpg",
//       "old_price":"1000",
//       "price":"800",
//     }
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: product_list.length,
//       gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemBuilder:(BuildContext context , int index){
//         return Similar_single_prod(
//           prod_name: product_list[index]['name'],
//           prod_picture: product_list[index]['picture'],
         
//           prod_price: product_list[index]['price'],
//         );
//       } );
//   }
// }

// class Similar_single_prod extends StatelessWidget {
//   final prod_name;
//   final prod_picture;
 
//   final prod_price;

//   Similar_single_prod({
//     this.prod_name,
//     this.prod_picture,
   
//     this.prod_price
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: new Text("Hero1"),
//          child: Material(
//            child: InkWell(onTap:() => 
//            Navigator.of(context).push(
//              new MaterialPageRoute(
//                builder: (context)=> new ProductDetails(
//                  product_detail_name: prod_name,
//                  product_detail_new_price: prod_price,
               
//                  product_detail_picture: prod_picture,
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
//              child:Image.asset(
//                prod_picture,
//              fit:BoxFit.cover,),
//            ),
//          )
//         ),
//        )
//     );
//   }
// }