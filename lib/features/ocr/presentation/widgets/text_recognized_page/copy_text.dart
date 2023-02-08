import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/show_snakbar.dart';

Widget copyText(BuildContext context, TextEditingController controller) {
  return IconButton(
    onPressed: () {
      Clipboard.setData(
        ClipboardData(text: controller.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBar(context, 'text_copied_successfully'),
      );
    },
    icon: Icon(
      Icons.copy,
      size: 30.sp,
    ),
  );
}
