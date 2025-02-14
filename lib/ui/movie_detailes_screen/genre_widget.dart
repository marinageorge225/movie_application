import 'package:flutter/material.dart';
import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_styles.dart';

class GenreWidget extends StatelessWidget {
  Movie movie;
  GenreWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        itemCount: movie.genres!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:  EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.02),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 11,
          childAspectRatio: 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              movie.genres![index],
              style: AppStyles.regular16WhiteRoboto,
            ),
          );
        });
  }
}
