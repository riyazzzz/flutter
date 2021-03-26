import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:flutter_map/singleCart.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'Notification button.dart';
class CheckOut extends StatefulWidget {

  @override
  _CheckOutState createState() => _CheckOutState();
}
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

  @override
  Widget build(BuildContext context) {
    productProvider=Provider.of<ProductProvider>(context);
    double subTotal=0;
    double disCount=3;
    double disCountRupees;
    double shipping=50;
    double total;
    productProvider.getCheckOutModelList.forEach((element)
    {
      subTotal += element.price * element.quentity;
    }
    );
    disCountRupees=disCount/100*subTotal;
    total=subTotal+shipping-disCountRupees;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom:10),

        // ignore: deprecated_member_use
        child:RaisedButton(
          color: Color(0xff746bc9),
          child:Text("Buy",style:TextStyle(fontSize: 18),),
          onPressed: (){},
        ),
      ),
      appBar: AppBar(
        title:Text("Cart",style:TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
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
              itemBuilder:(ctx,index){
                  return Single(
                    image: productProvider.getCheckOutModelList[index].image,
                    name: productProvider.getCheckOutModelList[index].name,
                    price: productProvider.getCheckOutModelList[index].price,
                    quentity: productProvider.getCheckOutModelList[index].quentity,

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
