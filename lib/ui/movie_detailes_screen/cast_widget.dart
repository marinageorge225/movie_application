import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_styles.dart';

class CastWidget extends StatelessWidget {
  Movie movie;
  CastWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.015),
      itemCount: movie.cast!.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: height * 0.015);
      },
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.011, horizontal: width * 0.02),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Image with null check
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movie.cast![index].urlSmallImage ?? '',
                  placeholder: (context, url) => const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.orangeColor),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error, color: AppColors.whiteColor),
                  ),
                ),
              ),

              SizedBox(
                width: width * 0.02,
              ),
              // Cast Info with null checks
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Name: ${movie.cast![index].name ?? 'Unknown'}',
                    style: AppStyles.regular16WhiteRoboto,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  AutoSizeText(
                    'Character: ${movie.cast![index].characterName ?? 'Unknown'}',
                    style: AppStyles.regular16WhiteRoboto,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
