import 'package:flutter/material.dart';

//App Theme

final appTheme = ThemeData(
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Colors.white,

  //* AppBar Theme
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    
    iconTheme: IconThemeData(color: Colors.white, size: 30),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
  ),

  //* Text Theme
  textTheme: const TextTheme(),

  //* Drawer Theme
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),

  //* BottomNavigationBar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      size: 40,
    ),
  ),

  //*FloatingActionButton Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    splashColor: Colors.indigo,
  ),

  listTileTheme: const ListTileThemeData(
    dense: true,
  ),
);
