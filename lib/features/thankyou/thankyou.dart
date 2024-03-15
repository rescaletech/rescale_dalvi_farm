import 'package:dalvi/common/widgets/bottom_bar.dart';
import 'package:dalvi/features/account/screens/account_screen.dart';
import 'package:dalvi/features/account/services/account_services.dart';
import 'package:dalvi/models/order.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatefulWidget {
  static const String routeName = '/thankyou';
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();
  void naviagteToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, BottomBar.routeName);
  }

  void navigateToMyOrdersScreen(BuildContext context) {
    Navigator.pushNamed(context, AccountScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Order? lastOrder = orders?.last;
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
            Column(
              children: [
                Text('OrderId:   ${lastOrder?.id}'),
                Text('Quantity:     ${lastOrder?.quantity}'),
                Text('Total Price:    ${lastOrder?.totalPrice}'),
                Text('Status:       ${lastOrder?.status}'),
              ],
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
