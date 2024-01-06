// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_service_layer/model/result_model.dart';

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}
