import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr/features/ocr/presentation/pages/home_page.dart';
import 'package:ocr/features/ocr/presentation/widgets/section/app_bar.dart';
import 'package:ocr/features/ocr/presentation/widgets/text_recognized_page/text_recognized_text_form_field.dart';
import '../../../localization/app_localization.dart';
import '../../services/text_recognized_page/text_recognition_script.dart';

class TextRecognizedPage extends StatefulWidget {
  final String? path;
  const TextRecognizedPage({super.key, required this.path});

  @override
  State<TextRecognizedPage> createState() => _TextRecognizedPageState();
}

class _TextRecognizedPageState extends State<TextRecognizedPage> {
  //text process tracker
  bool _isLoading = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    //get Image Path on Init
    final InputImage inputImage = InputImage.fromFilePath(widget.path!);
    //call process method to recognizing the text
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      },
      child: SafeArea(
        child: Scaffold(
          appBar: getAppBar(
            title: AppLocalizations.of(context)!.translate('text_recognized'),
            widget: IconButton(
              icon:  Icon(
                Icons.arrow_back,
                size: 25.sp,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              },
            ),
          ),
          body: _isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : TextRecognizedField(
                  controller: controller,
                ),
        ),
      ),
    );
  }

  void processImage(InputImage image) async {
    //set text language
    final textRecognizer =
        TextRecognizer(script: await getTextRecognitionScript());

    // Text Loading
    setState(() {
      _isLoading = true;
    });

    log(image.filePath!);

    //Recognized the Text
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    //set text value to the controller'
    controller.text = recognizedText.text;

    // Text Loaded
    setState(() {
      _isLoading = false;
    });
  }
}
