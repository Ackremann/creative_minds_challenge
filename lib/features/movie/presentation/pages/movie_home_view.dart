import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_temp/config/routes/magic_router.dart';
import 'package:starter_temp/core/utils/constants_manager.dart';
import 'package:starter_temp/core/utils/media_query_values.dart';
import 'package:starter_temp/core/utils/strings_manager.dart';
import 'package:starter_temp/core/widgets/error_page.dart';
import 'package:starter_temp/features/movie/presentation/cubit/movie_cubit.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../injection_container.dart';
part 'units/now_playing_movies_unit.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieCubit>()..getNowPlayingMovie(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NowPlayingMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
