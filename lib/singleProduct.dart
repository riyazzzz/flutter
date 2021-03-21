import 'package:flutter/cupertino.dart';
import"package:flutter/material.dart";
class  SingleProduct extends StatelessWidget {
    final String image;
     final double price;
     final String name;

  const SingleProduct({Key key, this.image, this.price, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {

        return Card(
                child: Container(
                  height: 250,
                 width: 170,
                  child:Column(
                      children:<Widget>[
    (
                                    Container(
                                       padding:EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(

                                          image:DecorationImage(
                                            fit:BoxFit.fill,
                                            image: NetworkImage(image),),
                                        ),


                                      ),
                                    )
    ),

                        Text(
                          "\Rs. ${price.toString()}",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.pinkAccent
                        ),
                        ),
                        Text(
                          name,style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.red
                        ),
                        ),
                      ],
                  ),
                ),
        );
  }
}
