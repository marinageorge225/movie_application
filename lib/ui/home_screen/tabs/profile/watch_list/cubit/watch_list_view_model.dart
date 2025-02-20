import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/watch_list/repository/watch_list_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchListViewModel extends Cubit<WatchlistState> {
  final WatchListRepository watchListRepository;

  WatchListViewModel(this.watchListRepository) : super(WatchlistInitialState());

  Future<void> getFavoriteMovies(String token) async {
    emit(WatchlistInitialState());
    try {
      final movies = await watchListRepository.getAllFavoriteMovies(token);
      if (movies != null) {
        emit(WatchlistLoaded(movies));
      } else {
        emit(WatchlistError("Failed to load watchlist."));
      }
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> addMovieToWatchlist(Map<String, dynamic> movieData, String token) async {
    try {
      final response = await watchListRepository.addMovieToFavorites(movieData, token);
      if (response != null) {
        emit(MovieAddedToWatchlist());
        getFavoriteMovies(token); // تحديث القائمة بعد الإضافة
      } else {
        emit(WatchlistError("Failed to add movie to watchlist."));
      }
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
  Future<void> removeMovieFromWatchlist(String movieId, String token) async {
    try {
      final success = await watchListRepository.removeMovieFromFavorites(movieId, token);
      if (success) {
        emit(MovieRemovedFromWatchlist());
        getFavoriteMovies(token);
      } else {
        emit(WatchlistError("Failed to remove movie from watchlist."));
      }
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
  Future<void> checkIfMovieIsFavorite(String movieId, String token) async {
    try {
      final isFavorite = await watchListRepository.isMovieFavorite(movieId, token);
      emit(MovieFavoriteStatusChecked(isFavorite));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
}
