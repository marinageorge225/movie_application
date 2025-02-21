import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../model/MovieDetailsResponse.dart';
import '../../../../../../repository/watch_list/repository/watch_List_repository.dart' show WatchListRepository;

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  final WatchListRepository repository;

  WatchListCubit({required this.repository}) : super(WatchListInitial());

  Future<void> fetchWatchlist(String token) async {
    emit(WatchListLoading());
    try {
      final movies = await repository.getWatchlist(token);
      emit(WatchListLoaded(movies));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  Future<void> addMovieToWatchlist(MovieDetailsResponse movie, String token) async {
    try {
      await repository.addToWatchlist(movie, token);

      // تحديث القائمة بدون إعادة تحميلها من الـ API
      if (state is WatchListLoaded) {
        final updatedMovies = List<MovieDetailsResponse>.from((state as WatchListLoaded).movies)..add(movie);
        emit(WatchListLoaded(updatedMovies));
      } else {
        fetchWatchlist(token);
      }
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  Future<void> removeMovieFromWatchlist(String movieId, String token) async {
    try {
      emit(WatchListLoading());
      await repository.removeFromWatchlist(movieId, token);
      await fetchWatchlist(token);
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }


  Future<void> checkMovieInWatchlist(String movieId, String token) async {
    try {
      final isFavorite = await repository.isMovieInWatchlist(movieId, token);

      if (state is MovieCheckState && (state as MovieCheckState).isFavorite == isFavorite) {
        return;
      }

      emit(MovieCheckState(isFavorite));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

}
