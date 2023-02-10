import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//App Theme

final appTheme = ThemeData(
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Colors.white,

  //* AppBar Theme
  appBarTheme:  AppBarTheme(
    centerTitle: true,
    
    iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold),
  ),

  //* Text Theme
  textTheme: const TextTheme(),

  //* Drawer Theme
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),

  //* BottomNavigationBar Theme
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      size: 40.sp,
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
