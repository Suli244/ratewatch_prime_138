import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';

class SetItWidalsbjcsdvd extends StatelessWidget {
  const SetItWidalsbjcsdvd({
    super.key,
    required this.text,
    required this.onPressed,
    this.isColor = true,
  });
  final String text;
  final Function()? onPressed;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: RpMotion(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: isColor ? RpColors.white : RpColors.yellowFECA13,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: isColor
                        ? RpColors.grey333333.withOpacity(0.8)
                        : RpColors.grey333333,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: isColor
                      ? RpColors.grey333333.withOpacity(0.5)
                      : RpColors.grey333333,
                  size: 32.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
