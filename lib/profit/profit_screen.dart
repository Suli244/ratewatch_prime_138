import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/profit/buy_page.dart';
import 'package:ratewatch_prime_138/profit/sell_page.dart';

class ProfitScreen extends StatefulWidget {
  const ProfitScreen({super.key});

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
  String page = 'BUY';
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
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
                    ? const Expanded(child: BuyPage())
                    : const Expanded(child: SellPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
