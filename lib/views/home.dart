import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta/components/description.dart';
import 'package:nuconta/components/product.dart';
import 'package:nuconta/model/offer.dart';
import 'package:nuconta/model/user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<ScaffoldState>();

  final String query = '''
    query getData {
      viewer {
        id
        name
        balance
        offers {
          id
          price
          product {
            id
            name
            description
            image
          }
        }
      }
    }
  ''';

  void purchase(Offer offer, User user, BuildContext context) async {
    String message;
    bool response = await showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return DescriptionBox(
          offer: offer,
          balance: user.balance,
        );
      },
    );
    if (response) {
      user.makePurchase(offer.price);
      message = 'Tu compra fue exitosa.';
    } else {
      message = 'No tienes suficiente saldo.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).primaryColor,
      body: Query(
        options: QueryOptions(document: gql(query)),
        builder: (QueryResult result, {refetch, fetchMore}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }

          if (result.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ChangeNotifierProvider.value(
            value: User.fromQuery(result.data!['viewer']),
            builder: (context, child) {
              var user = Provider.of<User>(context);
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello, ${user.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            user.resetBalance();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Restauraste tu balance')),
                            );
                          },
                          icon: Icon(
                            Icons.restore,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Current balance'),
                            SizedBox(height: 8.0),
                            Text(
                              '${NumberFormat.simpleCurrency().format(user.balance)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: user.offers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          var offer = Offer.fromQuery(user.offers[index]);

                          return GestureDetector(
                            onTap: () => purchase(offer, user, context),
                            child: ProductWidget(
                              image: offer.product.image,
                              title: offer.product.name,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
