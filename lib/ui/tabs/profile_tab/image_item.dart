import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';

class ImageItem extends StatefulWidget {
  String imageName;

  ImageItem({required this.imageName});

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
bool? isSelected;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return InkWell(onTap: (){

    },
      child: Container(clipBehavior: Clip.antiAlias,
        margin:EdgeInsets.symmetric(vertical:height*(19/932) ,horizontal:width*(13/430) ) ,
        padding: EdgeInsets.symmetric(vertical:height*(9/932) ,horizontal:width*(10/430) ),
        decoration: BoxDecoration(
          color: isSelected==true? AppColors.orangeColor:AppColors.Transparent,
          border: Border.all(color: AppColors.orangeColor),
      borderRadius:const BorderRadius.all(Radius.circular(20),),),
        child: Stack(
          children: [
            Image.asset(widget.imageName),
          ],
        ),
      ),
    );
  }
}
