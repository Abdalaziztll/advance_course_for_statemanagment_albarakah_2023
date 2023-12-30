// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trade_sinalco_bloc.dart';

@immutable
sealed class TradeSinalcoEvent {}

class SingleSinalco extends TradeSinalcoEvent {}


class MultiSinalco extends TradeSinalcoEvent {}

class CutomizeImage extends TradeSinalcoEvent {
  String image_name;
  CutomizeImage({
    required this.image_name,
  });
}


