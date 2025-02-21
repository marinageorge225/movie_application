import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/shared_preferences/watchlist_service.dart';

class PreferenseWatchListCubit extends Cubit<List<String>> {
  PreferenseWatchListCubit() : super([]);

   Future<void> loadWatchlist() async {
    final movies = await WatchlistService.getWatchlistMovies();
    emit(movies);
  }

   Future<void> toggleMovieInWatchlist(String movieId) async {
    await WatchlistService.saveMovieToWatchlist(movieId);
    await loadWatchlist();
  }
}
