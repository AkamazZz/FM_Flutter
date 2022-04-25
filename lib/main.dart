import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/login_page.dart';
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

import 'constants/navbar_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#5325E8');
  Color _accentColor = HexColor('#8A02AE');

   MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),


      home: LoginPage(),
    );*/
    return BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: _primaryColor,
              accentColor: _accentColor,
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.indigo,

            ),
          title: "bruh",
        home: Scaffold(


        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
        return buildBottomBar(context,state.navbarItem) ;
        }
    ),
    body: BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state){
        if (state.navbarItem == NavbarItem.home) {
          return MainPage();
        } else if (state.navbarItem == NavbarItem.vacancies) {
          return VacanciesPage();
        } else if (state.navbarItem == NavbarItem.profile) {
          return VacancyPage(vacancy: Vacancy(vacancy_exp: '0', vacancy_date_posted: DateTime(2021),
              vacancy_salary: 300, vacancy_requirments: '0', vacancy_description: "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur. Fugiat do aliqua laboris cillum sint dolor officia adipisicing excepteur fugiat officia. Cupidatat ut elit consequat ea laborum occaecat laborum aute consectetur Lorem exercitation. Lorem anim minim officia aliquip commodo deserunt mollit. Duis deserunt quis cillum voluptate duis ipsum quis incididunt elit excepteur excepteur labore duis cillum. Voluptate sint nulla minim eiusmod in nulla. Ea id ad duis esse adipisicing culpa ex esse ea dolore consequat. Reprehenderit eu minim veniam aliquip do ipsum duis do qui adipisicing aliquip ad occaecat.",
              user_id: 1, vacancy_name: 'C# developer', vacancy_employment_type: 'Part-time',
              vacancy_employer_name: 'Slave', vacancy_address: 'Astana'
          ),);
        }
        return Container();
      }
    )
    )
    )
    );

  }
}

