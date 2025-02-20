import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart'
    as ListResponse;
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
            prefixIcon: Icon(Icons.search, color: AppColors.whiteColor),
            onChanged: (value) {
              viewModel.searchMovies(value);
            },
          ),
        ),
        BlocBuilder<SearchTabViewModel, SearchStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is SearchLoadingState) {
              return Center(
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
            return Center(
                child: Text(
              "Search for a movie...",
              style: AppStyles.regular20WhiteRoboto,
            ));
          },
        ),
      ],
    );
  }

  Widget buildMovieList(List<ListResponse.Movie> movies) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 7,
          childAspectRatio: 0.6,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.largeCoverImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.orangeColor, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          "${movie.rating}",
                          style: AppStyles.regular14WhiteRoboto,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
