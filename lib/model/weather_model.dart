// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  num interval;
  num temperature_2m;
  num wind_speed_10m;
  String time;
  WeatherModel({
    required this.interval,
    required this.temperature_2m,
    required this.wind_speed_10m,
    required this.time,
  });

  WeatherModel copyWith({
    num? interval,
    num? temperature_2m,
    num? wind_speed_10m,
    String? time,
  }) {
    return WeatherModel(
      interval: interval ?? this.interval,
      temperature_2m: temperature_2m ?? this.temperature_2m,
      wind_speed_10m: wind_speed_10m ?? this.wind_speed_10m,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interval': interval,
      'temperature_2m': temperature_2m,
      'wind_speed_10m': wind_speed_10m,
      'time': time,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      interval: map['interval'] as num,
      temperature_2m: map['temperature_2m'] as num,
      wind_speed_10m: map['wind_speed_10m'] as num,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(interval: $interval, temperature_2m: $temperature_2m, wind_speed_10m: $wind_speed_10m, time: $time)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.interval == interval &&
      other.temperature_2m == temperature_2m &&
      other.wind_speed_10m == wind_speed_10m &&
      other.time == time;
  }

  @override
  int get hashCode {
    return interval.hashCode ^
      temperature_2m.hashCode ^
      wind_speed_10m.hashCode ^
      time.hashCode;
  }
}
