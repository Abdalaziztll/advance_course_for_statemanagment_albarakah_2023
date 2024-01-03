// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}


class GetCats extends CatEvent {

}

class NavigateToCatDetails extends CatEvent {
  CatModel cat;
  NavigateToCatDetails({
    required this.cat,
  });
}
