
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:graduation_movie_app/ui/movie_detailes_screen/repository/repository/source_repository.dart';
 import 'movie_details-states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final SourceRepository repository;

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
