import '../../../../../model/MovieListResponse.dart';

abstract class HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{}


class HomeTabTopPartSuccessState extends HomeTabStates{
  final List<Movie> movies;
  HomeTabTopPartSuccessState(this.movies);
}
class HomeTabTopPartErrorState extends HomeTabStates{
  final String error;
  HomeTabTopPartErrorState(this.error);
}


class HomeTabBottomPartErrorState extends HomeTabStates{
  String errorMessage ;
  HomeTabBottomPartErrorState({required this.errorMessage});
}
class HomeTabBottomPartSuccessState extends HomeTabStates{
  List <Movie> movieList ;
  HomeTabBottomPartSuccessState({required this.movieList});
}

class ChangeBgImageIndex extends HomeTabStates{}
