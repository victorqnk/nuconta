import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final String _url = 'https://staging-nu-needful-things.nubank.com.br/query';
  final String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c';

  late final HttpLink _httpLink;
  late final AuthLink _authLink;

  late final Link link = _authLink.concat(_httpLink);
  late final ValueNotifier<GraphQLClient> client;

  // initialize the service
  GraphQLService() {
    _httpLink = HttpLink(_url);
    _authLink = AuthLink(getToken: () => 'Bearer $_token');
    client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}
