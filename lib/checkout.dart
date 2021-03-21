import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
class CheckOut extends StatefulWidget {
  final double price;
  final String name;
  final String image;

  const CheckOut({Key key, this.price, this.name, this.image}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle=TextStyle(
    fontSize: 18,
  );
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
                      image: AssetImage("images/${widget.image}"),
                    ),
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
                          Text("\$ ${widget.price}",style:TextStyle(fontWeight: FontWeight.bold),
                    ),

                          Container(
                            height:38,
                            width:90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quentity"),
                                           Text("1"),
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>HomePage(),),);
        },),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none,color:Colors.black), onPressed: (){})
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:ListView(
          children: [
            _buildSingleProductCart(),
            _buildSingleProductCart(),
            Container(
              height: 150,
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
            )
          ],
        ),
      ),
    );
  }
}
