class User {
  final String id;
  final String name;
  final int balance;
  final List offers;

  const User({
    required this.id,
    required this.name,
    required this.balance,
    required this.offers,
  });

  factory User.fromQuery(doc) {
    return User(
      id: doc['id'],
      name: doc['name'],
      balance: doc['balance'],
      offers: doc['offers'],
    );
  }
}
