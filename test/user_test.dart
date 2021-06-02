import 'package:nuconta/model/user.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('User instance should be created', () {
      final user = User(id: '1a', name: 'Osaui', balance: 1000000, offers: []);
      expect(user.runtimeType, User);
      expect(user.name, 'Osaui');
    });
    test('Balance value should update after a purchase', () {
      final user = User(id: '1a', name: 'Osaui', balance: 1000000, offers: []);
      user.makePurchase(500000);
      expect(user.balance, 500000);
    });

    test('Balance should be reset', () {
      final user = User(id: '1a', name: 'Osaui', balance: 1000000, offers: []);
      user.resetBalance();
      expect(user.balance, 1000000);
    });
  });
}
