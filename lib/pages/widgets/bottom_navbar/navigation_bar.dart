import 'package:find_master/constants/navbar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildBottomBar(NavbarItem item){
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
  );
}