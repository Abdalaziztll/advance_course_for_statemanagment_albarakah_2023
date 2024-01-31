import 'package:get/get.dart';

class RemoteData extends GetxController {
  final result = {}.obs;

  final state = States.INIT.obs;

  fetchData() async {
    state.value = States.LOADING;
    // update();

    var temp = await GetConnect()
        .get("https://jsonplaceholder.typicode.com/comments/1");
        print(temp);
    if (temp.statusCode == 200) {
      state.value = States.SUCCESS;
      // update();
      result.addAll(temp.body);
    } else {
      state.value = States.ERROR;
    }
  }
}

enum States { LOADING, SUCCESS, ERROR, INIT }
