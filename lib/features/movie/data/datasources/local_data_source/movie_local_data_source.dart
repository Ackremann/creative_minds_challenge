import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_temp/features/movie/data/models/now_playing_movie_model.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/strings_manager.dart';

abstract class MovieLocalDataSource {
  Future<List<NowPlayingMovieModel>> getLastNowPlayingMovies();
  Future<void> cacheNowPlayingMovie(
      List<NowPlayingMovieModel> nowPlayingMovies);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheNowPlayingMovie(
      List<NowPlayingMovieModel> nowPlayingMovies) {
    final String encodeData = NowPlayingMovieModel.encode(nowPlayingMovies);
    return sharedPreferences.setString(
        AppStrings.cachedNowPlayingMovies, encodeData);
  }

  @override
  Future<List<NowPlayingMovieModel>> getLastNowPlayingMovies() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedNowPlayingMovies);
    if (jsonString != null) {
      final cachedNowPlayingMovies =
          Future.value(NowPlayingMovieModel.decode(jsonString));
      return cachedNowPlayingMovies;
    } else {
      throw CacheException();
    }
  }
}
