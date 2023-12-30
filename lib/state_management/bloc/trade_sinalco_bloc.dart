import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trade_sinalco_event.dart';
part 'trade_sinalco_state.dart';

class TradeSinalcoBloc extends Bloc<TradeSinalcoEvent, TradeSinalcoState> {
  TradeSinalcoBloc() : super(TradeSinalcoInitial()) {

    on<SingleSinalco>((event, emit) {
      emit(LoadingSinalco());
      print('object');
      emit(SuccessToLoadSingle());
    });

    on<MultiSinalco>((event, emit) {
      emit(LoadingSinalco());
      print('Hello world');
      emit(SuccessToLoadMulti());
    });

    on<CutomizeImage>((event, emit) {
        if(event.image_name.contains('http')){
          emit(LoadingSinalco());
          emit(DisplayImageSuccesfully(image_to_display: event.image_name));
        }else {
          emit(ErrorImage());
        }

    });
  }
}
