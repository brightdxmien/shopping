import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';

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
        body: Column(children: [
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
          Expanded(
            child: Container(
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
                          final isSelected = selectedSizes
                              .contains(size); // Check if the chip is selected

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0), // Spacing between chips
                            child: GestureDetector(
                              onTap: () {
                                print(selectedSizes);
                                setState(() {
                                  if (isSelected) {
                                    selectedSizes.remove(
                                        size); // Remove from selected sizes
                                  } else {
                                    selectedSizes
                                        .add(size); // Add to selected sizes
                                  }
                                });
                              },
                              child: Chip(
                                label: Text(size),
                                backgroundColor: isSelected
                                    ? const Color.fromARGB(255, 255, 217, 30)
                                    : Colors.grey[
                                        200], // Change color based on selection
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
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        print(
                            "Add to Cart tapped with selected sizes: $selectedSizes");
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
                            SizedBox(width: 8), // Spacing between icon and text
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
          )
        ]));
  }
}
