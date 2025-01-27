import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

class CustomeizedElevatedButtom extends StatelessWidget {
  Color? bordercolor;
  Color? color;
  String text;
  Widget? IconImage;
  TextStyle? style;
  Function ? onpressed;
  CustomeizedElevatedButtom ({ this.bordercolor,
    this.color, required this.text, this.IconImage, this.style, this.onpressed});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  ElevatedButton(

        style: ElevatedButton.styleFrom(elevation: 0,
            padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
            shape: RoundedRectangleBorder(side: BorderSide(color:bordercolor ??AppColors.orangeColor),
                borderRadius: BorderRadius.circular(16)),backgroundColor:color ?? AppColors.orangeColor),
        onPressed: () { //NAVIGATION
          if (onpressed != null) {
            onpressed!();
          };

        },
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconImage ??SizedBox(),
            SizedBox(width: width*0.01,),
            Text(text,style:style ??AppStyles.semiBold20BlackInter ,)

          ],)
    );
  }
}
