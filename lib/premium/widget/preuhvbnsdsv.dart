
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';

class PremiItemkjsbvsdvsdvd extends StatelessWidget {
  const PremiItemkjsbvsdvsdvd({
    super.key,
    required this.titlePremi,
  });

  final String titlePremi;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: RpColors.white,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icons/premi_icon.png',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 10.w),
              Text(
                titlePremi,
                style: TextStyle(
                  color: RpColors.grey333333,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
