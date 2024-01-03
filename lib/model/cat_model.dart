// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:bloc_pattern/model/result_service.dart';

class CatsModel extends ServiceResultModel {
  List<CatModel> cats;
  CatsModel({
    required this.cats,
  });

  CatsModel copyWith({
    List<CatModel>? cats,
  }) {
    return CatsModel(
      cats: cats ?? this.cats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cats': cats.map((x) => x.toMap()).toList(),
    };
  }

  factory CatsModel.fromMap(dynamic map) {
    return CatsModel(
      cats: List.generate(map.length, (index) => CatModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory CatsModel.fromJson(String source) => CatsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatsModel(cats: $cats)';

  @override
  bool operator ==(covariant CatsModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      listEquals(other.cats, cats);
  }

  @override
  int get hashCode => cats.hashCode;
}

class CatModel {
  num id;
  String name;
  String origin;
  String image;
  List<String> colors;
  CatModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.image,
    required this.colors,
  });

  CatModel copyWith({
    num? id,
    String? name,
    String? origin,
    String? image,
    List<String>? colors,
  }) {
    return CatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      image: image ?? this.image,
      colors: colors ?? this.colors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'origin': origin,
      'image': image,
      'colors': colors,
    };
  }

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'] as num,
      name: map['name'] as String,
      origin: map['origin'] as String,
      image: map['image'] as String,
      colors: List.generate(map['colors'].length, (index) => map['colors'][index])
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) => CatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatModel(id: $id, name: $name, origin: $origin, image: $image, colors: $colors)';
  }

  @override
  bool operator ==(covariant CatModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.id == id &&
      other.name == name &&
      other.origin == origin &&
      other.image == image &&
      listEquals(other.colors, colors);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      origin.hashCode ^
      image.hashCode ^
      colors.hashCode;
  }
}
