// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_consumer_example/model/result_model.dart';

class Laptop extends ResultModel {
  String brand;
  String model;
  String ram;
  num price;
  String image;
  Laptop({
    required this.brand,
    required this.model,
    required this.ram,
    required this.price,
    required this.image,
  });

  Laptop copyWith({
    String? brand,
    String? model,
    String? ram,
    num? price,
    String? image,
  }) {
    return Laptop(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      ram: ram ?? this.ram,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'model': model,
      'ram': ram,
      'price': price,
      'image': image,
    };
  }

  factory Laptop.fromMap(Map<String, dynamic> map) {
    return Laptop(
      brand: map['brand'] as String,
      model: map['model'] as String,
      ram: map['ram'] as String,
      price: map['price'] as num,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Laptop.fromJson(String source) => Laptop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Laptop(brand: $brand, model: $model, ram: $ram, price: $price, image: $image)';
  }

  @override
  bool operator ==(covariant Laptop other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.model == model &&
      other.ram == ram &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
      model.hashCode ^
      ram.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
