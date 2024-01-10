// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offline_request_handl_bloc.dart';

@immutable
sealed class OfflineRequestHandlState {}

final class OfflineRequestHandlInitial extends OfflineRequestHandlState {}

class CounterOfRequest extends OfflineRequestHandlState {
  int requests;
  CreateNewLaptopModel newlaptop;
  CounterOfRequest({
    required this.newlaptop,
    required this.requests,
  });
}


class ZeroRequest extends OfflineRequestHandlState {}