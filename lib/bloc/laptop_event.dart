part of 'laptop_bloc.dart';

@immutable
sealed class LaptopEvent {}


class GetAllLaptop extends LaptopEvent {}

class CreateNewLaptop extends LaptopEvent {
  CreateNewLaptopModel newLaptop;

  CreateNewLaptop({required this.newLaptop});

}