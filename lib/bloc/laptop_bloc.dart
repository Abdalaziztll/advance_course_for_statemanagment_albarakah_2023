import 'package:bloc/bloc.dart';
import 'package:bloc_consumer_example/config/di.dart';
import 'package:bloc_consumer_example/model/error_model.dart';
import 'package:bloc_consumer_example/model/exception_model.dart';
import 'package:bloc_consumer_example/model/laptop_model.dart';
import 'package:bloc_consumer_example/model/list_of_laptop.dart';
import 'package:bloc_consumer_example/model/result_model.dart';
import 'package:bloc_consumer_example/service/laptop_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'laptop_event.dart';
part 'laptop_state.dart';

class LaptopBloc extends Bloc<LaptopEvent, LaptopState> {
  LaptopBloc() : super(LaptopInitial()) {
    on<GetAllLaptop>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await getData();
      if (result is ListOfLaptops) {
        List<Laptop> laptopss = result.laptops;

        List<String> hashkaloz = List.generate(laptopss.length, (index) {
          return laptopss[index].toJson();
        });
        config.get<SharedPreferences>().setStringList('laptop', hashkaloz);
        emit(SuccessLaptopsFetching(laptops: result));
      } else if (result is Laptop) {
        emit(SuccessLaptopFetching(laptop: result));
      } else if (result is ExceptionModel) {
        emit(ExceptionState(exceptionModel: result));
          List<Laptop> laptop = List.generate(
            config.get<SharedPreferences>().getStringList('laptop')!.length,
            (index) => Laptop.fromJson(config
                .get<SharedPreferences>()
                .getStringList('laptop')![index]));
        emit(OfflineDataStorage(laptops: laptop));
      } else if (result is ErrorModel) {
        emit(ErrorState(errorModel: result));
      
      }
    });
  }
}
