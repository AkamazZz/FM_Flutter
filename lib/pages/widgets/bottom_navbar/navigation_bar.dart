import 'package:find_master/constants/navbar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_cubit.dart';

Widget buildBottomBar(BuildContext context ,NavbarItem item){
  return BottomNavigationBar(currentIndex: item.index,
      showUnselectedLabels: false,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.system_update_alt,
        ),
        label: 'Vacancies',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'Profile',
      ),
    ],
    onTap: (index) {
      if (index == 0) {
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavbarItem.home);
      } else if (index == 1) {
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavbarItem.vacancies);
      } else if (index == 2) {
        BlocProvider.of<NavigationCubit>(context)
            .getNavBarItem(NavbarItem.profile);
      }
    },
  );
}