import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/app_language_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          InkWell(
            // change  language for en
              onTap : (){
                languageProvider.ChangeAppLanguage('en');
              },
              child:  languageProvider.appLanguage==  'en' ?
              getSelectedItemWidget(AppLocalizations.of(context)!.english):
              getUnselectedItemWidget(AppLocalizations.of(context)!.english)
          ),
          SizedBox (height: 19),
          InkWell (
            onTap:(){
              languageProvider.ChangeAppLanguage('ar');
            } ,
            child: languageProvider.appLanguage==  'ar' ?
            getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
            getUnselectedItemWidget(AppLocalizations.of(context)!.arabic)           ,
          ) ],
      ),
    );
  }
  Widget getSelectedItemWidget(String text ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style:  AppStyles.bold20Black),
        Icon(Icons.check,color: AppColors.whiteColor,size: 20,)
      ],
    );
  }
  Widget getUnselectedItemWidget(String text ){
    return Text(text,
        style: AppStyles.bold20Black
    ) ;

  }
}

