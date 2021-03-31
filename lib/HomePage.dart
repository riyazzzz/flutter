import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/profileScreen.dart';
import 'package:flutter_map/providers/Category_Provider.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/listProduct.dart';
import 'package:flutter_map/search.dart';
import 'package:flutter_map/singleProduct.dart';
import 'package:flutter_map/detailScreen.dart';
import 'package:flutter_map/usermodule.dart';
import 'package:provider/provider.dart';

import 'categoryIcon.dart';
import'package:flutter_map/Notification button.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryProvider categoryProvider;
ProductProvider productProvider;
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
FirebaseAuth firebaseauth;
class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image),
        ),
      ),
    );
  }
Widget _buildfeauture (){
  List<Product> feautureProduct;
  feautureProduct=productProvider.getFeautureList;
  List<Product> homeFeatureProduct;
  homeFeatureProduct=productProvider.getHomeFeautureList;

    return  Column(
      children: [
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
  Navigator.of(context).push(
  MaterialPageRoute(
  builder: (ctx) => ListProduct(
  name: "Featured",
  snapShot:feautureProduct,
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
width:360,
    child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                    children:homeFeatureProduct .map((e){
                  return Expanded(
                    child: Row(
                      children:<Widget> [

                        GestureDetector(

                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => DetailScreen(
                                    image:e.image,
                                    price: e.price,
                                    name: e.name
                                ),
                              ),
                            );
                          },
                          child: SingleProduct(
                              image:e.image,
                              price: e.price,
                              name: e.name
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(image:feautureProduct.elementAt(1).image, price: feautureProduct.elementAt(1).price, name: feautureProduct.elementAt(1).name),
                                ),
                              );
                            },
                            child: SingleProduct(image:feautureProduct.elementAt(1).image, price: feautureProduct.elementAt(1).price, name: feautureProduct.elementAt(1).name),
                          ),
                        ),
                      ],
                    ),
                  );
                    }).toList(),


                  ),
  ),
],
  );

}
Widget _buildnewArchives() {
  List<Product> newarchiveProduct = productProvider.getNewAchivesList;
  return  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "NewArchives",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      ListProduct(
                        name: "newArchive",
                        snapShot: newarchiveProduct,
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

        width:360,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          children: productProvider.getHomenewArchiveList.map((e) {
           return Expanded(
             child: Row(

                children: <Widget>[
                  Expanded(
                    child: GestureDetector(

                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                                image:e.image,price:e.price,  name:e.name
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                          image:e.image,price:e.price,  name:e.name
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(image:e.image,price:e.price,  name:e.name),
                        ),
                      );
                    },
                    child: SingleProduct( image:e.image,price:e.price,  name:e.name),
                  ),
                ],
              ),
           );
          }).toList()


        ),
      ),
    ],
  );

}
Widget _buildProfile(){
    List <UserModel> userModel=productProvider.userModelList;
    return Column(
      children: userModel.map((e)  {
          return UserAccountsDrawerHeader(
          accountName: Text(e.userName,
          style: TextStyle(color: Colors.black)),
      currentAccountPicture: CircleAvatar(
        backgroundImage: e.userImage==null?AssetImage("images/camera.png"):NetworkImage(e.userImage),
      ),
      decoration: BoxDecoration(
        color: Color(0xfff8f8f8),
      ),
      accountEmail:
      Text(e.userEmail,
          style: TextStyle(color: Colors.black)),

);}).toList());

}


  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[

          _buildProfile(),



          ListTile(
            enabled: true,
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            enabled: true,
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ProfileScreen()));
            },
            leading: Icon(Icons.home),
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>CartScreen()));
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info),
            title: Text("Info"),
          ),
          ListTile(
            onTap: () {

              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Login()));

            },
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
    List<Product> shirts= categoryProvider.getShirtList;

    List<Product> Pant= categoryProvider.getPantList;

    List<Product> shoe= categoryProvider.getshoeList;

    List<Product> tie= categoryProvider.gettieList;

    List<CategoryIcon> iconData=categoryProvider.getIconList;

    return Column(children: [
      Container(
        height: 35,
        child: Column(

          children: <Widget>[
            Text(
              "Categories",
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                      name:"Shirt",
                      snapShot:shirts,
                    ),),);
                  },
                  child: _buildCategoryProduct(image: iconData[0].image, color: 0xFFe0e0e0),),
                GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                        name:"Pant",
                        snapShot: Pant,
                      ),),);
                    },

                    child:_buildCategoryProduct(image: iconData[1].image, color: 0xFFb3b3b3)),
                GestureDetector  (
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                        name:"Shoe",
                        snapShot:shoe,
                      ),),);
                    },
                    child:_buildCategoryProduct(image: iconData[3].image, color: 0xFF808080)),
                GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> ListProduct(
                        name:"Tie",
                        snapShot:tie,
                      ),),);
                    },
                    child:_buildCategoryProduct(image: iconData[2].image, color: 0xff33dcfd)),
              ],
            )
        ),



    ]
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    categoryProvider=Provider.of<CategoryProvider>(context);
    categoryProvider.getShirtData();
categoryProvider.gettieData();
categoryProvider.getshoeData();
categoryProvider.getPantData();
productProvider=Provider.of<ProductProvider>(context);
productProvider.NewAchiveData();
productProvider.getFuturetData();
productProvider.getHomeFuturetData();
productProvider.getHomenewArchiveData();
    productProvider.getUserData();
    categoryProvider.getCategoryIconsData();


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

            NotificationButton(),
          ],
        ),
        body:Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView(
                        children: <Widget>[
                          _imageSlider(),

                          _category(),
                          SizedBox(
                            height: 15,
                          ),

                          _buildfeauture(),
                          _buildnewArchives(),

                        ],
                      ),
        )
    );

  }
}
