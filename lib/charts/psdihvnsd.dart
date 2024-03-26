import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ratewatch_prime_138/charts/charts_cubit.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';

class PlusCurChartkjbscjdvs extends StatelessWidget {
  const PlusCurChartkjbscjdvs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlusCurCubitIUGBSD, List<FlSpot>>(
      builder: (context, points) {
        return SizedBox(
          height: 480.h,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.white,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((LineBarSpot touchedSpot) {
                      final cubit = context.read<PlusCurCubitIUGBSD>();
                      final DateTime date = DateTime.now().subtract(
                        Duration(
                          days: (cubit.pointsCount - touchedSpot.x).toInt(),
                        ),
                      );
                      final String dateStr =
                          DateFormat('dd.MM.yyyy').format(date);
                      final String timeStr = DateFormat('HH:mm').format(date);
                      final random = Random();
                      final randomIndex =
                          random.nextInt(cubit.leftTitles.length);
                      final yValue = cubit.leftTitles[randomIndex];
                      return LineTooltipItem(
                        '$dateStr\n$timeStr\n$yValue',
                        const TextStyle(color: Colors.black),
                      );
                    }).toList();
                  },
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.black.withOpacity(
                    0.6,
                  ),
                  strokeWidth: 1.w,
                ),
              ),
              // ? Левая граница
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(
                    color: Colors.black.withOpacity(
                      0.6,
                    ),
                    width: 1,
                  ),
                ),
              ),

              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 4,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      final cubit = context.read<PlusCurCubitIUGBSD>();
                      final interval =
                          cubit.pointsCount / (cubit.bottomTitles.length - 1);
                      final index = (value / interval).round();

                      if (index >= 0 && index < cubit.bottomTitles.length) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            cubit.bottomTitles[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: RpColors.grey333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      String title = value.toStringAsFixed(1);
                      return Text(
                        title,
                        style: TextStyle(
                          color: RpColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                    reservedSize: 40.w,
                    interval: 1,
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: points,
                  isCurved: false,
                  color: RpColors.blue0075FF,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      if (index == barData.spots.length - 1) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: RpColors.blue0075FF,
                          strokeWidth: 2,
                          strokeColor: RpColors.blue0075FF,
                        );
                      }
                      return FlDotCirclePainter(
                        radius: 5,
                        color: Colors.transparent,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        RpColors.blue0075FF.withOpacity(0.6),
                        RpColors.blue0075FF.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
