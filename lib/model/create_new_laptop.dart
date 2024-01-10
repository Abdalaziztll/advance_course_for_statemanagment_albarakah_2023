// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_consumer_example/model/result_model.dart';

class CreateNewLaptopModel extends ResultModel {
  String body;
  String title;
  CreateNewLaptopModel({
    required this.body,
    required this.title,
  });

  CreateNewLaptopModel copyWith({
    String? body,
    String? title,
  }) {
    return CreateNewLaptopModel(
      body: body ?? this.body,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'title': title,
    };
  }

  factory CreateNewLaptopModel.fromMap(Map<String, dynamic> map) {
    return CreateNewLaptopModel(
      body: map['body'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateNewLaptopModel.fromJson(String source) => CreateNewLaptopModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CreateNewLaptopModel(body: $body, title: $title)';

  @override
  bool operator ==(covariant CreateNewLaptopModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.body == body &&
      other.title == title;
  }

  @override
  int get hashCode => body.hashCode ^ title.hashCode;
}
