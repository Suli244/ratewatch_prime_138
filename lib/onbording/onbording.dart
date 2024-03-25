import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/premium/premium_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/onbording/widget/onboarding_item_widget.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final PageController controller = PageController();
  int currantPage = 0;

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
        child: Column(
          children: [
            SizedBox(height: 130.h),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.64,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currantPage = value;
                  });
                },
                children: const [
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onoboar_one.png',
                    titleOnBoar: 'Monitor real-time \ncurrency rates',
                  ),
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onoboar_two.png',
                    titleOnBoar: 'Calculate your \nexpected profit',
                  ),
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onoboar_three.png',
                    titleOnBoar: 'Analyze currency \ntrends using charts',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: RpColors.grey333333,
                      dotColor: RpColors.greyb8b9bc,
                      dotHeight: 6,
                      dotWidth: 8,
                    ),
                  ),
                  const Spacer(),
                  RpMotion(
                    onPressed: () {
                      if (currantPage == 2) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(),
                          ),
                          (protected) => false,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: RpColors.blue0075FF,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 23.w,
                          vertical: 24.h,
                        ),
                        child: Image.asset(
                          'assets/icons/arrow_righ.png',
                          width: 18.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
