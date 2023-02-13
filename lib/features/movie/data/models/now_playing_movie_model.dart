import 'dart:convert';

import 'package:starter_temp/features/movie/domain/entities/movie.dart';

class NowPlayingMovieModel extends Movie {
  const NowPlayingMovieModel({
    required int id,
    required String title,
    required String imagePath,
  }) : super(id: id, title: title, imagePath: imagePath);
  factory NowPlayingMovieModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMovieModel(
      id: json['id'],
      title: json['title'],
      imagePath: json['backdrop_path'],
    );
  }
  static Map<String, dynamic> toJson(NowPlayingMovieModel movie) => {
        "id": movie.id,
        "title": movie.title,
        "backdrop_path": movie.imagePath,
      };
  factory NowPlayingMovieModel.fromEntity(Movie entity) {
    return NowPlayingMovieModel(
      id: entity.id,
      title: entity.title,
      imagePath: entity.imagePath,
    );
  }
  static String encode(List<NowPlayingMovieModel> movies) => json.encode(
        movies
            .map<Map<String, dynamic>>(
                (movie) => NowPlayingMovieModel.toJson(movie))
            .toList(),
      );
  static List<NowPlayingMovieModel> decode(String movies) => (json
          .decode(movies) as List<dynamic>)
      .map<NowPlayingMovieModel>((item) => NowPlayingMovieModel.fromJson(item))
      .toList();
}
