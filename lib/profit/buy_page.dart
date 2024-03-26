import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/my_text_field.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/premium/premium_screen.dart';
import 'package:ratewatch_prime_138/premium/ratewatch_prime_perfvsv.dart';

class BuyPageJNSCAS extends StatefulWidget {
  const BuyPageJNSCAS({super.key});

  @override
  _BuyPageJNSCASState createState() => _BuyPageJNSCASState();
}

class _BuyPageJNSCASState extends State<BuyPageJNSCAS> {
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
          RpMotion(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16.r),
                    height: 600.h,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF1F3F6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BackButton(
                                color: RpColors.black,
                              ),
                              Text(
                                'Deposit Currency',
                                style: TextStyle(
                                  fontSize: 20.h,
                                  fontWeight: FontWeight.w700,
                                  color: RpColors.grey333333,
                                ),
                              ),
                              SizedBox(width: 35.w),
                            ],
                          ),
                          const Divider(),
                          SizedBox(height: 10.h),
                          RpMotion(
                            onPressed: () {
                              setState(() {
                                depositCurrency = 'USD';
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.r),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: RpColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                'USD',
                                style: TextStyle(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w600,
                                  color: RpColors.grey333333,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          RpMotion(
                            onPressed: () {
                              setState(() {
                                depositCurrency = 'EUR';
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.r),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: RpColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                'EUR',
                                style: TextStyle(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w600,
                                  color: RpColors.grey333333,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          FutureBuilder(
                              future: getRatewatchPrimePremvd(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (!snapshot.data!) {
                                    return RpMotion(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PremiumScreen(
                                              isClose: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(16.r),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: RpColors.yellowFECA13,
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'GBP',
                                              style: TextStyle(
                                                fontSize: 16.h,
                                                fontWeight: FontWeight.w700,
                                                color: RpColors.grey333333,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25.w,
                                              height: 25.h,
                                              child: Image.asset(
                                                'assets/images/crown.png',
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return RpMotion(
                                    onPressed: () {
                                      setState(() {
                                        depositCurrency = 'GBP';
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(16.r),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: RpColors.white,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                      child: Text(
                                        'GBP',
                                        style: TextStyle(
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.w600,
                                          color: RpColors.grey333333,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.r),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: RpColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    depositCurrency,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w600,
                      color: RpColors.grey333333,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: RpColors.grey333333,
                  )
                ],
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
    result = (closePrice - openPrice) * tradeSize;
  }
}
