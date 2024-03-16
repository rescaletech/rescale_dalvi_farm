import 'package:dalvi/constants/global_variables.dart';
import 'package:dalvi/features/account/widgets/orders.dart';
import 'package:dalvi/features/cart/screens/cart_screen.dart';
import 'package:dalvi/features/home/screens/home_screen.dart';
import 'package:dalvi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:dalvi/features/account/widgets/below_app_bar.dart';
import 'package:dalvi/features/account/widgets/top_buttons.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

int _page = 1;
double bottomBarWidth = 42;
double bottomBarBorderWidth = 5;

class AccountScreen extends StatefulWidget {
  static const String routeName = '/account';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/dalviFarm.jpg',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          Orders(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigation(context, userCartLen),
    );
  }


  BottomNavigationBar buildBottomNavigation(
      BuildContext context, int userCartLen) {
    return BottomNavigationBar(
      currentIndex: _page,
      selectedItemColor: GlobalVariables.selectedNavBarColor,
      unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      backgroundColor: GlobalVariables.backgroundColor,
      iconSize: 28,
      onTap: (index) {
        if (index != _page) {
          performTap(index);
        }
      },
      items: [
        // HOME
        BottomNavigationBarItem(
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                performTap(0);
              },
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
          ),
          label: '',
        ),
        // ACCOUNT
        BottomNavigationBarItem(
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                //performTap(1);
              },
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
          ),
          label: '',
        ),
        // CART
        BottomNavigationBarItem(
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () { performTap(2);},
              child: Center(
                child: badges.Badge(
                  badgeContent: Text(
                    userCartLen.toString(),
                  ),
                  position: badges.BadgePosition.topEnd(top: -15, end: -15),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
          ),
          label: '',
        ),
      ],
    );
  }

  void performTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
        break;
    }
  }
}
