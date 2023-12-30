// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}


class SuccessFetchingWeatherData extends WeatherState {
  WeatherModel weatherData;
  SuccessFetchingWeatherData({
    required this.weatherData,
  });
}

class LoadingWeatherData extends WeatherState {}

class ErrorFetchingData extends WeatherState {}

class NoInternet extends WeatherState {}