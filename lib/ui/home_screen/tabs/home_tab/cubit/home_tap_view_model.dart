import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/model/movie_genres.dart';
import 'package:graduation_movie_app/repository/movieList/repository/movie_List_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_manger.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  //TODO: hold data & handle logic
  MovieListRepository movieListRepository;
  HomeTabViewModel({required this.movieListRepository}):super(HomeTabLoadingState());
  String selectedGenre = 'Action';

  void getMovieList(String genre) async{
    try {
      emit(HomeTabLoadingState());
      var response = await movieListRepository.getMovieListByGenre(genre);
      if (response!.status == 'error') {
        emit(HomeTabErrorState(errorMessage: response.statusMessage!));
      } else {
        emit(HomeTabSuccessState(movieList: response.data!.movies!));
      }
    }catch(e){
      print("From home tab view model ${e.toString()}");
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }

  void changeGenre(){
    selectedGenre = (MovieGenres.movieGenresList..shuffle()).first;
  }
}