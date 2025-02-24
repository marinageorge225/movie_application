import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/cubit/app_language_cubit.dart';
import '../core/utils/app_color.dart';
import '../core/utils/app_styles.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              context.read<AppLanguageCubit>().changeLanguage('en');
            },
            child: BlocBuilder<AppLanguageCubit, String>(
              builder: (context, appLanguage) {
                return appLanguage == 'en'
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                    : getUnselectedItemWidget(AppLocalizations.of(context)!.english);
              },
            ),
          ),
          SizedBox(height: 19),
          InkWell(
            onTap: () {
              context.read<AppLanguageCubit>().changeLanguage('ar');
            },
            child: BlocBuilder<AppLanguageCubit, String>(
              builder: (context, appLanguage) {
                return appLanguage == 'ar'
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                    : getUnselectedItemWidget(AppLocalizations.of(context)!.arabic);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.bold20Black),
        Icon(Icons.check, color: AppColors.whiteColor, size: 20),
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(text, style: AppStyles.bold20Black);
  }
}
