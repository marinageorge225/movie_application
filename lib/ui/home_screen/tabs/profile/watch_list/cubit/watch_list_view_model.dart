import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_states.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

 import '../../../../../../model/MovieDetailsResponse.dart';
import '../../../../../../repository/watch_list/repository/watch_List_repository.dart' show WatchListRepository;

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  final WatchListRepository repository;

  WatchListCubit({required this.repository}) : super(WatchListInitialState());


   Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }
  Future<void> addToWatchlist(String movieId, Map<String, dynamic> movieData) async {
    emit(WatchListLoadingState());
    try {
      final token = await getToken();
      if (token == null) throw Exception("User not logged in");
      await repository.addToWatchlist(token, movieData);
      emit(WatchListSuccessState([]));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }

  Future<void> removeFromWatchlist(String movieId) async {
    emit(WatchListLoadingState());
    try {
      final token = await getToken();
      if (token == null) throw Exception("User not logged in");
      await repository.removeFromWatchlist(token, movieId);
      emit(WatchListSuccessState([]));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }

  Future<void> getWatchlist() async {
    emit(WatchListLoadingState());
    try {
      final token = await getToken();
      if (token == null) throw Exception("User not logged in");
      final watchlistData = await repository.getWatchlist(token);
      final movies = watchlistData.map((movie) => MovieDetailsResponse.fromJson(movie)).toList();
      emit(WatchListSuccessState(movies));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }

  Future<void> isMovieInWatchlist(String movieId) async {
    emit(WatchListLoadingState());
    try {
      final token = await getToken();
      if (token == null) throw Exception("User not logged in");
      final isFavorite = await repository.isMovieInWatchlist(token, movieId);
      emit(MovieCheckState(isFavorite));
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }
  Future<void> toggleWatchlist(String movieId, Map<String, dynamic> movieData) async {
    emit(WatchListLoadingState());
    try {
      final token = await getToken();
      if (token == null) throw Exception("User not logged in");

      final isSaved = await repository.isMovieInWatchlist(token, movieId);
      if (isSaved) {
        await repository.removeFromWatchlist(token, movieId);
      } else {
        await repository.addToWatchlist(token, movieData);
      }

      emit(WatchListSuccessState([]));
      await isMovieInWatchlist(movieId);
    } catch (e) {
      emit(WatchListErrorState(e.toString()));
    }
  }

}


