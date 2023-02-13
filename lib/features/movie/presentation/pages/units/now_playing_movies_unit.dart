part of '../movie_home_view.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieError) {
          return ErrorView(
            onPress: () =>
                MagicRouter.navigateAndReplacement(const MainMoviesScreen()),
          );
        } else if (state is MovieLoaded) {
          return FadeIn(
            duration: const Duration(
                milliseconds: AppConstants.carouselAnimationDuration),
            child: CarouselSlider(
              options: CarouselOptions(
                height: context.height / 1.5,
                viewportFraction: 1,
                onPageChanged: (index, reason) {},
              ),
              items: state.nowPlayingMovies.map(
                (item) {
                  return GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            alignment: Alignment.center,
                            height: context.height / 2,
                            imageUrl: AppStrings.imageUrl(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                        bottom: AppPadding.p16)
                                    .r,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      size: AppSize.s16,
                                    ),
                                    SizedBox(width: 4.0.w),
                                    Text(
                                      AppStrings.nowPlaying.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: AppSize.s16,
                                        color: theme.onBackground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                        bottom: AppPadding.p16)
                                    .r,
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: FontSize.s24,
                                    color: theme.onBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );
        }
        return const Center(
          child: Text(AppStrings.error),
        );
      },
    );
  }
}
