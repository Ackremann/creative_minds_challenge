import 'package:starter_temp/core/api/end_points.dart';

class AppStrings {
  static const String cachedNowPlayingMovies = 'Now_playing_movies';
  static String imageUrl(String path) => '${EndPoints.baseImageUrl}$path';
  static const String appName = '';
  static const String error = 'error';
  static const String nowPlaying = 'Now Playing';
  static const String serverFailure = 'serverFailure';
  static const String cacheFailure = 'cacheFailure';
  static const String offlineFailure = 'offlineFailure';
  static const String unexpectedError = 'unexpectedError';
}
