import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/PageWithNavigation.dart';
import 'package:find_master/pages/add_vacancy.dart';
import 'package:find_master/pages/login_page.dart';
import 'package:find_master/pages/message_page.dart';
import 'package:find_master/pages/profile_page.dart';
import 'package:find_master/pages/main_page.dart';
import 'package:find_master/pages/vacancies_page.dart';
import 'package:find_master/pages/vacancy_page.dart';
import 'package:find_master/pages/widgets/bottom_navbar/navigation_bar.dart';
import 'package:find_master/pages/widgets/bottom_navbar/navigation_cubit.dart';
import 'package:flutter/material.dart';
import "package:find_master/pages/registration_page.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';

import 'constants/navbar_items.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await jwtToken.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#5325E8');
  Color _accentColor = HexColor('#8A02AE');

   MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(jwtToken.getString()! == 'empty' ){
    return MaterialApp(
      debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    title: 'Flutter Login UI',
    theme: ThemeData(
    primaryColor: _primaryColor,
    accentColor: _accentColor,
    scaffoldBackgroundColor: Colors.grey.shade100,
    primarySwatch: Colors.grey,
    ),


    home: LoginPage(),
    );
    } else {
      return NavigationPage();

    }

  }
}

