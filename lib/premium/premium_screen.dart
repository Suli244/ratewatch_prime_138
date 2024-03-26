// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ratewatch_prime_138/core/con_bar.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/core/urls.dart';
import 'package:ratewatch_prime_138/core/web_view_plink.dart';
import 'package:ratewatch_prime_138/premium/ratewatch_prime_adapsas.dart';
import 'package:ratewatch_prime_138/premium/ratewatch_prime_perfvsv.dart';
import 'package:ratewatch_prime_138/premium/widget/premium_item_widget.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});
  final bool isClose;
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  Future<void> ratewatchPrimePurchase() async {
    final ratewatchPrimePaywall =
        await RatewatchPrimeAdapty().ratewatchPrimeGetPaywall(DocFF.bsvssewew);
    if (ratewatchPrimePaywall == null) return;
    final ratewatchPrimeProducts = await RatewatchPrimeAdapty()
        .ratewatchPrimeGetPaywallProducts(ratewatchPrimePaywall);
    if (ratewatchPrimeProducts == null) return;
    if (kDebugMode) log('RatewatchPrime');

    await RatewatchPrimeAdapty()
        .ratewatchPrimeMakePurchase(ratewatchPrimeProducts.first);
  }

  bool nvakjvnnasnk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/obsi.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.isClose) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RpBottomBar(
                                indexScr: 0,
                              ),
                            ),
                            (protected) => false,
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/icons/close.png',
                        width: 18.w,
                        color: RpColors.grey333333.withOpacity(0.5),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        restoreRatewatchPrimePremvd(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/refresh_icon.png',
                            width: 18.w,
                            color: RpColors.grey333333.withOpacity(0.5),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Restore Purchases',
                            style: TextStyle(
                              fontSize: 14.h,
                              height: 0,
                              color: RpColors.grey333333.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45.h),
              Center(
                child: Image.asset(
                  'assets/images/premium.png',
                  width: 250.w,
                  height: 250.h,
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get Premium',
                      style: TextStyle(
                        color: RpColors.grey333333,
                        fontSize: 30.h,
                        height: 0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    const PremiItem(
                      titlePremi: 'Adding currency pairs to favorites',
                    ),
                    SizedBox(height: 10.h),
                    const PremiItem(
                      titlePremi: 'Using pound currency in profit calculator',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RpMotion(
                  onPressed: () async {
                    setState(() => nvakjvnnasnk = true);
                    await ratewatchPrimePurchase();
                    final hasPremiumStatusSmartTrader =
                        await RatewatchPrimeAdapty()
                            .ratewatchPrimeHasPremiumStatus();
                    if (hasPremiumStatusSmartTrader) {
                      await setRatewatchPrimePremvd();
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RpBottomBar(),
                        ),
                        (route) => false,
                      );
                    }
                    setState(() => nvakjvnnasnk = false);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: RpColors.purple525DFF,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 60.w,
                      ),
                      child: Center(
                        child: nvakjvnnasnk
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Buy Premium \$0.99',
                                style: TextStyle(
                                  color: RpColors.white,
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFF(
                        title: 'Privacy Policy',
                        url: DocFF.pP,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/Privacy_icon.png',
                      width: 20.w,
                      height: 20.h,
                      color: RpColors.grey333333.withOpacity(0.5),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        color: RpColors.grey333333.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFF(
                        title: 'Terms of Use',
                        url: DocFF.tUse,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/Terms_icon.png',
                      width: 20.w,
                      height: 19.5.h,
                      color: RpColors.grey333333.withOpacity(0.5),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        color: RpColors.grey333333.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
