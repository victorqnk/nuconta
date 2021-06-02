import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuconta/model/offer.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key? key,
    required this.offer,
    required this.balance,
  }) : super(key: key);

  final Offer offer;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              offer.product.image,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: 180.0,
            ),
            SizedBox(height: 16.0),
            Text(
              offer.product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${NumberFormat.simpleCurrency().format(offer.price)}'),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: Text(
                offer.product.description,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                bool result = balance >= offer.price ? true : false;
                Navigator.pop(context, result);
              },
              child: Text('Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
