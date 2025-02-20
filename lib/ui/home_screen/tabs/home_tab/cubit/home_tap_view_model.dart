import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/movieList/repository/movie_List_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  //TODO: hold data & handle logic
  MovieListRepository movieListRepository;
  HomeTabViewModel({required this.movieListRepository}):super(HomeTabLoadingState());
  String selectedGenre = '';
  int bgImageIndex = 0;
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
  'Western'
  ];

  void getMovies() async {
    try {
      emit(HomeTabLoadingState());

      final response = await movieListRepository.getMovies();

      if (response != null && response.data?.movies != null) {
        var movies = response.data!.movies!;

        movies.sort((a, b) {
          int yearComparison = (b.year ?? 0).compareTo(a.year ?? 0);
          if (yearComparison != 0) {
            return yearComparison;
          }
          return (b.dateUploadedUnix ?? 0).compareTo(a.dateUploadedUnix ?? 0);
        });

        emit(HomeTabTopPartSuccessState(movies));
      } else {
        emit(HomeTabTopPartErrorState("No movies found."));
      }
    } catch (e) {
      emit(HomeTabTopPartErrorState(e.toString()));
    }
  }

  void getMovieList(String genre) async{
    try {
      emit(HomeTabLoadingState());
      var response = await movieListRepository.getMovieListByGenre(genre);
      if (response!.status == 'error') {
        emit(HomeTabBottomPartErrorState(errorMessage: response.statusMessage!));
      } else {
        emit(HomeTabBottomPartSuccessState(movieList: response.data!.movies!));
      }
    }catch(e){
      print("From home tab view model ${e.toString()}");
      emit(HomeTabBottomPartErrorState(errorMessage: e.toString()));
    }
  }

  void changeGenre(){
    final random = Random();
    selectedGenre = (genresList..shuffle(random)).first;
  }

  void changeBgImageIndex(int index){
    bgImageIndex = index;
    emit(ChangeBgImageIndex());
  }
}