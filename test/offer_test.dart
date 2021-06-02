import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta/model/offer.dart';
import 'package:nuconta/model/product.dart';

void main() {
  test('Product instance should be created', () {
    final offer = Offer(
      id: '1A',
      price: 1200,
      product: Product(
          id: '2B',
          name: 'Dasbgui',
          description: 'sabgukibh',
          image: 'daskui.jpg'),
    );

    expect(offer.runtimeType, Offer);
    expect(offer.price.runtimeType, int);
  });
}
