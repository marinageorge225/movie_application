import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class SeeMoreStates{}
class SeeMoreLoadingState extends SeeMoreStates{}
class SeeMoreSuccessState extends SeeMoreStates{
  List <Movie> movieList;
  SeeMoreSuccessState({required this.movieList});
}
class SeeMoreErrorState extends SeeMoreStates{
  String errorMsg;
  SeeMoreErrorState({required this.errorMsg});
}