import 'package:flutter/material.dart';
import 'package:nuconta/model/offer.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.network(
              offer.product.image,
              fit: BoxFit.contain,
              height: 120.0,
            ),
          ),
          Text(
            offer.product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // Text(
          //     '${NumberFormat.simpleCurrency().format(user.offers[index]['price'])}'),
        ],
      ),
    );
  }
}
