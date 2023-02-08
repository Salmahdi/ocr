import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

class MyImageCropper{

   static Future<File> croImage({required File imageFile}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    return File(croppedFile!.path);
  }
}