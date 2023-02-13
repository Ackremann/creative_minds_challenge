// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:starter_temp/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:starter_temp/features/movie/data/datasources/local_data_source/movie_local_data_source.dart';
import 'package:starter_temp/features/movie/data/datasources/remote_data_source/movie_remote_data_source.dart';
import 'package:starter_temp/features/movie/domain/entities/movie.dart';
import 'package:starter_temp/features/movie/domain/repositories/movie_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class MovieRepoImpl implements MovieRepo {
  final NetworkInfo networkInfo;
  final MovieRemoteDatasource movieRemoteDatasource;
  final MovieLocalDataSource movieLocalDataSource;
  MovieRepoImpl({
    required this.networkInfo,
    required this.movieRemoteDatasource,
    required this.movieLocalDataSource,
  });
  @override
  Future<Either<Failure, List<Movie>>> nowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await movieRemoteDatasource.nowPlayingMovie();
        movieLocalDataSource.cacheNowPlayingMovie(response);
        return Right(response);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      try {
        final cacheNowPlayingMovies =
            await movieLocalDataSource.getLastNowPlayingMovies();
        return Right(cacheNowPlayingMovies);
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }
}
  

