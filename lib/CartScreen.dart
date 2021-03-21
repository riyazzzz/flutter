import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/checkout.dart';
import'package:flutter_map/material.dart';

import 'HomePage.dart';


class CartScreen extends StatefulWidget {
  final double price;
  final String name;
  final String image;

  const CartScreen({Key key, this.price, this.name, this.image}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count=1;
  Widget _buildSingleProductCart(){
    return   Container(
      height:150,
      width:double.infinity,

      child: Card(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Row(
              children: [
                Container(
                  height:130,
                  width:130,
                  decoration: BoxDecoration(
                    image:DecorationImage(
                      fit:BoxFit.fill,
                      image: AssetImage("images/${widget.image}"),),
                  ),
                ),
                Container(
                    height:140,
                    width: 200,
                    child:ListTile(
                      title:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name),
                          Text("Cloth"),
                          Text("\$${widget.price.toString()}",style:TextStyle(color: Color(0xff9b96d6),fontWeight: FontWeight.bold),
                          ),

                          Container(
                            height:30,
                            width:120,
                            color:Color(0xfff2f2f2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  child:Icon(Icons.remove), onTap: (){
                                  setState((){
                                    if(count>1) {
                                      count--;
                                    }
                                  });
                                },
                                ),
                                Text(
                                  count.toString(),
                                ),
                                GestureDetector(
                                    child:Icon(Icons.add), onTap: (){
                                  setState((){
                                    count++;
                                  });
                                }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>CheckOut(
           image:widget.image,
           name:widget.name,
           price: widget.price,
         ),),);
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
          IconButton(icon: Icon(Icons.notifications_none,color:Colors.black), onPressed: (){})
        ],
      ),
      body:Container(
        child: ListView(
          children: [
            _buildSingleProductCart(),
            _buildSingleProductCart(),
            _buildSingleProductCart(),
            _buildSingleProductCart(),
          ],
        ),
      ),
    );
  }
}
