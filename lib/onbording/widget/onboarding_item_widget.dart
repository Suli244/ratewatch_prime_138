import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imageOnBoar,
    required this.titleOnBoar,
  });
  final String imageOnBoar;
  final String titleOnBoar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imageOnBoar,
          width: 334.w,
          height: 334.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 100.h),
        Text(
          titleOnBoar,
          style: TextStyle(
            fontSize: 25.h,
            fontWeight: FontWeight.w700,
            color: RpColors.grey333333,
            height: 0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
