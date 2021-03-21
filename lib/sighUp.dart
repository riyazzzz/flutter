import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/login.dart';
import 'package:flutter_map/myButton.dart';
import 'package:flutter_map/passField.dart';

import 'change Screen.dart';
import 'myText.dart';
class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText=true;
String email;
String password;
class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey<ScaffoldState>();



  void validation() async {
    final FormState _form=_formKey.currentState;
    if(!_form.validate()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      } on PlatformException catch(e) {
        print(e.message.toString());
        {
          _Scaffoldkey.currentState.showSnackBar(
              SnackBar(content: Text(e.message),));
        }
      }
    }
    else
      {


    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildAlltextFormField (){
      return Container(
        height: 350,
        width: 370,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          MyText(
          name:"UserName",
          validator:(value){
            if(value == ""){
              return "please Fill UserName";
            }
            else if(value.length<8)
            {
              return "User is In valid";
            }
            return "";
          },
        ),
        MyText(
          name:"Email",
          onChanged: (value){
            setState(() {
              email=value;
            });
          },
          validator:(value){
            if(value == ""){
              return "please Fill email";
            }
            else if(!regExp.hasMatch(value))
            {
              return "Email is In valid";
            }
            return "";
          },
        ),
        PassField(
          obserText: obserText,
          name:"Password",
            onChanged: (value){
              setState(() {
                password=value;
              });
            },
          validator: (value){
            if(value == "") {
              return "please Fill Password";
            }
            else if(value.length<8){
              return"Password is too short";
            }
            return"";
          },
          onTap:(){
            FocusScope.of(context).unfocus();
            setState(() {
              obserText = !obserText;
            });
          }
        ),
        MyText(
          name:"MobileNo",
          validator:(value){
            if(value == ""){
              return "please Fill MobileNo";
            }
            else if(value.length<8)
            {
              return "Mobileno is In valid";
            }
            return "";
          },
        ),

        ]
      )
      );
    }
    return Scaffold(
      key: _Scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key:_formKey,
          child:ListView(
            children: [
              Column(
                children: [
                  Container(
                    height:100,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Register",style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),

                      _buildAlltextFormField (),

                       myButton(
                         onPressed: (){
                           validation();
                         },
                         name:"SignUp",
                       ),
                  SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: ChangeScreen(
                            name:"Login",WhichAccount:"I Have Already An Account",onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Login(),),);},
                          ),
                        )
          ],

                        )




                ],

              ),

          ),
        ),
      );
  }
}
