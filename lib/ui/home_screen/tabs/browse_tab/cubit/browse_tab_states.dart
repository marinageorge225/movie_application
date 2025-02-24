import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class BrowseTabStates{}
class BrowseTabInitialState extends BrowseTabStates{}
class BrowseTabLoadingState extends BrowseTabStates{}
class BrowseTabSuccessState extends BrowseTabStates{
  List<Movie> movieList;
  BrowseTabSuccessState({required this.movieList});
}
class BrowseTabErrorState extends BrowseTabStates{
  String errorMsg;
  BrowseTabErrorState({required this.errorMsg});
}
class ChangeTabSelectedIndex extends BrowseTabStates {
  final int selectedIndex;
  ChangeTabSelectedIndex({required this.selectedIndex});
}