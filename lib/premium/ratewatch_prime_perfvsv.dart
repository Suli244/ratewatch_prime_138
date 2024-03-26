// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ratewatch_prime_138/core/con_bar.dart';
import 'package:ratewatch_prime_138/core/urls.dart';
import 'package:ratewatch_prime_138/premium/ratewatch_prime_adapsas.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getRatewatchPrimePremvd() async {
  final vsdsd = await SharedPreferences.getInstance();
  return vsdsd.getBool('vainasklsa') ?? false;
}

Future<void> setRatewatchPrimePremvd() async {
  final vsdsd = await SharedPreferences.getInstance();
  vsdsd.setBool('vainasklsa', true);
}

Future<void> restoreRatewatchPrimePremvd(BuildContext context) async {
  final currencyAdaptyRestoreResult =
      await RatewatchPrimeAdapty().ratewatchPrimeRestorePurchases();
  if (currencyAdaptyRestoreResult?.accessLevels['premium']?.isActive ?? false) {
    final vsdsd = await SharedPreferences.getInstance();
    vsdsd.setBool("vainasklsa", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const RpBottomBar()),
      (route) => false,
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to currencySupport: ${DocFF.bsvssewew}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
