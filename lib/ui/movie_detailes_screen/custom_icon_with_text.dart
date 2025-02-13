import 'package:flutter/material.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';

class CustomIconWithText extends StatelessWidget {
  String imagePath ;
  String text;
   CustomIconWithText({required this.imagePath,required this.text});
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
width: width*(122/430),
      height: height*(58/932),
      clipBehavior: Clip.antiAlias,decoration:
    BoxDecoration(color: AppColors.darkGrayColor,borderRadius: BorderRadius.circular(16),
    ),
    child: Row(children: [Image.asset(imagePath),Text(text,style:AppStyles.bold24WhiteRoboto,)
      
    ],
    mainAxisAlignment: MainAxisAlignment.spaceAround,),);
  }
}
