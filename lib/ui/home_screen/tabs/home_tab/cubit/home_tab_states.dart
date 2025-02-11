import 'package:graduation_movie_app/model/movie_list_response.dart';

abstract class HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{}
class HomeTabErrorState extends HomeTabStates{
  String errorMessage ;
  HomeTabErrorState({required this.errorMessage});
}
class HomeTabSuccessState extends HomeTabStates{
  List <Movie> movieList ;
  HomeTabSuccessState({required this.movieList});
}
class ChangeGenre extends HomeTabStates{}