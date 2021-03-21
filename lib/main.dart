
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/HomePage.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/checkout.dart';
import 'package:flutter_map/sighUp.dart';
import 'package:provider/provider.dart';

import 'Category_Provider.dart';
import 'Product_Provider.dart';
import 'login.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
          primaryColor: Color(0xffaf7373),
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:MultiProvider(
        providers:[
          ListenableProvider<CategoryProvider>(create:(ctx)=>CategoryProvider(),),
          ListenableProvider<ProductProvider>(create:(ctx)=>ProductProvider(),),
        ],

        child: StreamBuilder(stream:FirebaseAuth.instance.onAuthStateChanged,
            builder:(ctx,snapShot){
              if(snapShot.hasData){
                return HomePage();
              }
              else
              {
                return HomePage();
              }
            }

        ),
      ),
    );
  }
}
