import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart'
    as ListResponse;
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/movie_item.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/search_tab/cubit/search_tab_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/search_tab/cubit/search_tab_view_model.dart';

import '../../../widgets/custom_text_field.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  late ApiManager apiManager;
  late SearchTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    apiManager = ApiManager();
    viewModel = SearchTabViewModel(apiManager: apiManager);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: CustomTextField(
            controller: searchController,
            hintText: "Search movies...",
            keyBoardType: TextInputType.text,
            prefixIcon: const ImageIcon(AssetImage(AssetsManager.searchIcon)),
            onChanged: (value) {
              viewModel.searchMovies(value);
            },
          ),
        ),
        BlocBuilder<SearchTabViewModel, SearchStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is SearchLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.orangeColor,
              ));
            } else if (state is SearchErrorState) {
              return Center(
                child: Text(state.error.errorMessage,
                    style: AppStyles.regular20WhiteRoboto),
              );
            } else if (state is SearchSuccessState) {
              return buildMovieList(state.moviesList);
            }
            return Expanded(
              child: Center(
                  heightFactor: height / 180,
                  child: Image.asset(AssetsManager.noItemsFoundImage)
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildMovieList(List<ListResponse.Movie> movies) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieItem(
            movie: movie,
            imageHeight: 0.45 * height,
            imageWidth: 0.5 * width,
          );
        },
      ),
    );
  }
}
