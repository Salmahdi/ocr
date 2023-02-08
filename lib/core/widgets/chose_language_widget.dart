import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr/core/widgets/get_radio_value.dart';
import 'package:ocr/features/localization/cubit/cubit/locale_cubit.dart';

import '../../features/localization/app_localization.dart';

class ChoseLanguageWidget extends StatelessWidget {
  const ChoseLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocaleCubit, ChangeLocaleState>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      builder: (context, state) {
        return BlocBuilder<LocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
            return AlertDialog(
              insetPadding: const EdgeInsets.symmetric(vertical: 90),
              alignment: Alignment.center,
              title: Text(
                  AppLocalizations.of(context)!.translate('select_language')),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildRadioButton(
                      image: 'assets/icons/icon-britain.png',
                      radioValue: getRadioValue(context),
                      groupValue: 1,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('en');
                      },
                      title:
                          AppLocalizations.of(context)!.translate('english')),
                  _buildRadioButton(
                      image: 'assets/icons/icon-saudi.png',
                      radioValue: getRadioValue(context),
                      groupValue: 2,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('ar');
                      },
                      title: AppLocalizations.of(context)!.translate('arabic')),
                  _buildRadioButton(
                      image: 'assets/icons/icon-china.png',
                      radioValue: getRadioValue(context),
                      groupValue: 3,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('zh');
                      },
                      title:
                          AppLocalizations.of(context)!.translate('chinese')),
                  _buildRadioButton(
                      image: 'assets/icons/icon-japan.png',
                      radioValue: getRadioValue(context),
                      groupValue: 4,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('ja');
                      },
                      title:
                          AppLocalizations.of(context)!.translate('japanese')),
                  _buildRadioButton(
                      image: 'assets/icons/icon-india.png',
                      radioValue: getRadioValue(context),
                      groupValue: 5,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('hi');
                      },
                      title: AppLocalizations.of(context)!.translate('indian')),
                  _buildRadioButton(
                      image: 'assets/icons/icon-korea.png',
                      radioValue: getRadioValue(context),
                      groupValue: 6,
                      onChanged: (value) {
                        context.read<LocaleCubit>().changeLanguage('ko');
                      },
                      title: AppLocalizations.of(context)!.translate('korean')),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text(AppLocalizations.of(context)!.translate('cancel')),
                ),
              ],
              actionsAlignment: MainAxisAlignment.end,
            );
          },
        );
      },
    );
  }

  Row _buildRadioButton(
      {required String image,
      required int radioValue,
      required int groupValue,
      required Function(int?) onChanged,
      required String title}) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 40,
          width: 40,
        ),
        Radio(value: radioValue, groupValue: groupValue, onChanged: onChanged),
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
