

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/theme_helper.dart';

class AddPageVacancy extends StatefulWidget {
  const AddPageVacancy({Key? key}) : super(key: key);

  @override
  State<AddPageVacancy> createState() => _AddPageVacancyState();
}

class _AddPageVacancyState extends State<AddPageVacancy> {
  Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: Text('New Vacancy', style: GoogleFonts.openSans(fontSize: 30, textStyle: Theme
            .of(context)
        .textTheme
        .headline6),
    textAlign: TextAlign.center ),
    centerTitle: true,
        ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(

          children: [

            SafeArea(

              child: Container(

                  margin: EdgeInsets.symmetric(horizontal: 10),

                  // This will be the login form
                  child: Column(


                    children: [

                      SizedBox(height: 10.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration('City', 'Where will be working'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration('Position', 'Position for candidate'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration('Salary', 'Salary for candidate'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration('Experience', 'in one number'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration('Employment type', 'Full-time, part-time'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(
                                  obscureText: false,
                                  decoration: ThemeHelper().textInputDecoration('Company name', ''),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                child: TextField(

                                  minLines: 4,
                                  maxLines: null,
                                  obscureText: false,
                                  decoration:  InputDecoration(

                                    labelText: 'About Vacancy',


                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,

                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                  ),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),


                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child:
                              Container(

                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Add new vacancy'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    //After successful login we will
                                    // redirect to profile page. Let's create profile page now
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
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
