// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.isActiv = false,
    required this.onTap,
  });

  final String icon;
  final String title;
  final Function() onPressed;
  final Function() onTap;
  final bool isActiv;

  @override
  Widget build(BuildContext context) {
    return RpMotion(
      onPressed: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 52.w,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w600,
                color: RpColors.grey333333,
              ),
            ),
            const Spacer(),
            RpMotion(
              onPressed: onPressed,
              child: Image.asset(
                isActiv
                    ? 'assets/icons/like_true.png'
                    : 'assets/icons/like_false.png',
                width: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
