import 'package:flutter/material.dart';
class MyText extends StatelessWidget {

TextEditingController controller;
  final String name;



   MyText({Key key,this.controller,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
   controller: controller,
      decoration: InputDecoration(
        hintText:name,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
    );
  }
}
