// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}


class SuccessToLoadCatDetails extends CatState {
  CatsModel cats;
  SuccessToLoadCatDetails({
    required this.cats,
  });
}


class LoadingCats extends CatState {}

class ErrorLoad extends CatState {
  ErrorModel errorModel;
  ErrorLoad({
    required this.errorModel,
  });
}


class SuccessToNavigate extends CatState {
  CatModel cat;
  SuccessToNavigate({
    required this.cat,
  });

  
}
