import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/movieList/repository/movie_List_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/browse_tab/cubit/browse_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates> {
  MovieListRepository movieListRepository;

  BrowseTabViewModel({required this.movieListRepository})
      :super(BrowseTabInitialState());

  List <String> genresList = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'Film-Noir',
    'Game-Show',
    'History',
    'Horror',
    'Music',
    'Musical',
    'Mystery',
    'News',
    'Reality-Tv',
    'Romance',
    'Sci-Fi',
    'Short',
    'Sport',
    'Talk-Show',
    'Thriller',
    'War',
    'Western',
  ];
  int tabSelectedIndex = 0;

  void getMoviesByGenre(String genre) async {
    try {
      emit(BrowseTabLoadingState());
      var response = await movieListRepository.getMovieListByGenre(genre);
      if (response!.status == 'error') {
        emit(BrowseTabErrorState(errorMsg: response.statusMessage!));
      } else {
        emit(BrowseTabSuccessState(movieList: response.data!.movies!));
      }
    } catch (e) {
      print("From home tab view model ${e.toString()}");
      emit(BrowseTabErrorState(errorMsg: e.toString()));
    }
  }

  void changeTabSelectedIndex(int index) {
    tabSelectedIndex = index;
    emit(ChangeTabSelectedIndex(selectedIndex: index)); // Include updated index
  }

  void resetTabIndex() {
    tabSelectedIndex = 0;
    emit(ChangeTabSelectedIndex(selectedIndex: tabSelectedIndex));
  }

}