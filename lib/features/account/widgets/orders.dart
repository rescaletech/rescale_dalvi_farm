import 'package:dalvi/common/widgets/loader.dart';
import 'package:dalvi/constants/global_variables.dart';
import 'package:dalvi/features/account/services/account_services.dart';
import 'package:dalvi/features/order_details/screens/order_details.dart';
import 'package:dalvi/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int status = 0;
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  String formatTimeDifference(DateTime previousTime) {
    Duration difference = DateTime.now().difference(previousTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return '${difference.inSeconds} ${difference.inSeconds == 1 ? 'second' : 'seconds'} ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Your Orders :',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 320,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 10,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailScreen.routeName,
                          arguments: orders![index],
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: const Text(
                                    'Order ID :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Text(
                                    orders![index].id,
                                    style: TextStyle(
                                      color:
                                          GlobalVariables.selectedNavBarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: const Text(
                                    'Order Date :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Text(
                                    DateFormat().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          orders![index].orderedAt),
                                    ),
                                    style: TextStyle(
                                      color:
                                          GlobalVariables.selectedNavBarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: const Text(
                                    'Total Amount :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Text(
                                    '₹ ${orders![index].totalPrice}',
                                    style: TextStyle(
                                      color:
                                          GlobalVariables.selectedNavBarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: const Text(
                                    'Last Update :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Text(
                                    formatTimeDifference(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            orders![index].lastUpdate)),
                                    style: TextStyle(
                                      color:
                                          GlobalVariables.selectedNavBarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
