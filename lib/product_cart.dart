import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final String imageName;
  final String price;
  final String title;
  final Color cardColor;
  const ProductCart(
      {super.key,
      required this.title,
      required this.cardColor,
      required this.price,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Image(height: 220, image: AssetImage(imageName)),
            Text(
              "\$$price",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
