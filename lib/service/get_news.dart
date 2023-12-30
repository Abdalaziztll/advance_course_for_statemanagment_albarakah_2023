import 'package:dio/dio.dart';

class Service {
   Dio dio =Dio();
  late Response response;
   String baseUrl = 'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m';
}

class WeatherService extends Service {

bringWeather()async{

  try {
    response = await dio.get(baseUrl,options: Options(
      headers: {
        "content-type":"application/json"
      }
    ));
    print(response);
  if(response.statusCode ==200){
    return response.data;
  }
  else {
    return false;
  }
  } catch (e) {
    return 'No Internet';
  }
  
}
}