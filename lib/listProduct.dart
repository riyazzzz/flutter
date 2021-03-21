import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/HomePage.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/singleProduct.dart';

class ListProduct extends StatelessWidget {
  final List<Product>snapShot;
  final String name;


  const ListProduct({Key key, this.name, this.snapShot}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
     iconTheme:IconThemeData(
       color: Colors.black,
     ),
        actions: <Widget>[

          IconButton(icon: Icon(Icons.search, color: Colors.black,),
              onPressed: () {}
          ),
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children:<Widget>[
                    Container(
                  height:50,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[

                        Text(name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),),

                      ],
                    ),

                  ],
                ),
          ),
              SizedBox(height:10),
              Container(
                height:700,
                child: GridView.count(
                 crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  scrollDirection: Axis.vertical,
                  children: snapShot.map((e) => SingleProduct(price: e.price,image:e.image,name:e.name),)
                    .toList(),


                ),
              )

            ],
          ),
          ),
        ],
      ),
    );
  }
}



