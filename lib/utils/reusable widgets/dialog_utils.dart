import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';

import '../app_styles.dart';

class DialogUtils {
  static void showLoading (
  {required BuildContext context}
){

    showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
         return AlertDialog(
         backgroundColor: AppColors.darkGrayColor,
           content: Row(

             children: [
               CircularProgressIndicator(color: AppColors.orangeColor),
               Padding(padding: EdgeInsets.all(15),child: Text("Loading",style: AppStyles.regular16OrangeRoboto,),)
             ],
           ),
         );
    });
  }
  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(
      {required BuildContext context,
        required String message,
        String title="",
        String? posActionName,
        String? negActionName,
        Function? negAction,
        Function? posAction,

      }){
    List<Widget> actions=[];
    if(posActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      }, child: Text(posActionName,style: AppStyles.regular16OrangeRoboto)
      ));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();

      }, child: Text(negActionName,style: AppStyles.regular16OrangeRoboto)
      ));
    }

    showDialog(context: context, builder: (context){

      return AlertDialog(backgroundColor: AppColors.darkGrayColor,
        iconColor: AppColors.orangeColor,
        title: Text(title,style: AppStyles.regular20WhiteRoboto,),
        content: Text(message,style: AppStyles.regular16OrangeRoboto,),
        actions: actions,
      );
    });

  }


}