import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String title;
  const ProductWidget({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      elevation: 10,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              image,
              fit: BoxFit.contain,
              height: 100.0,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
