import 'package:flutter/material.dart';
class PassField extends StatelessWidget {

  final bool obserText;
  final TextEditingController controller;
  final String name;
  final Function onTap;
   const PassField({Key ke,this.obserText, this.name,this.controller,this.onTap});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller,
      obscureText: obserText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap:onTap,
          child: Icon(obserText==true?
          Icons.visibility:Icons.visibility_off,
              color:Colors.black),
        ),
        hintText:name,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
    );
  }
}
