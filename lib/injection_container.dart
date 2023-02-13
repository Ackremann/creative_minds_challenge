import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_temp/features/movie/data/datasources/local_data_source/movie_local_data_source.dart';
import 'package:starter_temp/features/movie/data/datasources/remote_data_source/movie_remote_data_source.dart';
import 'package:starter_temp/features/movie/data/repositories/movie_repo_impl.dart';
import 'package:starter_temp/features/movie/domain/repositories/movie_repo.dart';
import 'package:starter_temp/features/movie/domain/usecases/now_playing_movie.dart';
import 'package:starter_temp/features/movie/presentation/cubit/movie_cubit.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Blocs
  sl.registerFactory<MovieCubit>(
      () => MovieCubit(nowPlayingMoviesUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<NowPlayingMoviesUseCase>(
      () => NowPlayingMoviesUseCase(movieRepo: sl()));

  // Repository
  sl.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(
      networkInfo: sl(),
      movieRemoteDatasource: sl(),
      movieLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<MovieRemoteDatasource>(
      () => MovieRemoteDatasourceImpl(apiConsumer: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
