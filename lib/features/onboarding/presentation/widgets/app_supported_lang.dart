import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container buildOnboardingPageAppSupportedLang({
  required Color backGroundColor,

  required String title,
  required Color textColor,
  required List<Widget> widget,
}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: backGroundColor,
    child: Padding(
      padding: REdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          //Title
          Text(
            title,
            style: TextStyle(
                fontSize: 26.sp, fontWeight: FontWeight.bold, color: textColor),
          ),
          SizedBox(
            height: 30.h,
          ),

          // Descipthon
          Column(
            children: widget,
          )
        ],
      ),
    ),
  );
}

Widget bildLangListTile(String title, String image, Color listTileTextColor) {
  return ListTile(
    dense: true,
    leading: Image.asset('assets/icons/icon-$image.png'),
    title: Text(
      title,
      style: TextStyle(
          fontSize: 22.sp, fontWeight: FontWeight.bold, color: listTileTextColor),
    ),
  );
}
