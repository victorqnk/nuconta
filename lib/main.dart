import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta/services/graphql.dart';
import 'package:nuconta/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GraphQLService gql = GraphQLService();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gql.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NuConta Marketplace',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple.shade700,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 21.0,
                horizontal: 60.0,
              ),
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
