// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_consumer_example/model/result_model.dart';
import 'package:flutter/foundation.dart';

import 'package:bloc_consumer_example/model/laptop_model.dart';

class ListOfLaptops extends ResultModel{
  List<Laptop> laptops;
  ListOfLaptops({
    required this.laptops,
  });

  ListOfLaptops copyWith({
    List<Laptop>? laptops,
  }) {
    return ListOfLaptops(
      laptops: laptops ?? this.laptops,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'laptops': laptops.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfLaptops.fromMap(List map) {
    return ListOfLaptops(
        laptops:
            List.generate(map.length, (index) => Laptop.fromMap(map[index])));
  }

  String toJson() => json.encode(toMap());

  factory ListOfLaptops.fromJson(String source) =>
      ListOfLaptops.fromMap(json.decode(source));

  @override
  String toString() => 'ListOfLaptops(laptops: $laptops)';

  @override
  bool operator ==(covariant ListOfLaptops other) {
    if (identical(this, other)) return true;

    return listEquals(other.laptops, laptops);
  }

  @override
  int get hashCode => laptops.hashCode;
}
