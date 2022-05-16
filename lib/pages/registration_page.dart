import 'package:dio/dio.dart';
import 'package:find_master/pages/profile_page.dart';
import 'package:find_master/repository/auth_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:find_master/common/theme_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;


import 'login_page.dart';

class RegistrationPage extends  StatefulWidget{
  AuthRepository auth = AuthRepository();
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();

  bool termsCheckedValue = false;
  bool termsCheckboxValue = false;

  bool employerCheckedValue = false;
  bool employerCheckboxValue = false;
  double heightOfScreen = 0.0;

  var userController = TextEditingController();
  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var passwordController = TextEditingController();
  var checkPasswordController = TextEditingController();
  var codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(


        child: Stack(

          children: [
            Align(
              alignment: Alignment.bottomCenter,

            ),
            Container(

              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),


              child: Column(

                children: [
                  Image.asset("assets/icons/FindMaster_icon.png", height: 250, width: 250,),
                  Form(

                    key: _formKey,
                    child: Column(
                      children: [


                        Container(
                          child: TextFormField(
                            controller: nameController,
                            decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: surnameController,
                            decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                            labelText: "Email address",
                            hintText: 'Enter your Email',
                            suffixIcon: IconButton(onPressed: () => widget.auth.SendVerification(userController.text),
                                icon: Icon(Icons.send)),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                          ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: passwordController,

                            decoration: ThemeHelper().textInputDecoration(
                                "Password*",
                                "Enter your password"),


                            keyboardType: TextInputType.visiblePassword,

                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^{7}$").hasMatch(val)){
                                return "Length is too short";
                              }
                              return null;
                            },

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: codeController,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: ThemeHelper().textInputDecoration(
                                "Code*", "Enter your password"),

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: termsCheckboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            termsCheckboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },

                        ),
                        SizedBox(height: 0.0),
                        FormField(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: employerCheckboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            employerCheckboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I'm employer", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },

                        ),
                        SizedBox(height: 10.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            onPressed: () async {


                               widget.auth.Register(userController.text, passwordController.text, nameController.text, surnameController.text, employerCheckboxValue).then((res) {
                                 if (res.statusCode == 200) {
                                   AlertDialog(
                                       title: const Text('You have registered')
                                   );
                                   Navigator.pushReplacement(context,
                                       MaterialPageRoute(builder: (context) =>
                                           ProfilePage()));
                                 }else{
                                   AlertDialog(
                                       title: const Text('Something went wrong')
                                   );
                                 }
                               });



                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,20,10,20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(
                              TextSpan(
                                  children: [

                                    TextSpan(
                                      text: 'Have account?',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),

    );
  }

}