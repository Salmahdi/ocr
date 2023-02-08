import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:ocr/features/ocr/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/app_supported_lang.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LiquidController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              liquidController: controller,
              enableSideReveal: true,
              onPageChangeCallback: (activePageIndex) {},
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              pages: [
                // Welcome
                _buildOnboardingPage(
                  backGroundColor: Colors.white,
                  image: 'assets/images/onboarding/welcom-page.gif',
                  title: 'What is OCR',
                  description:
                      'Optical character recognition or optical character reader is the electronic or mechanical conversion of images of typed, handwritten or printed text into machine-encoded text, whether from a scanned document, a photo of a document, a scene-photo or from subtitle text superimposed on an image.',
                  textColor: Colors.black,
                ),

                // Features
                _buildOnboardingPage(
                  backGroundColor: Colors.orange,
                  image: 'assets/images/onboarding/text-recognition.gif',
                  title: 'Fetures',
                  description:
                      '• Recognize image from camera\n• Recognize image from gallery\n• Storing text and image recognized\n• Supporting 6 languages fro the app\n• Supporting 5 languages fro the text recognizing',
                  textColor: Colors.white,
                ),

                // App Supported Lang
                buildOnboardingPageAppSupportedLang(
                  backGroundColor: Colors.white,
                  title: 'App Supported Languages',
                  textColor: Colors.black,
                  widget: [
                    bildLangListTile('Arabic Language', 'saudi', Colors.black),
                    bildLangListTile(
                        'English Language', 'britain', Colors.black),
                    bildLangListTile('Chinese Language', 'china', Colors.black),
                    bildLangListTile(
                        'Japanese Language', 'japan', Colors.black),
                    bildLangListTile('Indian Language', 'india', Colors.black),
                    bildLangListTile('Korean Language', 'korea', Colors.black),
                  ],
                ),

                // Text Recognized Supported Land
                buildOnboardingPageAppSupportedLang(
                  backGroundColor: Colors.orange,
                  title: 'Text Recognized Supported Languages',
                  textColor: Colors.white,
                  widget: [
                    bildLangListTile(
                        'English Language', 'britain', Colors.white),
                    bildLangListTile('Chinese Language', 'china', Colors.white),
                    bildLangListTile(
                        'Japanese Language', 'japan', Colors.white),
                    bildLangListTile('Indian Language', 'india', Colors.white),
                    bildLangListTile('Korean Language', 'korea', Colors.white),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0.h,
              left: 16.w,
              right: 32.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('show_home', true);

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildOnboardingPage({
    required Color backGroundColor,
    required String image,
    required String title,
    required String description,
    required Color textColor,
  }) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: backGroundColor,
      child: Padding(
        padding: REdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            Padding(
              padding: REdgeInsets.all(20.0),
              child: Image.asset(
                image,
                height: 300.h,
                width: 300.w,
              ),
            ),
            //Title
            Text(
              title,
              style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            ),
            SizedBox(
              height: 20.sp,
            ),
            // Descipthon
            Text(
              description,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
