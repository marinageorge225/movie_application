import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

import '../utils/reusable widgets/Customized Elevated bottom.dart';

class CustomizedOnboardingContainer extends StatelessWidget {
   Color? backgroungColor;
   String ?title;
   String ? Body;
   TextStyle? titleStyle;
   TextStyle? BodyStyle;
   String TextBottom;
   TextStyle? TextBottomStyle;
   String? TextBottom2;
   TextStyle? TextBottom2Style;

   Function onpressed;
   Function? onpressed2;
   Color? BottomColor;
   CustomizedOnboardingContainer ({
     this.BottomColor,

     this.Body,
     this.title,
      required this.onpressed,
     this.onpressed2,
     this.backgroungColor,
     this.BodyStyle,
     this.TextBottom2,
     required this.TextBottom,
     this.TextBottomStyle,
     this.titleStyle,
     this.TextBottom2Style,


   });






   @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),color:backgroungColor?? AppColors.blackColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  SizedBox(height: height*0.04,),

            Text(title??"",style:titleStyle?? AppStyles.bold24WhiteInter,textAlign: TextAlign.center,),
            Text(Body??"",style:BodyStyle?? AppStyles.regular20WhiteInter,textAlign: TextAlign.center),
            SizedBox(height:height *0.01,),
            CustomeizedElevatedButtom(text:TextBottom,style:TextBottomStyle??AppStyles.semiBold20BlackInter ,onpressed: onpressed,),
            SizedBox(height:height *0.02,),

            TextBottom2==null?SizedBox(height: 0,): CustomeizedElevatedButtom(text:TextBottom2??"",style:TextBottom2Style??AppStyles.semiBold20BlackInter ,onpressed: onpressed2,color:BottomColor ,),
           // SizedBox(height: height*,)

          ],
        ),
      ),
    );



  }
}
