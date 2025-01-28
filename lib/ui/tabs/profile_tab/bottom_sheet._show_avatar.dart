import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import '../../../utils/assets_manager.dart';
import 'image_item.dart';

class BottomSheetShowAvatars extends StatelessWidget {
  List<String> avatars=
  [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return
        Container(
          decoration: BoxDecoration(color:AppColors.darkGrayColor,
            borderRadius: BorderRadius.circular(24),),
          margin:EdgeInsets.symmetric(horizontal: width*(16/430),vertical: height*(17/932)) ,
          child: GridView.builder(gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder:(context,index){
                return ImageItem(imageName: avatars[index]);
              },
              itemCount: avatars.length,

          ),
        );
  }
}
