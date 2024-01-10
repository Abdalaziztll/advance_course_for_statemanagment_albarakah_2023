// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offline_request_handl_bloc.dart';

@immutable
sealed class OfflineRequestHandlEvent {}


class FailedToSendRequest extends OfflineRequestHandlEvent {
  CreateNewLaptopModel laptop;
  FailedToSendRequest({
    required this.laptop,
  });
}
