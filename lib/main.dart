import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RateWatch Prime',
        home: child,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: RpColors.whiteF1F3F6,
          appBarTheme: const AppBarTheme(
            backgroundColor: RpColors.whiteF1F3F6,
          ),
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
