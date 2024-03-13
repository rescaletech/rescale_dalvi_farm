import 'package:dalvi/common/widgets/bottom_bar.dart';
import 'package:dalvi/features/account/screens/account_screen.dart';
import 'package:dalvi/features/address/screens/address_screen.dart';
import 'package:dalvi/features/admin/screens/add_products_screen.dart';
import 'package:dalvi/features/auth/screens/auth_screen.dart';
import 'package:dalvi/features/home/screens/category_deals_screen.dart';
import 'package:dalvi/features/home/screens/home_screen.dart';
import 'package:dalvi/features/order_details/screens/order_details.dart';
import 'package:dalvi/features/product_details/screens/product_details_screen.dart';
import 'package:dalvi/features/search/screens/search_screen.dart';
import 'package:dalvi/features/thankyou/thankyou.dart';
import 'package:dalvi/models/order.dart';
import 'package:dalvi/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );

    case ThankYouPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ThankYouPage(),
      );

    case AccountScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AccountScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
