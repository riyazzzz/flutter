import 'package:flutter/material.dart';
class MyText extends StatelessWidget {

  final Function validator;
  final String name;
  final Function onChanged;


  const MyText({Key key,this.onChanged, this.validator,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText:name,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
    );
  }
}
