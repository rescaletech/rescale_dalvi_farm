import 'package:dalvi/features/product_details/screens/product_details_screen.dart';
import 'package:dalvi/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({required this.products, Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.products.map((product) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20), // Add bottom margin
          child: GestureDetector(
            onTap: () {
              // Navigate to ProductDetailsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    product.images[0],
                    fit: BoxFit.fitWidth,
                    height: 135,
                    width: 135,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 210,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(product.name), // Use product.name here
                      ),
                      Container(
                        width: 210,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          '₹ ${product.price}', // Use product.price here
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: 210,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: const Text(
                          'In Stock',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
