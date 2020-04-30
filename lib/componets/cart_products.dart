import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Product_on_the_cart=[
    {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
     {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
        {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
     {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
        {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
     {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
        {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },
     {
      "name":"Chair",
      "picture":"images/product/chair.jpg",
      "price":"800",
    },

    
    
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 6,
      itemBuilder: (context,index){
        return Single_cart_products(
          cart_prod_name:Product_on_the_cart[index]["name"],
          cart_prod_price:Product_on_the_cart[index]["price"],
          cart_prod_picture:Product_on_the_cart[index]["picture"],
        );
      }

    );
  }
}

class Single_cart_products extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;

  Single_cart_products({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ============LEADING SECTION============
        leading: new Image.asset(cart_prod_picture,width:80.0,height:80.0,),
        //=============TITLE SECTION===========
        title:new Text(cart_prod_name),
        //=============SUBTITLE SECTION==========
        subtitle: new Container(
          alignment:Alignment.topLeft,
          child: new Text(
            "Rs $cart_prod_price",
            style: TextStyle(
              fontSize:17.0,
              fontWeight: FontWeight.bold,
              color:Colors.red
            ),)
        ),
      ),
      
    );
  }
}