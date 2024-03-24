import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/con_bar.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    firstOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RpColors.whiteF1F3F6,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 313.w,
              height: 268.h,
            ),
          ),
        ],
      ),
    );
  }

  firstOpen() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RpBottomBar(),
      ),
    );
  }
}
