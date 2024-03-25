import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/my_text_field.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final openPriceController = TextEditingController();
  final closePriceController = TextEditingController();
  final tradeSizeController = TextEditingController();
  String depositCurrency = 'USD';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.h),
          Text(
            'Open Price',
            style: TextStyle(
              fontSize: 14.h,
              fontWeight: FontWeight.w500,
              color: RpColors.grey333333,
            ),
          ),
          SizedBox(height: 8.h),
          MyTextField(
            controller: openPriceController,
            textInputType: TextInputType.number,
            hintText: '\$ 0',
            maxLine: 1,
            borderColor: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'Close Price',
            style: TextStyle(
              fontSize: 14.h,
              fontWeight: FontWeight.w500,
              color: RpColors.grey333333,
            ),
          ),
          SizedBox(height: 8.h),
          MyTextField(
            controller: closePriceController,
            textInputType: TextInputType.number,
            hintText: '\$ 0',
            maxLine: 1,
            borderColor: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'Trade size (1 lot = 100 000)',
            style: TextStyle(
              fontSize: 14.h,
              fontWeight: FontWeight.w500,
              color: RpColors.grey333333,
            ),
          ),
          SizedBox(height: 8.h),
          MyTextField(
            controller: tradeSizeController,
            textInputType: TextInputType.number,
            hintText: '\$ 0',
            maxLine: 1,
            borderColor: Colors.white,
          ),
          SizedBox(height: 16.h),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 62,
            decoration: BoxDecoration(
              color: RpColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: RpColors.grey333333,
                      )),
                  borderRadius: BorderRadius.circular(14.sp),
                  elevation: 0,
                  dropdownColor: RpColors.blue0075FF,
                  focusColor: Colors.white,
                  hint: Text(
                    depositCurrency,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w600,
                      color: RpColors.black,
                    ),
                  ),
                  value: null,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'USD',
                      child: Text(
                        'USD',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w600,
                          color: RpColors.white,
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'EUR',
                      child: Text(
                        'EUR',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w600,
                          color: RpColors.white,
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'GBP',
                      child: Text(
                        'GBP',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w600,
                          color: RpColors.white,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      depositCurrency = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          RpMotion(
            onPressed: () {
              if (openPriceController.text.isNotEmpty &&
                  closePriceController.text.isNotEmpty &&
                  tradeSizeController.text.isNotEmpty) {
                setState(() {
                  calculateResult();
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52.h,
              decoration: BoxDecoration(
                color: RpColors.blue0075FF,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w800,
                    color: RpColors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: RpColors.blue0075FF,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'result',
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    color: RpColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$ ${result.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 20.h,
                    fontWeight: FontWeight.w700,
                    color: RpColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 120.h),
        ],
      ),
    );
  }

  void calculateResult() {
    double openPrice = double.parse(openPriceController.text);
    double closePrice = double.parse(closePriceController.text);
    double tradeSize = double.parse(tradeSizeController.text);
    result = (openPrice - closePrice) * tradeSize;
  }
}
