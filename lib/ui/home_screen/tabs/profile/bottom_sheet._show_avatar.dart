import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/assets_manager.dart';
import 'image_item.dart';

class BottomSheetShowAvatars extends StatefulWidget {
  Function(String) saveImage;
  final String? selectedAvatar;

  BottomSheetShowAvatars({required this.selectedAvatar, required this.saveImage});


  @override
  State<BottomSheetShowAvatars> createState() => _BottomSheetShowAvatarsState();
}

class _BottomSheetShowAvatarsState extends State<BottomSheetShowAvatars> {
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
  String? selectedAvatar;
   @override
   void initState() {
     super.initState();
      selectedAvatar =widget.selectedAvatar;
   }
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
                return InkWell(
                  onTap: (){
                    setState(() {
                      widget.saveImage(avatars[index]);

                    });
                  },
                    child:
                ImageItem(imageName: avatars[index],
                    saveImage: widget.saveImage,
                    isSelected: avatars[index] == selectedAvatar));
              },
              itemCount: avatars.length,

          ),
        );
  }
}
