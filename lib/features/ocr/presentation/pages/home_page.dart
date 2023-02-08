import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ocr/features/ocr/presentation/pages/text_recognized_page.dart';
import 'package:ocr/features/ocr/presentation/widgets/home_page/floating_action_button.dart';

import '../../../../core/widgets/show_snakbar.dart';
import '../../../localization/app_localization.dart';
import '../../services/crop_image.dart';
import '../widgets/section/app_bar.dart';
import '../widgets/section/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  File? _image;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        File imageTemporary = File(image.path);
        imageTemporary =
            await MyImageCropper.croImage(imageFile: imageTemporary);

        setState(() {
          _image = imageTemporary;
        });
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBar(context, e.message),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar:
            getAppBar(title: AppLocalizations.of(context)!.translate('ocr')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //Image
            Center(
              child: _image != null
                  ? Image.file(
                      _image!,
                      height: 300.h,
                      width: 400.w,
                    )
                  : Image.asset(
                      'assets/images/scanned_image.gif',
                      height: 300.h,
                      width: 300.w,
                      fit: BoxFit.contain,
                    ),
            ),

            // Get Text Button
            _buildGetTextButton(context),
          ],
        ),
        //Upload Image Buttons
        floatingActionButton: MyFloatingActionButton(
          onGalleryPressed: (imageSource) => _pickImage(ImageSource.gallery),
          onCameraPressed: (imageSource) => _pickImage(ImageSource.camera),
        ),
      ),
    );
  }

  Center _buildGetTextButton(BuildContext context) {
    return Center(
      child: Visibility(
        visible: _image != null,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => TextRecognizedPage(
                  path: _image!.path,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.document_scanner,
            color: Colors.white,
            size: 25.sp,
          ),
          label: Text(
            AppLocalizations.of(context)!.translate('get_text'),
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
