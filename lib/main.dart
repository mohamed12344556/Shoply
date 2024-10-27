import 'package:flutter/material.dart';
import 'package:stylish_app/modules/get_start/get_start_page.dart';
import 'package:stylish_app/modules/home/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:stylish_app/modules/shop/ui/pages/shoping_page.dart';
import 'package:stylish_app/modules/trendeing_page/ui/pages/trendeing_product_page.dart';
import 'modules/home/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TrendingProductPage.routeName: (context) => const TrendingProductPage(),
        ShopingPage.routeName: (context) => const ShopingPage(),
        CustomBottomNavBar.routeName: (context) => const CustomBottomNavBar(),
        GetStartPage.routeName: (context) => const GetStartPage(),
      },
      initialRoute: GetStartPage.routeName,
    );
  }
}
