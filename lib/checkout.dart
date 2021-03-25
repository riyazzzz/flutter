import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/CartScreen.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:flutter_map/singleCart.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
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
          IconButton(icon: Icon(Icons.notifications_none,color:Colors.black), onPressed: (){})
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
          itemCount: productProvider.getCartModelListlength,
             shrinkWrap: true,
              itemBuilder:(ctx,index){
                  return Single(
                    image: productProvider.getCartModelList[index].image,
                    name: productProvider.getCartModelList[index].name,
                    price: productProvider.getCartModelList[index].price,
                    quentity: productProvider.getCartModelList[index].quentity,

                  );}),
        ),
                Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      _buildbottomDet(startName:"Your price",
                          endName: "\$60"),
                      _buildbottomDet(startName:"Discount",
                          endName: "3%"),
                      _buildbottomDet(startName:"Shipping",
                          endName: "\$ 60"),
                      _buildbottomDet(startName:"Total",
                          endName: "\$120"),
                    ],
                  ),
                ),
              ],
    ),


        ),
      );
  }
}
