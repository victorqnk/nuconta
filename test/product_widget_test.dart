import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta/components/product.dart';

void main() {
  testWidgets('ProductWidget has an image and a title',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProductWidget(
      image:
          'https://cdn-images-1.medium.com/max/2000/1*9-ujy3CCBhrpkvS7TMLcoQ.png',
      title: 'T',
    ));
    final titleFinder = find.text('T');
    final imageFinder = find.text(
        'https://cdn-images-1.medium.com/max/2000/1*9-ujy3CCBhrpkvS7TMLcoQ.png');

    expect(titleFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);
  });
}
