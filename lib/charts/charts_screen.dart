import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/charts/charts_cubit.dart';
import 'package:ratewatch_prime_138/charts/pluscur_chart.dart';
import 'package:ratewatch_prime_138/charts/pluscur_toggle.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/currency_pairs/currency_pairs.dart';
import 'package:ratewatch_prime_138/currency_pairs/model/currency_model.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  CurentModel curre = CurentModel(
    icon: 'assets/icons/currency1.png',
    title: 'ARS / USD',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                RpMotion(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrencyPairs(
                          onPpp: (value) {
                            setState(() {
                              curre = value;
                            });
                          },
                        ),
                      ),
                    );
                    context.read<PlusCurCubit>().updateChartData(curre);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: RpColors.white,
                    ),
                    child: Ccc(
                      icon: curre.icon,
                      title: curre.title,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                PlusCurToggle(
                  onTimeframeSelected: (index) {
                    context.read<PlusCurCubit>().oihjfnvewvwvvrev(index);
                    context.read<PlusCurCubit>().kmvskmdvsdvsdv(index);
                  },
                ),
                SizedBox(height: 20.h),
                const PlusCurChart(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ccc extends StatelessWidget {
  const Ccc({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
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
        Image.asset(
          'assets/images/TapZone.png',
          width: 36.w,
        ),
      ],
    );
  }
}
