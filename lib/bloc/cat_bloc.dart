import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/model/cat_model.dart';
import 'package:bloc_pattern/model/result_service.dart';
import 'package:bloc_pattern/service/get_cats.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(CatInitial()) {
    on<GetCats>((event, emit) async{
      emit(LoadingCats());
      ServiceResultModel data = await CatsService().getCats();
      if(data is CatsModel){
        emit(SuccessToLoadCatDetails(cats: data));
      }else  {
        emit(ErrorLoad(errorModel: data as ErrorModel));
      }

    });

    on<NavigateToCatDetails>((event,emit){
      
      emit(SuccessToNavigate(cat: event.cat));
    });
  }
}
