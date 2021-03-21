import 'package:flutter/material.dart';
// ignore: camel_case_types
class myButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  const myButton({Key key, this.onPressed, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 220,
        // ignore: deprecated_member_use
        child: RaisedButton(
          child:Text(name),
          color:Colors.blueGrey,
          onPressed: onPressed
        ),
    );
  }
}
