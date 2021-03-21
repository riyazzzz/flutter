import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Products.dart';
class ProductProvider with ChangeNotifier{

    List<Product>Feauture=[];
Product FeautureData;
Future<void>getShirtData()async{
  List<Product> newList=[];
    QuerySnapshot shirtSnapShot=await Firestore.instance
        .collection("products").
    document("NuaYpiOSF0DenEdpF6rP")
        .collection("feautureproduct")
        .getDocuments();
    shirtSnapShot.documents.forEach((element) {
      FeautureData=Product(
          image:element.data["image"],
          name: element.data["name"],
          price: element.data["price"]);
      newList.add(FeautureData);
    },
    );
    Feauture = newList;

  }
  List<Product>get getShirtList{
    return Feauture;
  }
    List<Product>newAchives=[];
    Product newAchivesData;
    Future<void>newAchiveData()async{
      List<Product> newList=[];
      QuerySnapshot shirtSnapShot=await Firestore.instance
          .collection("products").
      document("NuaYpiOSF0DenEdpF6rP")
          .collection("feautureproduct")
          .getDocuments();
      shirtSnapShot.documents.forEach((element) {
        newAchivesData=Product(
            image:element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(newAchivesData);
      },
      );
      newAchives = newList;

    }
    List<Product>get getnewAchivesList{
      return newAchives;
    }
}