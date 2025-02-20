import '../../../../../../model/MovieDetailsResponse.dart' show MovieDetailsResponse;

abstract class WatchlistState {}

class WatchlistInitialState extends WatchlistState {}

class State extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<MovieDetailsResponse> movies;
  WatchlistLoaded(this.movies);
}

class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}

class MovieAddedToWatchlist extends WatchlistState {}

class MovieRemovedFromWatchlist extends WatchlistState {}

class MovieFavoriteStatusChecked extends WatchlistState {
  final bool isFavorite;
  MovieFavoriteStatusChecked(this.isFavorite);
}
