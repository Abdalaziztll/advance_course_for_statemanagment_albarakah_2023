// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ServiceResultModel {

}


class ErrorModel extends ServiceResultModel {
  String Message;
  ErrorModel({
    required this.Message,
  });
}
