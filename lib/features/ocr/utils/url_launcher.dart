import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher {
  //* Email Info
  static const String emailTo = 'sa.01.swe@gmail.com';
  static const String subject = 'Hello SALEM ALMAHDI';
  static const String body = 'I reached to you by OCR App';

  //* Phone Number
  //static const String phoneNumber = '+966 50 418 6383';

  //*Launch Url
  static _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  //*Open Link
  static Future openLink({required String url}) => _launchUrl(url);

  //*Open Email
  static Future openEmail() async {
    final String url =
        'mailto:$emailTo?subject=${Uri.decodeFull(subject)}&body=${Uri.decodeFull(body)}';

    await _launchUrl(url);
  }

  //*Phone
/*   static Future openPhoneCall() async {
    const String url = 'tel:$phoneNumber';

    await _launchUrl(url);
  } */


  
}
