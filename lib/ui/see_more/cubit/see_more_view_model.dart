import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/movieList/repository/movie_List_repository.dart';
import 'package:graduation_movie_app/ui/see_more/cubit/see_more_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class SeeMoreViewModel extends Cubit<SeeMoreStates>{
  MovieListRepository movieListRepository;
  SeeMoreViewModel({required this.movieListRepository}):super(SeeMoreLoadingState());

  void getMoviesByGenre(String genre)async{
    try {
      emit(SeeMoreLoadingState());
      var response = await movieListRepository.getMovieListByGenre(genre);
      if (response!.status == 'error') {
        emit(SeeMoreErrorState(errorMsg: response.statusMessage!));
      } else {
        emit(SeeMoreSuccessState(movieList: response.data!.movies!));
      }
    }catch(e){
      print("From home tab view model ${e.toString()}");
      emit(SeeMoreErrorState(errorMsg: e.toString()));
    }
  }
}