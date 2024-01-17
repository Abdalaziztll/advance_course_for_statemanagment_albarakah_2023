
import 'package:graphql/client.dart';

final _httpLink = HttpLink(
  'https://graphqlzero.almansi.me/api',
);


Future<GraphQLClient> createClient() async {
 
  /// initialize Hive and wrap the default box in a HiveStore
  final store = await HiveStore.open(path: 'my/cache/path');
  return GraphQLClient(
      /// pass the store to the cache for persistence
      cache: GraphQLCache(store: store),
      link: _httpLink,
  );
}