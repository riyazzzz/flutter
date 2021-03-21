import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/HomePage.dart';
import 'package:flutter_map/Products.dart';
class CategoryProvider with ChangeNotifier{


List<Product> dress=[];
Product shirtData;
List<Product> Pant=[];
Product PantData;
List<Product> shoes=[];
Product shoesData;
List<Product> tie=[];
Product tieData;
Future<void>getShirtData() async{
  List<Product>newList=[];


  QuerySnapshot shirtSnapShot=await Firestore.instance
      .collection("Category").
  document("EM1RJ5gxBqtE8EsE7ND3")
  .collection("dress")
  .getDocuments();
  shirtSnapShot.documents.forEach((element) {
    shirtData=Product(image:element.data["image"],
  name: element.data["name"],
  price: element.data["price"]);
  newList.add(shirtData);
  }
  );
  dress = newList;
  notifyListeners();
}
List<Product>get getShirtList{
  return dress;
}
Future<void>getPantData() async{
  List<Product>newList=[];


  QuerySnapshot shirtSnapShot=await Firestore.instance
      .collection("Category").
  document("EM1RJ5gxBqtE8EsE7ND3")
      .collection("pant")
      .getDocuments();
  shirtSnapShot.documents.forEach((element) {
    shirtData=Product(
        image:element.data["image"],
        name: element.data["name"],
        price: element.data["price"]);
    newList.add(shirtData);
  }
  );
  Pant = newList;
  notifyListeners();

}
List<Product>get getPantList{
  return Pant;
}
Future<void>getshoeData() async{
  List<Product>newList=[];


  QuerySnapshot shirtSnapShot=await Firestore.instance
      .collection("Category").
  document("EM1RJ5gxBqtE8EsE7ND3")
      .collection("shoes")
      .getDocuments();
  shirtSnapShot.documents.forEach((element) {
    shirtData=Product(
        image:element.data["image"],
        name: element.data["name"],
        price: element.data["price"]);
    newList.add(shirtData);
  }
  );
  shoes = newList;
  notifyListeners();
}
List<Product>get getshoeList{
  return shoes;
}
Future<void>gettieData() async{
  List<Product>newList=[];


  QuerySnapshot shirtSnapShot=await Firestore.instance
      .collection("Category").
  document("EM1RJ5gxBqtE8EsE7ND3")
      .collection("tie")
      .getDocuments();
  shirtSnapShot.documents.forEach((element) {
    shirtData=Product(
        image:element.data["image"],
        name: element.data["name"],
        price: element.data["price"]);
    newList.add(shirtData);
  }
  );
  tie = newList;
  notifyListeners();
}
List<Product>get gettieList{
  return tie;
}
}