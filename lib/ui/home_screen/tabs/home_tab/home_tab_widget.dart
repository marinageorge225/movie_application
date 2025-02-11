import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/model/movie_list_response.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/1st_part_home_tab/home_1st_part.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tap_bottom_part.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import 'cubit/1st_part_home_tab/home_1st_part_view_model.dart';

class HomeTab extends StatefulWidget {
  static const String routeName='HomeTab';
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<MovieListResponse?> movieListResponse ;
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.changeGenre();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Colors.grey,
                    AppColors.blackColor
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                      .createShader(bounds),
                  child: Image.asset(
                    AssetsManager.onboarding6ThImage,
                    width: double.infinity,
                    height: height * 0.69,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocProvider(
                      create: (context) => FirstPartHomeViewModel()..getMovies(),
                      child: FirstPartHome(),
                    ),

                    SizedBox(height: height * 0.03,),
                    Image.asset(AssetsManager.watchNowImage)
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                Expanded(
                  child: Text(
                    viewModel.selectedGenre,
                    style: AppStyles.regular20WhiteRoboto,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: AppStyles.regular16OrangeRoboto,
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.orangeColor,
                          size: 15,
                        )
                      ],
                    ))
              ],
            ),
            HomeTapBottomPart(
              genre: viewModel.selectedGenre,
            ),
            SizedBox(
              height: height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}