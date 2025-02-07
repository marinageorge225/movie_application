import 'package:flutter/material.dart';


class AvatarWidget  extends StatelessWidget {
  String avatarPATH;


  AvatarWidget ({required this.avatarPATH});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return
      Container(//decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.orangeColor ),
      height:  height*0.07,
      width:  width*0.2,
      //color: AppColors.orangeColor,
      child: Image.asset(avatarPATH,fit: BoxFit.fill,),





    );
  }
}
