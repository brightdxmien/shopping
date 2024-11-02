import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/homepage.dart';

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
            Text("Cart is empty"),
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
                              style: Theme.of(context).textTheme.titleMedium,
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
                              style: Theme.of(context).textTheme.titleMedium,
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
            Positioned(
              bottom: 30, // Distance from bottom
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
