import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_temp/config/theme/theme_manager.dart';
import 'package:starter_temp/core/widgets/error_page.dart';
import 'package:starter_temp/features/movie/presentation/pages/movie_home_view.dart';
import 'package:starter_temp/features/splash/splash_view.dart';
import '../config/routes/magic_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
          onGenerateRoute: onGenerateRoute,
          themeMode: ThemeMode.dark,
          theme: getApplicationTheme(),
          navigatorKey: navigatorKey,
          // localizationsDelegates: const [
          //   GlobalCupertinoLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
          // ],
          // locale: const Locale(
          //     "ar", "EG") // OR Locale('ar', 'AE') OR Other RTL locales,
        );
      },
    );
  }
}
