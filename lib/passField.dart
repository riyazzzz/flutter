import 'package:flutter/material.dart';
class PassField extends StatelessWidget {

  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;
  final Function onChanged;

  const PassField({Key key,this.onChanged, this.validator,this.obserText, this.name,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      obscureText: obserText,
      validator: validator,
      onChanged:onChanged,
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
