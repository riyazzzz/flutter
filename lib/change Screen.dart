import 'package:flutter/material.dart';
class ChangeScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String WhichAccount;
  final String name;
  final Function onTap;

  // ignore: non_constant_identifier_names
  const ChangeScreen({Key key, this.WhichAccount, this.name, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(WhichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child:Text(name,style: TextStyle(color:Colors.cyan,fontWeight: FontWeight.bold,fontSize: 18),),
        ),
      ],
    );
  }
}
