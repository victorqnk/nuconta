import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta/model/product.dart';

void main() {
  test('Product instance should be created', () {
    final product = Product(
      id: '1A',
      name: 'Lasbuki',
      description: 'Pdsghaoi sha hsjh ahygiskuia',
      image:
          'https://cdn-images-1.medium.com/max/2000/1*9-ujy3CCBhrpkvS7TMLcoQ.png',
    );

    expect(product.runtimeType, Product);
    expect(product.image.runtimeType, String);
  });
}
