import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/core/widgets/chose_language_widget.dart';
import 'package:ocr/features/ocr/presentation/pages/about_page.dart';
import 'package:ocr/features/ocr/utils/url_launcher.dart';
import '../../../../localization/app_localization.dart';

final Color splashColor = Colors.orange.withOpacity(40.0);
const IconData constantIcon = Icons.chevron_right;

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Support
          _buildTitle(AppLocalizations.of(context)!.translate('support')),

          /*  // Share The APP
          _buildListTile(
              iconData: Icons.share,
              iconColor: Colors.blue,
              title: AppLocalizations.of(context)!.translate('share_the_app'),
              onTab: () {}),

          // Rate The APP
          _buildListTile(
              iconData: Icons.star,
              iconColor: Colors.yellow,
              title: AppLocalizations.of(context)!.translate('rate_the_app'),
              onTab: () {}), */

          // About The APP
          _buildListTile(
              iconData: Icons.info_outline,
              iconColor: Colors.black,
              title: AppLocalizations.of(context)!.translate('about'),
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => AboutPage()),
                  ),
                );
              }),

          // Preferences
          _buildTitle(AppLocalizations.of(context)!.translate('prefences')),

          //Language
          _buildListTile(
              iconData: Icons.language,
              iconColor: Colors.grey,
              title: AppLocalizations.of(context)!.translate('language'),
              onTab: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChoseLanguageWidget();
                    });
              }),

          //Connect
          _buildTitle(
            AppLocalizations.of(context)!.translate('Contact'),
          ),

          //Email
          _buildListTile(
              iconData: Icons.email,
              iconColor: Colors.red,
              title: AppLocalizations.of(context)!.translate('email'),
              onTab: () => MyUrlLauncher.openEmail()),

          //Instagram
          _buildContactListTile(
              image: 'assets/icons/icon-instagram.png',
              title: 'Instagram',
              onTab: () => MyUrlLauncher.openLink(
                  url: 'https://www.instagram.com/01.soft/')),

          const Spacer(),

          Padding(
            padding: REdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'SALEM ALMAHDI © 2023',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}

// Build List Tile
ListTile _buildListTile({
  required IconData iconData,
  required Color iconColor,
  required String title,
  required VoidCallback onTab,
}) {
  return ListTile(
    onTap: onTab,
    leading: Icon(
      iconData,
      color: iconColor,
      size: 25.sp,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
    ),
    trailing: const Icon(constantIcon),
  );
}

// Build List Tile
ListTile _buildContactListTile({
  required String image,
  required String title,
  required VoidCallback onTab,
}) {
  return ListTile(
    onTap: onTab,
    leading: Image.asset(
      image,
      height: 30.sp,
      width: 30.sp,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
    ),
    trailing: const Icon(constantIcon),
  );
}

// Build Title
Padding _buildTitle(String title) {
  return Padding(
    padding: REdgeInsets.all(22.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
    ),
  );
}
