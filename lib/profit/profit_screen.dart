import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/charts/charts_cubit.dart';
import 'package:ratewatch_prime_138/charts/charts_screen.dart';
import 'package:ratewatch_prime_138/core/appcbjsdd.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/currency_pairs/currency_pairs.dart';
import 'package:ratewatch_prime_138/currency_pairs/model/currency_model.dart';
import 'package:ratewatch_prime_138/profit/buy_page.dart';
import 'package:ratewatch_prime_138/profit/sell_page.dart';

class ProfitScreen extends StatefulWidget {
  const ProfitScreen({super.key});

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
  String page = 'BUY';
  CurentModel curre = CurentModel(
    icon: 'assets/icons/currency1.png',
    title: 'ARS / USD',
  );
  @override
  Widget build(BuildContext context) {
    return AppUnfocuserasbjchascsa(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
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
                    context.read<PlusCurCubitIUGBSD>().updateChartDataidnjsdsd(curre);
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
                Container(
                  padding: EdgeInsets.all(5.r),
                  width: MediaQuery.of(context).size.width,
                  height: 62.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: RpMotion(
                          onPressed: () {
                            setState(() {
                              page = 'BUY';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: page == 'BUY'
                                  ? RpColors.blue0075FF
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'BUY',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w800,
                                  color: page == 'BUY'
                                      ? Colors.white
                                      : RpColors.blue0075FF,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RpMotion(
                          onPressed: () {
                            setState(() {
                              page = 'SELL';
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: page == 'SELL'
                                  ? RpColors.blue0075FF
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'SELL',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w800,
                                  color: page == 'SELL'
                                      ? Colors.white
                                      : RpColors.blue0075FF,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.r),
                page == 'BUY'
                    ? const Expanded(child: BuyPageJNSCAS())
                    : const Expanded(child: SellPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
