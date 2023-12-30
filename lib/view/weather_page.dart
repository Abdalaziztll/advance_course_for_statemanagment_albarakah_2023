import 'package:bloc_pattern/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is SuccessFetchingWeatherData) {
                return ListTile(
                  title: Text(state.weatherData.time),
                  subtitle: Text(state.weatherData.temperature_2m.toString()),
                );
              } else if (state is NoInternet) {
                return Center(
                  child: Text('Sorry , There is No Internet'),
                );
              } else if (state is ErrorFetchingData) {
                return Center(
                  child: Text('There is a Problem in Your Location'),
                );
              } else if (state is LoadingWeatherData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: IconButton(
                      onPressed: () {
                        context.read<WeatherBloc>().add(GetData());
                      },
                      icon: Icon(Icons.cloud)),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
