import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/product_cart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final List<String> filters = ['All', 'Nike', 'Converse', 'Adidas'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Null\nCollection",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 50,
                  child: TextField(
                    focusNode: _focusNode,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          color: _isFocused ? Colors.orange : Colors.grey,
                          width: _isFocused ? 3.0 : 0.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 3.0,
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedFilter = filter;
                        debugPrint(selectedFilter);
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? const Color.fromARGB(255, 255, 217, 30)
                            : Color.fromARGB(255, 234, 234, 234),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0,
                                color: Color.fromARGB(255, 105, 104, 104)),
                            borderRadius: BorderRadius.circular(30)),
                        label: Text(
                          filter,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 105, 104, 104),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  );
                },
                itemCount: filters.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ProductCart(
                      imageName: product['imageurl'] as String,
                      price: product['price'] as String,
                      title: product["title"] as String,
                      cardColor: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
