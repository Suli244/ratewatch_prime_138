import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/charts/charts_cubit.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';

class PlusCurTogglePOJcamcasasd extends StatefulWidget {
  final void Function(Timeframe) onTimeframeSelected;
  const PlusCurTogglePOJcamcasasd({
    super.key,
    required this.onTimeframeSelected,
  });

  @override
  State<PlusCurTogglePOJcamcasasd> createState() => _PlusCurTogglePOJcamcasasdState();
}

class _PlusCurTogglePOJcamcasasdState extends State<PlusCurTogglePOJcamcasasd> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> timeframes = ['1d', '1w', '1m', '6m', '1y'];

    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: RpColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(timeframes.length, (index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () async {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTimeframeSelected(Timeframe.values[index]);
            },
            child: AnimatedContainer(
              width: 48.w,
              height: 24.h,
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? RpColors.blue0075FF : Colors.transparent,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Text(
                timeframes[index],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: isSelected ? Colors.white : RpColors.blue0075FF,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
