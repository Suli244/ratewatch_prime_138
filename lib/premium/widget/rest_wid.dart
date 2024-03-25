import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestBut extends StatelessWidget {
  const RestBut({
    super.key,
    required this.onPrePrivPol,
    required this.onPreTerm,
  });

  final Function() onPrePrivPol;
  final Function() onPreTerm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 24.w),
        InkWell(
          onTap: onPrePrivPol,
          child: Row(
            children: [
              Image.asset(
                'assets/images/poly.png',
                width: 20.w,
                height: 20.h,
                color: Colors.white.withOpacity(0.6),
              ),
              SizedBox(width: 5.w),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onPreTerm,
          child: Row(
            children: [
              Image.asset(
                'assets/images/tems.png',
                width: 20.w,
                height: 20.h,
                color: Colors.white.withOpacity(0.6),
              ),
              SizedBox(width: 5.w),
              Text(
                'Terms of Use',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.w),
      ],
    );
  }
}
