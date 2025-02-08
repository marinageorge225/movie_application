import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/api_manger.dart';
import '../../../../../../model/MovieListResponse.dart';

abstract class HomeTabState {}

class HomeTabLoading extends HomeTabState {}

class HomeTabLoaded extends HomeTabState {
  final List<Movie> movies;

  HomeTabLoaded(this.movies);
}

class HomeTabError extends HomeTabState {
  final String error;

  HomeTabError(this.error);
}

class FirstPartHomeViewModel extends Cubit<HomeTabState> {
  FirstPartHomeViewModel() : super(HomeTabLoading());

  void getMovies() async {
    try {
      emit(HomeTabLoading());

      final response = await ApiManager.getMovies();

      if (response != null && response.data?.movies != null) {
        var movies = response.data!.movies!;

        movies.sort((a, b) {
          int yearComparison = (b.year ?? 0).compareTo(a.year ?? 0);
          if (yearComparison != 0) {
            return yearComparison;
          }
          return (b.dateUploadedUnix ?? 0).compareTo(a.dateUploadedUnix ?? 0);
        });

        emit(HomeTabLoaded(movies));
      } else {
        emit(HomeTabError("No movies found."));
      }
    } catch (e) {
      emit(HomeTabError(e.toString()));
    }
  }
}