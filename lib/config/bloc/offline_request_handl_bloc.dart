import 'package:bloc/bloc.dart';
import 'package:bloc_consumer_example/bloc/laptop_bloc.dart';
import 'package:bloc_consumer_example/model/create_new_laptop.dart';
import 'package:bloc_consumer_example/model/laptop_model.dart';
import 'package:meta/meta.dart';

part 'offline_request_handl_event.dart';
part 'offline_request_handl_state.dart';

      int count = 0;
class OfflineRequestHandlBloc extends Bloc<OfflineRequestHandlEvent, OfflineRequestHandlState> {
  OfflineRequestHandlBloc() : super(OfflineRequestHandlInitial()) {
    on<FailedToSendRequest>((event, emit) {
     emit(CounterOfRequest(requests:count++ ,newlaptop:event.laptop ));
    });
  }
}
