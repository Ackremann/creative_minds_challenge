// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:starter_temp/features/movie/data/models/now_playing_movie_model.dart';
import 'package:starter_temp/features/movie/domain/entities/movie.dart';
import 'package:starter_temp/features/movie/domain/usecases/now_playing_movie.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/strings_manager.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required this.nowPlayingMoviesUseCase,
  }) : super(MovieInitial());
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  static MovieCubit of(context) => BlocProvider.of(context);

  Future<void> getNowPlayingMovie() async {
    emit(MovieLoading());
    Either<Failure, List<Movie>> response =
        await nowPlayingMoviesUseCase(NoParams());
    emit(
      response.fold(
        (failure) => MovieError(msg: mapFailureToMsg(failure)),
        (movieEntityList) => MovieLoaded(
          nowPlayingMovies: List<NowPlayingMovieModel>.from(
            movieEntityList.map(
              (entity) => NowPlayingMovieModel.fromEntity(entity),
            ),
          ),
        ),
      ),
    );
  }
}

