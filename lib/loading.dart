import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 217, 30),
            ),
            SizedBox(height: 20),
            Text("Processing Payment...")
          ],
        ),
      ),
    );
  }
}
