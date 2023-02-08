import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/features/ocr/presentation/widgets/section/app_bar.dart';

import '../../../localization/app_localization.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final titleStyle = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.orange);
  final descriptionStyle = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: getAppBar(
        title: AppLocalizations.of(context)!.translate('about'),
      ),
      body: Padding(
        padding: REdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  //OCR
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.translate('whatisocr')}\n\n',
                      style: titleStyle),
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.translate('ocris')}\n\n',
                      style: descriptionStyle),

                  //Features
                  TextSpan(text: '${AppLocalizations.of(context)!.translate('features')}\n\n', style: titleStyle),
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.translate('getfeatuers')}\n\n',
                      style: descriptionStyle),

                  // APP Languages
                  TextSpan(
                      text: '${AppLocalizations.of(context)!.translate('appslang')}\n\n', style: titleStyle),
                  TextSpan(
                      text:
                          '• ${AppLocalizations.of(context)!.translate('english')}\n• ${AppLocalizations.of(context)!.translate('arabic')}\n• ${AppLocalizations.of(context)!.translate('chinese')}\n• ${AppLocalizations.of(context)!.translate('japanese')}\n',
                      style: descriptionStyle),
                  TextSpan(
                      text:
                          '• ${AppLocalizations.of(context)!.translate('indian')}\n• ${AppLocalizations.of(context)!.translate('korean')}\n\n',
                      style: descriptionStyle),

                  // Recognizer Languages
                  TextSpan(
                      text: '${AppLocalizations.of(context)!.translate('textslang')}\n\n',
                      style: titleStyle),
                  TextSpan(
                      text:
                          '• ${AppLocalizations.of(context)!.translate('english')}\n• ${AppLocalizations.of(context)!.translate('chinese')}\n• ${AppLocalizations.of(context)!.translate('japanese')}\n',
                      style: descriptionStyle),
                  TextSpan(
                      text:
                          '• ${AppLocalizations.of(context)!.translate('indian')}\n• ${AppLocalizations.of(context)!.translate('korean')}\n\n',
                      style: descriptionStyle),

                  //Developer
                  TextSpan(
                    text: '${AppLocalizations.of(context)!.translate('developedby')}\n\n',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'SALEM ALMAHDI\n',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Email: ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'sa.01.swe@gmail.com\n',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'WhatsApp: ',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '+966504186383',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
