import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../localization/app_localization.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function(ImageSource imageSource) onCameraPressed;
  final Function(ImageSource imageSource) onGalleryPressed;

  const MyFloatingActionButton(
      {super.key,
      required this.onCameraPressed,
      required this.onGalleryPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () => onCameraPressed(ImageSource.camera),
            tooltip: AppLocalizations.of(context)!
                .translate('upload_image_from_camera'),
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          FloatingActionButton(
            onPressed: () => onGalleryPressed(ImageSource.gallery),
            tooltip: AppLocalizations.of(context)!
                .translate('upload_image_from_gallery'),
            child: Icon(
              Icons.image,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
