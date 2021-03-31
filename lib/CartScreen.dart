import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:flutter_map/singleCart.dart';
import 'package:provider/provider.dart';


import 'HomePage.dart';
import 'Notification button.dart';
import 'checkout.dart';


class CartScreen extends StatefulWidget {
  final double price;
  final String name;
  final String image;

  const CartScreen({Key key, this.price, this.name, this.image}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}
ProductProvider productProvider;
class _CartScreenState extends State<CartScreen> {


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
        child:Text("Continious",style:TextStyle(fontSize: 18),),
          onPressed: (){

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>CheckOut(),
            ),
            );
          },
      ),
      ),
      appBar: AppBar(
        title:Text("Cart",style:TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>HomePage(),),);
        },),
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      body:Container(
        child: ListView.builder(
          itemCount: productProvider.getCartModelListlength,
          itemBuilder: (ctx,index)=>Single(
            isCount: false,
            index:index,
            color:productProvider.getCartModelList[index].color,
            size:productProvider.getCartModelList[index].size,
            image:productProvider.getCartModelList[index].image,
            name:productProvider.getCartModelList[index].name,
            price:productProvider.getCartModelList[index].price,
            quentity:productProvider.getCartModelList[index].quentity,
          ),
        ),

      ),

    );
  }
}
