

// ? init future provider 

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_graph/graphql/api/user_methods.dart';
import 'package:riverpod_with_graph/model/user_model.dart';

final userFutureProvider = FutureProvider((ref) async{
final temp =await ref.watch(userProvider).getUserData();

List<UserModel> users = temp as List<UserModel>;
return users;


} 
);