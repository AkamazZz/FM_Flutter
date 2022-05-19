import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_master/pages/main_page.dart';
import 'package:find_master/repository/auth_repository.dart';
import 'package:find_master/repository/profile_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:find_master/common/theme_helper.dart';
import 'package:http/http.dart' as http;


import 'PageWithNavigation.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key? key}): super(key:key);
  var auth = AuthRepository();
  var profile = ProfileRepository();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    var distanceBetween = 0.0;
    switch (screen.orientation){
      case Orientation.portrait:{
          distanceBetween = screen.size.height/4;
      }
      break;

      case Orientation.landscape:{
        distanceBetween = screen.size.height/20;
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height:  distanceBetween,

              //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),

                 // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: emailController,
                                  decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),

                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Login'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: () async{
                                    widget.auth.Login(emailController.text.toLowerCase(), passwordController.text).then((res){
                                      if (res.statusCode != 400){
                                        widget.auth.GetId(jwtToken.getString()!).then((value) {
                                          jwtToken.setInt(value);

                                          widget.profile.isEmployer(jwtToken.getInt()!).then((value) =>
                                          jwtToken.setBool(value));
                                        }
                                        );



                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NavigationPage()),
                                        ModalRoute.withName('/'));
                                      }
                                    });





                                    //After successful login we will
                                    // redirect to profile page. Let's create profile page now
                                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}