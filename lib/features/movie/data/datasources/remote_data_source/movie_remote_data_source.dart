import 'package:starter_temp/features/movie/data/models/now_playing_movie_model.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';

abstract class MovieRemoteDatasource {
  Future<List<NowPlayingMovieModel>> nowPlayingMovie();
}

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final ApiConsumer apiConsumer;

  MovieRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<List<NowPlayingMovieModel>> nowPlayingMovie() async {
    final response = await apiConsumer.get(EndPoints.nowPlayingMovies);
    return List<NowPlayingMovieModel>.from(
      (response['results'] as List).map(
        (movie) => NowPlayingMovieModel.fromJson(movie),
      ),
    );
  }
}
