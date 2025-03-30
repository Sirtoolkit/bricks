import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class GraphQLService {
  late final GraphQLClient _client;

  GraphQLService() {
    final httpLink = HttpLink('https://your-graphql-endpoint.com/graphql');

    // Optional: Add authentication link
    final authLink = AuthLink(getToken: () async => 'Bearer YOUR_TOKEN');

    // Optional: Add error link for custom error handling
    final errorLink = ErrorLink(
      onGraphQLError: (request, forward, response) {
        // Handle GraphQL errors here
        return forward(request);
      },
    );

    // Combine links
    final link = errorLink.concat(authLink.concat(httpLink));

    _client = GraphQLClient(cache: GraphQLCache(), link: link);
  }

  GraphQLClient get client => _client;
}
