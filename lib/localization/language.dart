import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/localization/language_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../provider/app_language_provider.dart';
import '../utils/app_color.dart';
import '../utils/app_styles.dart';
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(),
      body: Column(
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: [
          Text(
          AppLocalizations.of(context)!.language,
      style: AppStyles.bold24WhiteInter) ,
      SizedBox (height: height*0.02,),
      InkWell(
      onTap:(){
      showLanguageBottomSheet ( );
      } ,
      child: Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(10) ,
      border: Border.all(
      color: AppColors.whiteColor,
      width: 2,
      )
      ),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
      languageProvider.appLanguage=='en'?
      AppLocalizations.of(context)!.english:
      AppLocalizations.of(context)!.arabic,
      style: AppStyles.bold24WhiteInter),
      const Icon(Icons.arrow_drop_down, size: 30,
      color: AppColors.blackColor,)
      ],
      ), )
      )
        ]
      ),
    );

  }

  void showLanguageBottomSheet( ){
        showModalBottomSheet(
            context: context,
            builder: (context)=>LanguageBottomSheet()
        );
  }
}
