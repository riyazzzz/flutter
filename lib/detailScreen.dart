import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/providers/Product_Provider.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';
import 'HomePage.dart';
import 'Notification button.dart';
class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;

  const DetailScreen({Key key, this.image, this.name, this.price}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count=1;
ProductProvider productProvider;
  Widget _buildSizedProduct({String name}){
    return Container(
              color: Color(0xfff2f2f2),
              height: 40,
              width: 40,
              child: Center(
                child:Text(name,style: TextStyle(fontSize: 17),),
              ),
            );

  }
Widget _buildImage(){
    return               Center(
      child: Container(
        height: 300,
        width: 350,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height:200,
              decoration: BoxDecoration(

                image: DecorationImage(
                    fit:BoxFit.fill,
                    image:NetworkImage(widget.image),
              ),
            ),
          ),
        ),

      ),
      ),
    );
}
  Widget _buildColorProduct({Color color}){
    return Container(
      color: color,
      height: 40,
      width: 40,
    );

  }
  Widget _buildname(){
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name,style: TextStyle(fontSize: 18),),
          Text("\$ ${widget.price.toString()}",style: TextStyle(color:Colors.pink,fontSize: 18),)
        ],
      ),
    );
  }
  Widget _builddes(){
    return Container(
      height:80,
      width: 300,

      child:Wrap(  children:<Widget>[
        Text("Lorem Ipsum is make a type specimen book. It has survived not only eap into electronic typesetting, remaining essentially unchanged. It was populari=f Letrase",style: TextStyle(fontSize: 15),),
      ]),
    );
  }
  Widget _quantity(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Row(
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
      ],
    );
  }
Widget _buildSize(){
    return Container(

      width: 240,
      child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            _buildSizedProduct(name:"S"),
            _buildSizedProduct(name:"M"),
            _buildSizedProduct(name:"XL"),
            _buildSizedProduct(name:"XXL"),

          ]
      ),
    );
}
Widget _button(){
    return  Container(
        height: 50,
    width: double.infinity,
    // ignore: deprecated_member_use
    child: RaisedButton(
    color:Colors.red,
    child: Text("CheckOut",style: TextStyle(fontSize: 15),),
    onPressed: (){
   productProvider.getCart(
     image:widget.image,
     name: widget.name,
     price:widget.price,
     quentity: count,
   );
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>CartScreen(),),);
    }
    )
    );
}
Widget _color(){
    return Column(
      children: [
        SizedBox(
            height: 15
        ),
        Container(

          width: 240,
          child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                _buildColorProduct(color:Colors.blue[200]),
                _buildColorProduct(color:Colors.green[200]),
                _buildColorProduct(color:Colors.yellow[200]),
                _buildColorProduct(color:Colors.pinkAccent[200]),

              ]
          ),
        ),
      ],
    );
}
  @override

  Widget build(BuildContext context) {
    productProvider=Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Details",style:TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>HomePage(),),);
        },),
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      body: Container(

        width: double.infinity,
        child:ListView(
          children: [
            Column(
              children: <Widget>[
  _buildImage(),
                Container(

                  padding: EdgeInsets.symmetric(vertical:5,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 320,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                           _buildname(),
                Container(
                  height:40,
                  width: double.infinity,
                  child: Row(

                    children: [
                      Text("Description",style:TextStyle(fontSize:18),),
                    ],
                  ),
                ),
                            _builddes(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Size",style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15
                ),
                            _buildSize(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Color",style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
           _color(),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Quantity",style: TextStyle(fontSize:18 ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(

                    children: [
                      Container(

                        height: 30,
                        width: 120,

                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: _quantity(),
                      ),

                    ],
                  ),
                ),
SizedBox(
  height: 15
),
                            _button(),
      ],
    ),
                      ),
          ],

        ),
      )
    ]
      )
        ]

    )
    )
    );
  }
}
