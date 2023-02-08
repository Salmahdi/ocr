import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/features/ocr/services/crop_image.dart';


class MyImagePicker{


  Future pickImage(ImageSource source , BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        File imageTemporary = File(image.path);
        imageTemporary =
            await MyImageCropper.croImage(imageFile: imageTemporary);

      /*     setState(() {
          _image = imageTemporary;
        }); */
        
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}