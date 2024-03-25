import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ratewatch_prime_138/core/rp_colors.dart';
import 'package:ratewatch_prime_138/core/rp_motin.dart';
import 'package:ratewatch_prime_138/currency_pairs/model/currency_model.dart';
import 'package:ratewatch_prime_138/currency_pairs/widget/curren_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPairs extends StatefulWidget {
  const CurrencyPairs({super.key});

  @override
  State<CurrencyPairs> createState() => _CurrencyPairsState();
}

class _CurrencyPairsState extends State<CurrencyPairs> {
  List<CurentModel> curreList = [
    CurentModel(
      icon: 'assets/icons/currency1.png',
      title: 'ARS / USD',
    ),
    CurentModel(
      icon: 'assets/icons/currency2.png',
      title: 'EUR / USD',
    ),
    CurentModel(
      icon: 'assets/icons/currency3.png',
      title: 'EUR / CHF',
    ),
    CurentModel(
      icon: 'assets/icons/currency4.png',
      title: 'AUD / CHF',
    ),
    CurentModel(
      icon: 'assets/icons/currency5.png',
      title: 'USD / JPY',
    ),
    CurentModel(
      icon: 'assets/icons/currency6.png',
      title: 'USD / CHF',
    ),
    CurentModel(
      icon: 'assets/icons/currency7.png',
      title: 'CAD / CHF',
    ),
    CurentModel(
      icon: 'assets/icons/currency8.png',
      title: 'GBP / AUD',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: RpMotion(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 24.w,
              color: RpColors.grey333333,
            ),
          ),
        ),
        title: Text(
          'Currency Pairs',
          style: TextStyle(
            fontSize: 20.h,
            fontWeight: FontWeight.w700,
            color: RpColors.grey333333,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: Colors.white,
              ),
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final ind = curreList.elementAt(index);
                  return CurrencyItem(
                    icon: ind.icon,
                    title: ind.title,
                    isActiv: ind.isLike,
                    onPressed: () {
                      _toggleFavorite(index);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: RpColors.grey767680.withOpacity(0.12),
                  height: 25.h,
                ),
                itemCount: curreList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite(int index) {
    setState(() {
      curreList[index].isLike = !curreList[index].isLike;
      _saveFavorites();
      _sortFavoritesFirst();
    });
  }

  void _sortFavoritesFirst() {
    curreList.sort((a, b) {
      if (a.isLike && !b.isLike) {
        return -1;
      } else if (!a.isLike && b.isLike) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var currency in curreList) {
        currency.isLike = prefs.getBool(currency.title) ?? false;
      }
      _sortFavoritesFirst();
    });
  }

  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var currency in curreList) {
      await prefs.setBool(currency.title, currency.isLike);
    }
  }
}
