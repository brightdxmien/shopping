import 'package:flutter/material.dart';
import 'package:shopping_app/checkout.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/homepage.dart';

bool hasClearedCart = false;

void addToCart() {
  if (!hasClearedCart) {
    cart.clear();
    hasClearedCart = true;
  }
}

class ProductPage extends StatefulWidget {
  final String title;
  final String price;
  final String imageName;

  ProductPage(
      {super.key,
      required this.title,
      required this.imageName,
      required this.price});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Color.fromARGB(255, 255, 217, 30),
      content: Row(children: [
        Icon(
          Icons.done_all_rounded,
          color: Colors.green,
        ),
        Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ]),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Track selected sizes
  List<String> selectedSizes = [];

  // Constants for the product
  final String finPrice = products[0]['price'] as String;
  final List<String> finSize = List<String>.from(products[0]['sizes'] as List);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(widget.title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: 40),
          Image(image: AssetImage(widget.imageName)),
          SizedBox(height: 40),
          Text("\$${widget.price}",
              style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 40),

          // Chips for sizes
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: finSize.map((size) {
                        final isSelected = selectedSizes.contains(size);

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedSizes.remove(size);
                                } else {
                                  selectedSizes.add(size);
                                }
                              });
                            },
                            child: Chip(
                              label: Text(size),
                              backgroundColor: isSelected
                                  ? const Color.fromARGB(255, 255, 217, 30)
                                  : Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Add to Cart button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      print(cart);
                      if (!cart.any((item) =>
                          item['title'] == widget.title &&
                          item['imageurl'] == widget.imageName)) {
                        setState(() {
                          addToCart();
                          cart.add({
                            'title': widget.title,
                            'price': widget.price,
                            'imageurl': widget.imageName,
                            'sizes': selectedSizes,
                          });
                          showSnackBar(context, 'Added to Cart');
                        });
                      } else {
                        showSnackBar(context, 'Already in Cart');
                      }
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 217, 30),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 8),
                          Text(
                            "Add to Cart",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // View Cart button, only shown if cart has items
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  autoClear();
                  // final item = cart[0];
                  // final title = item['title'] as String;
                  // final imageUrl = item['imageurl'] as String;
                  // final price = item['price'] as String;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(cart: cart),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 217, 30),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_checkout_outlined),
                      SizedBox(width: 8),
                      Text(
                        "View Cart",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
