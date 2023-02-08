import 'package:flutter/material.dart';

int getRadioValue(BuildContext context) {
  int radioValue = 1;
  switch (Localizations.localeOf(context).toString()) {
    case 'en':
      radioValue;
      break;
    case 'ar':
      radioValue = 2;
      break;
    case 'zh':
      radioValue = 3;
      break;
    case 'ja':
      radioValue = 4;
      break;
    case 'hi':
      radioValue = 5;
      break;
    case 'ko':
      radioValue = 6;
      break;

    default:
      radioValue = 1;
  }
  return radioValue;
}
