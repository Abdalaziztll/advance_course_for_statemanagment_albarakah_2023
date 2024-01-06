// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_service_layer/model/result_model.dart';

class GenenicListModel<T> extends ResultModel {
  List<T> entityList;
  GenenicListModel({
    required this.entityList,
  });
}


class User extends ResultModel {
  String name;

  User({
    required this.name,
  });

  User copyWith({
    String? name,
  }) {
    return User(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  

  static fromMap({dynamic map}) {
    return User(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

   fromJson(String source) => fromMap(map:  json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
