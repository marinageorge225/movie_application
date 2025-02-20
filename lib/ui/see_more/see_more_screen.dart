import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/ui/see_more/cubit/see_more_states.dart';
import 'package:graduation_movie_app/ui/see_more/cubit/see_more_view_model.dart';
import '../../core/utils/app_styles.dart';
import '../home_screen/tabs/home_tab/movie_item.dart';

class SeeMoreScreen extends StatelessWidget {
  static const String routeName = 'seeMore';

  SeeMoreViewModel viewModel = getIt<SeeMoreViewModel>();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('${args}'),
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<SeeMoreViewModel, SeeMoreStates>(
        bloc: viewModel..getMoviesByGenre(args),
          builder: (context, state){
            if(state is SeeMoreLoadingState){
              return const Center(child: CircularProgressIndicator(
                color: AppColors.orangeColor,
              ),);
            }else if(state is SeeMoreErrorState){
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
                          viewModel.getMoviesByGenre(args);
                        },
                        child: Text(
                          'Try Again',
                          style: AppStyles.regular20BlackRoboto,
                        ))
                  ],
                ),
              );
            } else if (state is SeeMoreSuccessState) {
              Set movieSet = state.movieList.toSet();
              return Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.only(right: (16/430)* width,left: (16/430)* width, bottom: 0.01 * height),
                      itemCount: movieSet.length ,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 189/279,
                          crossAxisCount: 3,
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
          }),
    );
  }
}
