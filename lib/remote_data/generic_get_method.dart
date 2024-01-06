import 'package:clean_service_layer/model/entity_model.dart';
import 'package:clean_service_layer/model/error_model.dart';
import 'package:clean_service_layer/model/exception_model.dart';
import 'package:clean_service_layer/model/result_model.dart';
import 'package:dio/dio.dart';

Future<ResultModel> getData<T extends ResultModel>(
    {required String endpoint,
    String quereyParam = '',
    required T Function(Map map) fromMap}) async {
  Dio dio = Dio();
  try {
    Response response = await dio.get(endpoint + quereyParam,
);
    if (response.statusCode == 200) {
      if(response.requestOptions.responseType.runtimeType is List){
        List<T> result = List.generate(response.data.length, (index) => fromMap(response.data[index]));
        GenenicListModel users = GenenicListModel(entityList: result);
        return users;
      }else {

      T result = fromMap(response.data);
      return result;
      }
    } else {
      return ErrorModel(message: response.headers.map.toString());
    }
  } catch (e) {
    return ExceptionModel(message: e.toString());
  }
}

