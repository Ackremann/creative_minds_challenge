import 'package:dartz/dartz.dart';
import 'package:starter_temp/features/movie/domain/entities/movie.dart';

import '../../../../core/error/failures.dart';

abstract class MovieRepo {
   Future<Either<Failure, List<Movie>>> nowPlayingMovies();
}
