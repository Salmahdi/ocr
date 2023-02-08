import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/localization/app_localization.dart';

SnackBar showSnakBar(BuildContext context, String? message) {
  return SnackBar(
    //  showCloseIcon: true,
    // closeIconColor: Colors.white,
    content: Row(
      children: [
        Icon(
          Icons.copy_all_outlined,
          color: Colors.white,
          size: 25.sp,
        ),
        SizedBox(
          width: 30.w,
        ),
        Text(
          AppLocalizations.of(context)!.translate(message!),
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    ),
  );
}
