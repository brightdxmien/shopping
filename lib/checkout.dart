import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/homepage.dart';
import 'package:shopping_app/order.dart';

class Checkout extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  // final String imageName;
  // final String price;
  // final String title;
  const Checkout(
      {super.key,
      // required this.imageName,
      // required this.title,
      // required this.price,
      required this.cart});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final Color buttonColor = const Color.fromARGB(255, 255, 217, 30);
  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Oops!, there's nothing in your cart"),
            SizedBox(
              height: 20,
            ),
            Image(image: AssetImage("assets/images/empty.png")),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FloatingActionButton(
                  backgroundColor: buttonColor,
                  child: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  }),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
          ),
          body: Stack(children: [
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.length,
                      itemBuilder: (context, index) {
                        final item = widget.cart[index];
                        // final title = item['title'] as String;
                        // print(item['title']);
                        return Card(
                          child: Center(
                            child: Stack(children: [
                              Column(
                                children: [
                                  Text(
                                    item['title'],
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image(
                                    image: AssetImage(item['imageurl']),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "\$${item['price']}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                      left: 10,
                      right: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Order(),
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
                            Icon(Icons.payment),
                            SizedBox(width: 8),
                            Text(
                              "Checkout",
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
            Positioned(
              bottom: 120, // Distance from bottom
              right: 25, // Distance from right
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 255, 217, 30),
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  widget.cart.clear();
                  setState(() {});
                  // Define your onPressed functionality here
                },
              ),
            ),
          ]));
    }
  }
}
