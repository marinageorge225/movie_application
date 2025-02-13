import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

class ShowScreenShot extends StatelessWidget {
  String imageUrl;
   ShowScreenShot({required this.imageUrl});

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
    return
      Container(
        margin: EdgeInsets.symmetric(horizontal: width*(16/430)),
        child: ClipRRect(borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          height:height*(167/932) ,
          width: double.infinity,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Center(child:
             const CircularProgressIndicator(color: AppColors.orangeColor,),),
          imageUrl:imageUrl,

          errorWidget: (context, url, error) => const Icon(Icons.error,color: AppColors.orangeColor,),
        ),),
      );

  }
}
