import '../../../model/MovieDetailsResponse.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final Movie movie;
  MovieDetailsSuccess(this.movie);
}

class MovieDetailsError extends MovieDetailsState {
  final String error;
  MovieDetailsError(this.error);
}
