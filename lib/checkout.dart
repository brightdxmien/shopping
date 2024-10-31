import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';

class Checkout extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              // final title = item['title'] as String;
              // print(item['title']);
              return Card(
                child: Center(
                  child: Column(
                    children: [
                      Text(item['title']),
                      Image(
                        image: AssetImage(item['imageurl']),
                      ),
                      Text(
                        "\$${item['price']}",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
