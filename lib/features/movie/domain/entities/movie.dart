import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String imagePath;
  const Movie({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  @override
  List<Object> get props => [id, title, imagePath];
}
