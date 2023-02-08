import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TextRecognitionScript> getTextRecognitionScript() async {
  
  TextRecognitionScript textRecognized = TextRecognitionScript.latin;
  final sharedPreferance = await SharedPreferences.getInstance();
  final getLanguage = sharedPreferance.getString('locale');

  switch (getLanguage) {
    case 'en':
      textRecognized = TextRecognitionScript.latin;
      break;
    case 'ar':
      textRecognized = TextRecognitionScript.latin;
      break;
    case 'hi':
      textRecognized = TextRecognitionScript.devanagiri;
      break;
    case 'zh':
      textRecognized = TextRecognitionScript.chinese;
      break;
    case 'ja':
      textRecognized = TextRecognitionScript.japanese;
      break;
    case 'ko':
      textRecognized = TextRecognitionScript.korean;
      break;
  }

  return textRecognized;
}
