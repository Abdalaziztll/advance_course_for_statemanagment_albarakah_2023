import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:riverpod_with_graph/graphql/config/config_graphql.dart';
import 'package:riverpod_with_graph/graphql/schema/user_gql.dart';
import 'package:riverpod_with_graph/model/user_model.dart';

final userProvider = Provider((ref) => UserMethods());

class UserMethods {
  getUserData() async {
    QueryOptions options = QueryOptions(document: gql(userGql), variables: {
      "options": {
        "paginate": {"page": 1, "limit": 5}
      }
    });

    GraphQLClient client = await createClient();

    final result = await client.query(options);

    print(result);
    final data = result.data!['posts']['data'];

    List<UserModel> posts =
        List.generate(data.length, (index) => UserModel.fromMap(data[index]));
    return posts;
  }
}
