import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class ImageItem extends StatefulWidget {
  String imageName;
   Function(String) saveImage;
   bool isSelected;




  ImageItem({required this.imageName, required this.saveImage,required this.isSelected});

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return InkWell(onTap: (){
      setState(() {
        widget.saveImage(widget.imageName);
        widget.isSelected=!widget.isSelected;
        Navigator.pop(context);
      });

    },
      child: Container(clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        margin:EdgeInsets.symmetric(vertical:height*(19/932) ,horizontal:width*(13/430) ) ,
        padding: EdgeInsets.symmetric(vertical:height*(9/932) ,horizontal:width*(10/430) ),
        decoration: BoxDecoration(
          color: widget.isSelected==true? AppColors.orangeColorTransparent:AppColors.transparentColor,
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
