// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<NowPlayingMovieModel> nowPlayingMovies;

  const MovieLoaded({required this.nowPlayingMovies});

  @override
  List<Object> get props => [nowPlayingMovies];
}

class MovieError extends MovieState {
  final String msg;
  const MovieError({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}

