import 'package:dalvi/constants/global_variables.dart';
import 'package:dalvi/features/account/screens/account_screen.dart';
import 'package:dalvi/features/cart/screens/cart_screen.dart';
import 'package:dalvi/features/home/screens/product_list.dart';
import 'package:dalvi/features/home/services/home_services.dart';
import 'package:dalvi/features/home/widgets/address_box.dart';
import 'package:dalvi/features/search/screens/search_screen.dart';
import 'package:dalvi/models/product.dart';
import 'package:dalvi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

int _page = 0;
double bottomBarWidth = 42;
double bottomBarBorderWidth = 5;

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product>? products;
  final HomeServices homeServices = HomeServices();
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    setState(() {
      isLoading = true; // Set loading state to true
    });
    try {
      // Fetch products
      products = await homeServices.fetchProducts(context: context);
      errorMessage = ''; // Reset error message if successful
    } catch (e) {
      // Handle error
      errorMessage = e.toString();
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false
      });
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Mango...',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            const SizedBox(height: 10),
            // Check if products are not null before displaying ProductList
            ProductList(products: products ?? []),
            if (isLoading)
              const CircularProgressIndicator(), // Show loading indicator if products are being fetched
            if (errorMessage.isNotEmpty) Text(errorMessage),
          ],
        ),
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
              //  performTap(0);
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
                performTap(1);
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
