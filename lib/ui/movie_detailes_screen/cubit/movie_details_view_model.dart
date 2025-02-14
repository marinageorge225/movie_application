import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../repository/movie_details/repository/movie_list_repository.dart';
import 'movie_details-states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepository repository;

  MovieDetailsCubit({required this.repository}) : super(MovieDetailsLoading());

  void getMovieDetails(int movieId) async {
    try {
      emit(MovieDetailsLoading());
      final response = await repository.getMovieDetails(movieId);

      if (response != null && response.data?.movie != null) {
        emit(MovieDetailsSuccess(response.data!.movie!));
      } else {
        emit(MovieDetailsError("No details found."));
      }
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
