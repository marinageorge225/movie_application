
import '../../../../../../model/MovieDetailsResponse.dart';

abstract class WatchListState {}

class WatchListInitialState extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  final List<MovieDetailsResponse> movies;
  WatchListSuccessState(this.movies);
}

class WatchListErrorState extends WatchListState {
  final String message;
  WatchListErrorState(this.message);
}

 class MovieCheckState extends WatchListState {
  final bool isFavorite;
  MovieCheckState(this.isFavorite);
}
