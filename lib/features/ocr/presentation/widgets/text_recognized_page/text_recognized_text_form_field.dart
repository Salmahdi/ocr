import 'package:flutter/material.dart';
import 'package:ocr/features/ocr/presentation/widgets/text_recognized_page/copy_text.dart';
import 'package:ocr/features/ocr/presentation/widgets/text_recognized_page/share_text.dart';

class TextRecognizedField extends StatelessWidget {
  final TextEditingController controller;
  const TextRecognizedField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: TextFormField(
        controller: controller,

        //style
        maxLines: MediaQuery.of(context).size.height.toInt(),
        style: const TextStyle(fontSize: 26),

        //decoration
        decoration: InputDecoration(
            suffixIcon: _buildSuffix(context),
            border: const OutlineInputBorder()),
      ),
    ));
  }

  Column _buildSuffix(BuildContext context) {
    return Column(
      children: [
        //Copy Text
        copyText(context, controller),
        //Share Text
        shareText(controller),
         
      ],
    );
  }
}
