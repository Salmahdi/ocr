import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

Widget shareText(TextEditingController controller) {
  return IconButton(
    onPressed: () {
      Share.share(controller.text, subject: controller.text);
    },
    icon: Icon(
      Icons.share_outlined,
      size: 30.sp,
    ),
  );
}
