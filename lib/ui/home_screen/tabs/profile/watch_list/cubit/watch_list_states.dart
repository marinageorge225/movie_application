import '../../../../../../model/MovieDetailsResponse.dart';

abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListLoaded extends WatchListState {
  final List<MovieDetailsResponse> movies;
  WatchListLoaded(this.movies);
}

class WatchListError extends WatchListState {
  final String message;
  WatchListError(this.message);
}

 class MovieCheckState extends WatchListState {
  final bool isFavorite;
  MovieCheckState(this.isFavorite);
}
