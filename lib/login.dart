
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/change%20Screen.dart';
import 'package:flutter_map/myButton.dart';
import 'package:flutter_map/myText.dart';
import 'package:flutter_map/passField.dart';
import 'package:flutter_map/sighUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText=true;
String email;
String password;
class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey<ScaffoldState>();



  void validation() async {
    final FormState _form=_formKey.currentState;
    if(!_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      } on PlatformException catch(e){
        print(e.message.toString());
        _Scaffoldkey.currentState.showSnackBar(SnackBar(content: Text(e.message),));
      }
    }
    else
    {


    }
  }

  @override
  Widget build(BuildContext context) {

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
                    height:200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Login",style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),

                  Container(
                      height:300,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                            name:"Password",
                              onChanged: (value){
                                setState(() {
                                  password=value;
                                });
                              },
                            obserText: obserText,
                            validator: (value){
                              if(value == "") {
                                return "please Fill Password";
                              }
                              else if(value.length<8){
                                return"Password is too short";
                              }
                              return"";
                              },
                           onTap:() {
                             FocusScope.of(context).unfocus();
                             setState(() {
                               obserText = !obserText;
                             });
                           }
                          ),
                         myButton(onPressed:() {
                           validation();
                         },
                           name: "Login",
                         ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ChangeScreen(
                            name:"SignUp",WhichAccount:"I Have Not Account",onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>SignUp(),),);},
                          ),
                        ),
                        ],
                      ),


                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
