import 'package:nuconta/model/product.dart';

class Offer {
  final String id;
  final int price;
  final Product product;

  const Offer({
    required this.id,
    required this.price,
    required this.product,
  });

  factory Offer.fromQuery(doc) {
    return Offer(
      id: doc['id'],
      price: doc['price'],
      product: Product.fromQuery(doc['product']),
    );
  }
}
