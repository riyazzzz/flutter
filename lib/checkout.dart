import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/Products.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:flutter_map/singleCart.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'Notification button.dart';
class CheckOut extends StatefulWidget {

  @override
  _CheckOutState createState() => _CheckOutState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
ProductProvider productProvider;
class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle=TextStyle(
    fontSize: 18,
  );

  Widget _buildbottomDet({ String startName, String endName}){

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(startName,style:myStyle),
        Text(endName,style:myStyle),
      ],
    );
  }
  User user;
  double total;
  int index;
  Widget _buildButton(){
    return Column(
      children:productProvider.userModelList.map((e){
       return Container(
         height:55,
         width: double.infinity,
         child: RaisedButton(
            color: Color(0xff746bc9),
            child:Text("Buy",style:TextStyle(fontSize: 18),),
            onPressed: (){
              if(productProvider.checkoutModelList.isNotEmpty){
                FirebaseFirestore.instance.collection("Order").doc(user.uid).set({
                  "Product":productProvider.checkoutModelList.map((e) => {
                    "Product Name":e.name,

                    "Product Price":e.price,
                    "ProductQuentity":e.quentity,
                    "ProductImage":e.image,
                    "ProuctColor":e.color,
                  }).toList(),

                  "Total Price":total.toStringAsFixed(2),
                  "UserName":e.userName,
                  "UserEmail":e.userEmail,
                  "UserAddress":e.userAddress,
                  "UserNumber":e.userPhoneNumber,
                  "UserUid":user.uid,
                });

                productProvider.clearCheckoutProduct();
                productProvider.addNotification("notification");
              }else
                {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("No Item Yet")));
                }

            },
          ),
       );
      }).toList()
    );
  }
  @override
  Widget build(BuildContext context) {

     user=FirebaseAuth.instance.currentUser;
    productProvider=Provider.of<ProductProvider>(context);
    double subTotal=0;
    double disCount=3;
    double disCountRupees;
    double shipping=50;

    productProvider.getCheckOutModelList.forEach((element)
    {
      subTotal += element.price * element.quentity;
    }
    );
    disCountRupees=disCount/100*subTotal;
    total=subTotal+shipping-disCountRupees;
    if(productProvider.checkoutModelList.isEmpty){
      total=0.0;
      disCount=0.0;
      subTotal=0.0;
      shipping=0.0;
      disCountRupees=0.0;
    }
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom:10),

        // ignore: deprecated_member_use
        child:
        _buildButton(),
      ),
      appBar: AppBar(
        title:Text("Cart",style:TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          setState(() {
            productProvider.clearCheckoutProduct();
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>CartScreen(),),);
        },),
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      body:Container(

        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        Container(
          height:520,
          child: ListView.builder(
          itemCount: productProvider.getCheckOutModelListLength,
             shrinkWrap: true,
              itemBuilder:(ctx,myIndex){
            index=myIndex;
                  return Single(
                    index:index,
                    isCount: true,
                    color:productProvider.getCheckOutModelList[myIndex].color,
                    size:productProvider.getCheckOutModelList[myIndex].size,
                    image: productProvider.getCheckOutModelList[myIndex].image,
                    name: productProvider.getCheckOutModelList[myIndex].name,
                    price: productProvider.getCheckOutModelList[myIndex].price,
                    quentity: productProvider.getCheckOutModelList[myIndex].quentity,

                  );}),
        ),
                Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      _buildbottomDet(startName:"Subtotal",
                          endName: "\Rs.${subTotal.toStringAsFixed(2)}"),
                      _buildbottomDet(startName:"Discount",
                          endName: "\% ${disCount.toStringAsFixed(2)}"),
                      _buildbottomDet(startName:"Shipping",
                          endName: "\Rs.  ${shipping.toStringAsFixed(2)}"),
                      _buildbottomDet(startName:"Total",
                          endName: "\Rs. ${total.toStringAsFixed(2)}"),
                    ],
                  ),
                ),
              ],
    ),


        ),
      );
  }
}
