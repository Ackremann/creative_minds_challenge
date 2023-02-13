// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:starter_temp/core/error/failures.dart';
import 'package:starter_temp/core/usecases/usecase.dart';
import 'package:starter_temp/features/movie/domain/repositories/movie_repo.dart';
import '../entities/movie.dart';

class NowPlayingMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final MovieRepo movieRepo;
  NowPlayingMoviesUseCase({
    required this.movieRepo,
  });
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) =>
      movieRepo.nowPlayingMovies();
}
