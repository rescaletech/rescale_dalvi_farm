import 'package:dalvi/common/widgets/bottom_bar.dart';
import 'package:dalvi/features/account/screens/account_screen.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  static const String routeName = '/thankyou';
  const ThankYouPage({super.key});

  void naviagteToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, BottomBar.routeName);
  }

  void navigateToMyOrdersScreen(BuildContext context) {
    Navigator.pushNamed(context, AccountScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank You for Your Purchase!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your order has been successfully placed.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    naviagteToHomeScreen(context);
                  },
                  child: const Text('Continue Shopping'),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateToMyOrdersScreen(context);
                  },
                  child: const Text('My Orders'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
