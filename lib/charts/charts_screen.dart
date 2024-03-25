import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/charts/charts_cubit.dart';
import 'package:ratewatch_prime_138/charts/pluscur_chart.dart';
import 'package:ratewatch_prime_138/charts/pluscur_toggle.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChartsScreen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          children: [
            PlusCurToggle(
              onTimeframeSelected: (index) {
                context.read<PlusCurCubit>().oihjfnvewvwvvrev(index);
                context.read<PlusCurCubit>().kmvskmdvsdvsdv(index);
              },
            ),
            SizedBox(height: 20.h),
            const PlusCurChart(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
