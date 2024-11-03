import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:shopping_app/homepage.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = const Color(0xFFFFD91E);
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/done1.png")),
              Text("Order Recieved!"),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 30,
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
        ]),
      ),
    );
  }
}
