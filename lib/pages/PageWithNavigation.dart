import 'package:find_master/pages/profile_page.dart';
import 'package:find_master/pages/vacancies_page.dart';
import 'package:find_master/pages/widgets/bottom_navbar/navigation_bar.dart';
import 'package:find_master/pages/widgets/bottom_navbar/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:find_master/constants/navbar_items.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'main_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
        child: MaterialApp(
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: HexColor('#5325E8'),
              secondaryHeaderColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.indigo,

            ),
            title: "bruh",
            home: Scaffold(


                bottomNavigationBar: BlocBuilder<
                    NavigationCubit,
                    NavigationState>(
                    builder: (context, state) {
                      return buildBottomBar(context, state.navbarItem);
                    }
                ),
                body: BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      if (state.navbarItem == NavbarItem.home) {
                        return MainPage();
                      } else if (state.navbarItem == NavbarItem.vacancies ) {
                        return VacanciesPage(isEmployer: jwtToken.getBool()!,);
                      }
                      else if (state.navbarItem == NavbarItem.profile) {
                        return ProfilePage();
                      }
                      return Container();
                    }
                )
            )
        )
    );
  }
}
