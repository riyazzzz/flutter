import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Products.dart';
class ProductProvider with ChangeNotifier{

    List<Product>feauture=[];
Product feautureData;
Future<void>getFuturetData()async{
  List<Product> newList=[];
    QuerySnapshot shirtSnapShot=await Firestore.instance
        .collection("products").
    document("NuaYpiOSF0DenEdpF6rP")
        .collection("feautureproduct")
        .getDocuments();
    shirtSnapShot.documents.forEach((element) {
      feautureData=Product(
          image:element.data["image"],
          name: element.data["name"],
          price: element.data["price"]);
      newList.add(feautureData);
    },
    );
    feauture = newList;
  notifyListeners();

  }
  List<Product>get getFeautureList{
    return feauture;
  }
    List<Product>newAchives=[];
    Product newAchivesData;
    Future<void>NewAchiveData()async{
      List<Product> newList=[];
      QuerySnapshot shirtSnapShot=await Firestore.instance
          .collection("products").
      document("NuaYpiOSF0DenEdpF6rP")
          .collection("newAchives")
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
      notifyListeners();

    }
    List<Product>get getNewAchivesList{
      return newAchives;

    }

    List<Product>homeFeauture=[];
    Product homefeautureData;
    Future<void>getHomeFuturetData()async{
      List<Product> newList=[];
      QuerySnapshot shirtSnapShot=await Firestore.instance
          .collection("productfeauture")
          .getDocuments();
      shirtSnapShot.documents.forEach((element) {
        feautureData=Product(
            image:element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(feautureData);
      },
      );
      homeFeauture = newList;
      notifyListeners();

    }
    List<Product>get getHomeFeautureList{
      return homeFeauture;
    }


    List<Product>homenewArchive=[];
    Product homenewArchiveData;
    Future<void>getHomenewArchiveData()async{
      List<Product> newList=[];
      QuerySnapshot shirtSnapShot=await Firestore.instance
          .collection("productnewAchive")
          .getDocuments();
      shirtSnapShot.documents.forEach((element) {
        homenewArchiveData=Product(
            image:element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(homenewArchiveData);
      },
      );
      homenewArchive = newList;
      notifyListeners();

    }
    List<Product>get getHomenewArchiveList{
      return homenewArchive;
    }
}