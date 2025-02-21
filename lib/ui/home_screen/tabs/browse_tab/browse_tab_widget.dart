import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/browse_tab/cubit/browse_tab_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/browse_tab/cubit/browse_tab_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/movie_item.dart';
import 'package:graduation_movie_app/ui/widgets/genre_tab_bar_widget.dart';

import '../../../../core/utils/app_styles.dart';

class BrowseTab extends StatelessWidget {
  BrowseTabViewModel viewModel = getIt<BrowseTabViewModel>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        DefaultTabController(
          length: viewModel.genresList.length,
          initialIndex: 0,
          child: BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
            bloc: viewModel..resetTabIndex(),
            builder: (context, state) {
              return TabBar(
                padding: EdgeInsets.symmetric(horizontal: (16/430)* width),
                  onTap:(index){
                    viewModel.changeTabSelectedIndex(index);
                    viewModel.getMoviesByGenre(viewModel.genresList[index]);
                  } ,
                  isScrollable: true,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  tabAlignment: TabAlignment.start,

                  labelPadding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.02),
                  tabs: viewModel.genresList.map((genre) {
                    return GenreTabBarWidget(
                        genre: genre,
                        isSelected: viewModel.tabSelectedIndex ==
                            viewModel.genresList.indexOf(genre));
                  }).toList());
            },
          ),
        ),
        BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
          bloc: viewModel..getMoviesByGenre(viewModel.genresList[viewModel.tabSelectedIndex]),
          builder: (context, state) {
            if (state is BrowseTabLoadingState) {
              return  Center(
                heightFactor: height / 50,
                child: const CircularProgressIndicator(
                  color: AppColors.orangeColor,
                ),
              );
            } else if (state is BrowseTabErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      state.errorMsg,
                      style: AppStyles.bold20WhiteRoboto,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orangeColor),
                        onPressed: () {
                          viewModel.getMoviesByGenre(
                              viewModel.genresList[viewModel.tabSelectedIndex]);
                        },
                        child: Text(
                          'Try Again',
                          style: AppStyles.regular20BlackRoboto,
                        ))
                  ],
                ),
              );
            } else if (state is BrowseTabSuccessState) {
              Set movieSet = state.movieList.toSet();
              return Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(right: (16/430)* width,left: (16/430)* width, bottom: 0.01 * height),
                    itemCount: movieSet.length ,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 189/279,
                          crossAxisCount: 2,
                        mainAxisSpacing: (10/932) * height,
                        crossAxisSpacing: (20/430) * width
                          ),
                      itemBuilder: (context, index) {
                        var movie = movieSet.elementAt(index);
                        return MovieItem(
                          borderRadius: 10,
                          imageWidth: (189/430) * width,
                            imageHeight: (279/932) * height,
                            movie: movie);
                      }));
            }
            return Container();
          },
        )
      ],
    );
  }
}


