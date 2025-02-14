import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/model/movie_list_response.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets_manager.dart';

class MovieItem extends StatelessWidget {
  Movie movie;
  double? imageHeight;
  double? imageWidth;
  MovieItem({required this.movie, this.imageHeight, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      Stack(
      alignment: Alignment.topLeft,
      children: [
      ClipRRect(
        borderRadius:BorderRadius.circular(20),
        child: CachedNetworkImage(
          width: imageWidth ?? width * 0.33,
          height: imageHeight,
          fit: BoxFit.fill,
          imageUrl: movie.mediumCoverImage ?? '',
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.orangeColor,)),
          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: AppColors.whiteColor,)),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: height * 0.03,
        width: width * 0.13,
         margin: EdgeInsets.symmetric(horizontal: width * 0.025, vertical: height * 0.013) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.transparentBlack,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${movie.rating}', style: AppStyles.regular16WhiteRoboto,),
            SizedBox(width: width * 0.01,),
            const ImageIcon(AssetImage(AssetsManager.starIcon), color: AppColors.orangeColor, size: 15,)
          ],
        ),
      )
    ],);

  }
}
