// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'laptop_bloc.dart';

@immutable
sealed class LaptopState {}

final class LaptopInitial extends LaptopState {}

class SuccessLaptopFetching extends LaptopState {
  Laptop laptop;
  SuccessLaptopFetching({
    required this.laptop,
  });
}


class SuccessLaptopAdd extends LaptopState {
 
}

class SuccessLaptopsFetching extends LaptopState {
  ListOfLaptops laptops;
  SuccessLaptopsFetching({
    required this.laptops,
  });
}


class LoadingState extends LaptopState {}

class ExceptionState extends LaptopState {
  ExceptionModel exceptionModel;
  ExceptionState({
    required this.exceptionModel,
  });
}



class ErrorState extends LaptopState {
  ErrorModel errorModel;
  ErrorState({
    required this.errorModel,
  });
}


class OfflineDataStorage extends LaptopState {
  List<Laptop> laptops;
  OfflineDataStorage({
    required this.laptops,
  });
}


class FailedToSendRequestLaptop extends LaptopState {
  CreateNewLaptopModel newLaptop;
  FailedToSendRequestLaptop({
    required this.newLaptop,
  });
}
