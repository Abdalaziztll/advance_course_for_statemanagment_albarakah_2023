import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/model/weather_model.dart';
import 'package:bloc_pattern/service/get_news.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetData>((event, emit) async {
      emit(LoadingWeatherData());

      var temp = await WeatherService().bringWeather();
      print(temp);

      if (temp is bool) {
        emit(ErrorFetchingData());
      } else if (state is String) {
        emit(NoInternet());
      } else {
        WeatherModel data = WeatherModel.fromMap(temp['current']);
        emit(SuccessFetchingWeatherData(weatherData: data));
      }
    });
  }
}
