import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter_temp/config/routes/magic_router.dart';
import 'package:starter_temp/core/utils/assets_manager.dart';
import 'package:starter_temp/core/utils/media_query_values.dart';
import 'package:starter_temp/features/movie/presentation/pages/movie_home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  navigate() {
    Timer(const Duration(seconds: 3), () {
      MagicRouter.navigateAndPopAll(const MainMoviesScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(ImageAssets.splashLogo2)),
          ),
          width: context.width / 1.5,
        ),
      ),
    );
  }
}
