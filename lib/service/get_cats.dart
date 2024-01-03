import 'package:bloc_pattern/model/cat_model.dart';
import 'package:bloc_pattern/model/result_service.dart';
import 'package:dio/dio.dart';

class Service {
  Dio dio =Dio();
  late Response response;
}

class CatsService extends Service {
  
Future<ServiceResultModel>  getCats() async {
    try {
      response = await dio.get('https://freetestapi.com/api/v1/cats');
      if (response.statusCode == 200) {
       CatsModel cats = CatsModel.fromMap(response.data);
        return cats;
      } else {
        return ErrorModel(Message: response.statusMessage!);
      }
    } catch (e) {
      return ErrorModel(Message: e.toString());
    }
  }
}
