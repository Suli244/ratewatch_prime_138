import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ratewatch_prime_138/charts/charts_screen.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/profit/profit_screen.dart';
import 'package:ratewatch_prime_138/settings/settings_screen.dart';

class RpBottomBarState extends State<RpBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: isActive,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: RpColors.white,
          borderRadius: BorderRadius.circular(100).r,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(1.00, 1.00),
              blurRadius: 19,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RpMotion(
              onPressed: () => setState(() => isActive = 0),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isActive == 0 ? RpColors.blue0075FF : RpColors.white,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/charts.svg',
                      color: isActive == 0 ? null : RpColors.greyCCCCCC,
                      width: 24.w,
                    ),
                    SizedBox(width: 6.w),
                    isActive == 0
                        ? Text(
                            'Charts',
                            style: TextStyle(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            RpMotion(
              onPressed: () => setState(() => isActive = 1),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isActive == 1 ? RpColors.blue0075FF : RpColors.white,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/profit.svg',
                      color: isActive == 1 ? null : RpColors.greyCCCCCC,
                      width: 24.w,
                    ),
                    SizedBox(width: 6.w),
                    isActive == 1
                        ? Text(
                            'Profit',
                            style: TextStyle(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            RpMotion(
              onPressed: () => setState(() => isActive = 2),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isActive == 2 ? RpColors.blue0075FF : RpColors.white,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      color: isActive == 2 ? null : RpColors.greyCCCCCC,
                      width: 24.w,
                    ),
                    SizedBox(width: 6.w),
                    isActive == 2
                        ? Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const ChartsScreen(),
    const ProfitScreen(),
    const SettingsScreen(),
  ];
}

class RpBottomBar extends StatefulWidget {
  const RpBottomBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<RpBottomBar> createState() => RpBottomBarState();
}
