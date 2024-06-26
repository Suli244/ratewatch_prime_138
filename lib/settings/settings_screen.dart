import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/urls.dart';
import 'package:ratewatch_prime_138/core/web_view_plink.dart';
import 'package:ratewatch_prime_138/premium/premium_screen.dart';
import 'package:ratewatch_prime_138/premium/ratewatch_prime_perfvsv.dart';
import 'package:ratewatch_prime_138/settings/widget/settings_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 26.h,
            fontWeight: FontWeight.w700,
            color: RpColors.grey333333,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            FutureBuilder(
              future: getRatewatchPrimePremvd(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.data!) {
                  return SetItWidalsbjcsdvd(
                    text: 'Get Premium',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumScreen(
                            isClose: true,
                          ),
                        ),
                      );
                    },
                    isColor: false,
                  );
                }
                return const SizedBox();
              },
            ),
            SetItWidalsbjcsdvd(
              text: 'Privacy Policy',
              onPressed: () {
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
            ),
            SetItWidalsbjcsdvd(
              text: 'Terms of Use',
              onPressed: () {
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
            ),
            SetItWidalsbjcsdvd(
              text: 'Support',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFF(
                      title: 'Support',
                      url: DocFF.s,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
