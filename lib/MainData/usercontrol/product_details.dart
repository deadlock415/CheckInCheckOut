
import 'package:flutter/material.dart';
import '../select.dart';



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
                  child: Image.network(widget.product_detail_picture)
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
   
           new ListTile(
            title:new Text("Phone Number"),
            subtitle: new Text('${widget.product_detail_contact}'),
          ),
          new ListTile(
            title:new Text("Product Details"),
            subtitle: new Text('${widget.product_detail_contact}'),
          ),

      

        ],
      ),
    );
  }
}


