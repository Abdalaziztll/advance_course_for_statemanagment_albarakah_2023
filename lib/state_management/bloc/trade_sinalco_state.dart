// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trade_sinalco_bloc.dart';

@immutable
sealed class TradeSinalcoState {}

final class TradeSinalcoInitial extends TradeSinalcoState {}

class SuccessToLoadSingle extends TradeSinalcoState {}

class SuccessToLoadMulti extends TradeSinalcoState {}

class LoadingSinalco extends TradeSinalcoState {}


class DisplayImageSuccesfully extends TradeSinalcoState {
  String image_to_display;
  DisplayImageSuccesfully({
    required this.image_to_display,
  });
}

class ErrorImage extends TradeSinalcoState {}
