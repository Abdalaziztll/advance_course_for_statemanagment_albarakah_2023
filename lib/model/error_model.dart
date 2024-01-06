// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_service_layer/model/result_model.dart';

class ErrorModel extends ResultModel {
  String message;
  ErrorModel({
    required this.message,
  });
}
