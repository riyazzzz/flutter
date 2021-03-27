
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/HomePage.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/checkout.dart';
import 'package:flutter_map/profileScreen.dart';
import 'package:flutter_map/sighUp.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/Category_Provider.dart';
import 'providers/Product_Provider.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<CategoryProvider>(
          create: (ctx) => CategoryProvider(),),
        ListenableProvider<ProductProvider>(
          create: (ctx) => ProductProvider(),),
      ],

      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapShot) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(iconTheme: IconThemeData(color:Colors.black)),
           home: SignUp(),
            );
          }
      ),
    );

  }
}
