import 'package:dalvi/constants/global_variables.dart';
import 'package:dalvi/features/home/screens/product_list.dart';
import 'package:dalvi/features/home/services/home_services.dart';
import 'package:dalvi/features/home/widgets/address_box.dart';
import 'package:dalvi/features/search/screens/search_screen.dart';
import 'package:dalvi/models/product.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
