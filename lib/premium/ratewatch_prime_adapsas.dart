import 'dart:async' show Future;
import 'package:adapty_flutter/adapty_flutter.dart';

class RatewatchPrimeAdapty {
  void Function(AdaptyError)? onRatewatchPrimeAdaptyErrorOccurred;
  void Function(Object)? onRatewatchPrimeUnknownErrorOccurred;

  final ratewatchPrimeAdapty = Adapty();

  static final RatewatchPrimeAdapty _ratewatchPrimeInstance = RatewatchPrimeAdapty._internal();

  factory RatewatchPrimeAdapty() {
    return _ratewatchPrimeInstance;
  }

  RatewatchPrimeAdapty._internal();

  Future<AdaptyProfile?> learCall() async {
    try {
      final nvskdsd = await ratewatchPrimeAdapty.getProfile();
      return nvskdsd;
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }
    return null;
  }

  Future<void> initializeRatewatchPrimeAdapty() async {
    try {
      ratewatchPrimeAdapty.setLogLevel(AdaptyLogLevel.verbose);
      ratewatchPrimeAdapty.activate();
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }
  }

  Future<AdaptyPaywall?> ratewatchPrimeGetPaywall(
    String ratewatchPrimePaywallId,
  ) async {
    try {
      final ratewatchPrimenvskdsd = await ratewatchPrimeAdapty.getPaywall(
        placementId: ratewatchPrimePaywallId,
        loadTimeout: const Duration(seconds: 5),
      );
      return ratewatchPrimenvskdsd;
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<List<AdaptyPaywallProduct>?>ratewatchPrimeGetPaywallProducts(
    AdaptyPaywall ratewatchPrimePaywall,
  ) async {
    try {
      final ratewatchPrimenvskdsd =
          await ratewatchPrimeAdapty.getPaywallProducts(paywall: ratewatchPrimePaywall);
      return ratewatchPrimenvskdsd;
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> ratewatchPrimeMakePurchase(
      AdaptyPaywallProduct ratewatchPrimeProduct) async {
    try {
      final ratewatchPrimenvskdsd =
          await ratewatchPrimeAdapty.makePurchase(product: ratewatchPrimeProduct);
      return ratewatchPrimenvskdsd;
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> ratewatchPrimeRestorePurchases() async {
    try {
      final ratewatchPrimenvskdsd = await ratewatchPrimeAdapty.restorePurchases();

      return ratewatchPrimenvskdsd;
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<bool> ratewatchPrimeHasPremiumStatus() async {
    try {
      final ratewatchPrimeProfile = await ratewatchPrimeAdapty.getProfile();
      if (ratewatchPrimeProfile.accessLevels['premium']?.isActive ?? false) {
        return true;
      }
    } on AdaptyError catch (adaptyError) {
      onRatewatchPrimeAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onRatewatchPrimeUnknownErrorOccurred?.call(e);
    }

    return false;
  }
}
