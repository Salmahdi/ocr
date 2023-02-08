import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar getAppBar({required String title, Widget? widget}) {
  return AppBar(
    leading: widget,
    title: Text(
      title,
      style: TextStyle(fontSize: 20.sp),
    ),
    centerTitle: true,
  );
}
