import 'package:bloc_consumer_example/bloc/laptop_bloc.dart';
import 'package:bloc_consumer_example/model/create_new_laptop.dart';
import 'package:bloc_consumer_example/model/error_model.dart';
import 'package:bloc_consumer_example/model/exception_model.dart';
import 'package:bloc_consumer_example/model/laptop_model.dart';
import 'package:bloc_consumer_example/model/list_of_laptop.dart';
import 'package:bloc_consumer_example/model/result_model.dart';
import 'package:dio/dio.dart';

Future<ResultModel> getData() async {
  Dio dio = Dio();

  try {
    Response response = await dio.get('https://freetestapi.com/api/v1/laptops');
    if (response.statusCode == 200) {
      if (response.data is List) {
        ListOfLaptops laptops = ListOfLaptops.fromMap(response.data);
        return laptops;
      } else {
        Laptop laptop = Laptop.fromMap(response.data);
        return laptop;
      }
    } else {
      return ErrorModel(message: response.headers.map.toString());
    }
  } catch (e) {
    return ExceptionModel(message: e.toString());
  }
}




Future<ResultModel> addData(CreateNewLaptopModel newLaptop) async {
  Dio dio = Dio();

  try {
    Response response = await dio.post('https://jsonplaceholder.typicode.com/posts',data: newLaptop.toJson());
    if (response.statusCode == 201) {
      
        CreateNewLaptopModel laptop = CreateNewLaptopModel.fromMap(response.data);
        return laptop;
      
    } else {
      return ErrorModel(message: response.headers.map.toString());
    }
  } catch (e) {
    return ExceptionModel(message: e.toString());
  }
}
