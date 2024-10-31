import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/checkout.dart';
import 'package:shopping_app/homepage.dart';
import 'package:shopping_app/product_page.dart';
import 'package:shopping_app/global_variable.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.yellow,
            textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(58, 58, 58, 0.808),
                    fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ))
            // Material theme settings
            ),
        darkTheme: ThemeData.light(),
        themeMode: ThemeMode.system,
        home: Homepage());
  }
}
