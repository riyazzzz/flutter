import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/Category_Provider.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/listProduct.dart';
import 'package:flutter_map/singleProduct.dart';
import 'package:flutter_map/detailScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryProvider provider;
Product menData;
Product womenData;
var mySnapShot;
var newAchive;
Product Bulb;
Product Chair;
var shirt;
var tie;
var pant;
var shoes;

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }
  Widget _buildarchives(){
    return        Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                    image: Bulb.image,
                    price: Bulb.price,
                    name: Bulb.name,
              )
              ),
            );
          },
          child: SingleProduct(
              image: Bulb.image,price: Bulb.price,  name: Bulb.name),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                  image: Chair.image,
                  price: Chair.price,
                  name: Chair.name,
                ),
              ),
            );
          },
          child: SingleProduct(
            image: Chair.image,
            price: Chair.price,
            name: Chair.name,
          ),
        ),
      ],
    );
  }

  Widget _buildproduct(){
    return  Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(

          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                    image: menData.image, price: menData.price , name:menData.name ),
              ),
            );
          },
          child: SingleProduct(
              image: menData.image, price: menData.price, name: menData.name),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                    image: womenData.image, price: womenData.price, name: womenData.name),
              ),
            );
          },
          child: SingleProduct(image:womenData.image, price:womenData.price, name: womenData.name),
        ),
      ],
    );
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Riyas", style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/camera.png"),
            ),
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
            ),
            accountEmail:
                Text("Riyas@gmail.com", style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            enabled: true,
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info),
            title: Text("Info"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
          ),
        ],
      ),
    );
  }

  Widget _imageSlider() {
    return Container(
      height: 200,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: [
          AssetImage("images/glasses.jpg"),
          AssetImage("images/watch.jpg"),
        ],
      ),
    );
  }

  Widget _category() {
    List<Product> shirts= provider.getShirtList;

    List<Product> Pant= provider.getPantList;

    List<Product> shoe= provider.getshoeList;

    List<Product> tie= provider.gettieList;
    return Column(children: [
      Container(
        height: 35,
        child: Container(
          height: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
      Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                        name:"Shirt",
                        snapShot:shirts,
                      ),),);
        },
                      child: _buildCategoryProduct(image: "eyeglass.png", color: 0xFFe0e0e0),),
                  GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                          name:"Pant",
                          snapShot: Pant,
                        ),),);
                      },

                      child:_buildCategoryProduct(image: "dress.png", color: 0xFFb3b3b3)),
                  GestureDetector  (
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                          name:"Shoe",
                          snapShot:shoe,
                        ),),);
                      },
                      child:_buildCategoryProduct(image: "camera.png", color: 0xFF808080)),
                  GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                          name:"Tie",
                              snapShot:tie,
                        ),),);
                      },
                      child:_buildCategoryProduct(image: "shirt.png", color: 0xff33dcfd)),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    provider=Provider.of<CategoryProvider>(context);
    provider.getShirtData();
provider.gettieData();
provider.getshoeData();
provider.getPantData();
    return Scaffold(
        key: _key,
        drawer: _buildMyDrawer(),
        appBar: AppBar(
          title: Text(
            "HomePage",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[100],
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                _key.currentState.openDrawer();
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_active_sharp, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: FutureBuilder(
          future : Firestore.instance.collection("products").document("NuaYpiOSF0DenEdpF6rP").collection("feautureproduct").getDocuments(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child:CircularProgressIndicator(),
              );
            }
mySnapShot=snapshot;
            menData = Product(
              name : snapshot.data.documents[0]["name"],
                image : snapshot.data.documents[0]["image"],
                price: snapshot.data.documents[0]["price"]
            );

            womenData = Product(
                name : snapshot.data.documents[1]["name"],
                image : snapshot.data.documents[1]["image"],
                price: snapshot.data.documents[1]["price"]
            );


                return FutureBuilder(
                  future:  Firestore.instance.collection("products").document("NuaYpiOSF0DenEdpF6rP").collection("newAchives").getDocuments(),
                  builder: (context, snapShot) {
                    if(snapShot.connectionState == ConnectionState.waiting){
                      return Center(child:CircularProgressIndicator(),
                      );
                    }
                          newAchive=snapShot;
                    Bulb = Product(
                        name : snapShot.data.documents[0]["name"],
                        image : snapShot.data.documents[0]["image"],
                        price: snapShot.data.documents[0]["price"]
                    );

                    Chair= Product(
                        name : snapShot.data.documents[1]["name"],
                        image : snapShot.data.documents[1]["image"],
                        price: snapShot.data.documents[1]["price"]
                    );

                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView(
                        children: <Widget>[
                          _imageSlider(),

                          _category(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Feautured",
                                style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => ListProduct(
                                        name: "Featured",
                                        snapShot:mySnapShot,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(

                            height:260,
                              width: 390,
                              child:
                          _buildproduct()),
                          Container(
                            height: 30,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "New Achives",

                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              ListProduct(name: "New Archives",
                                                snapShot:newAchive
                                              ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "See All",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),

                          Container(
                              height:260,
                              width: 390,

                              child: _buildarchives()),
                        ],
                      ),
                    );
                  }
                );
              },
        ),
    );

  }
}
