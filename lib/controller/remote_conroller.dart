import 'package:get/get.dart';

class RemoteData extends GetxController {
  var result = {}.obs;

  var state = States.INIT.obs;

  fetchData() async {
    state = States.LOADING.obs;
    update();

    var temp = await GetConnect()
        .get("https://jsonplaceholder.typicode.com/comments/1");
    if (temp.statusCode == 200) {
      state = States.SUCCESS.obs;
      update();
      result.addAll(temp.body);
    } else {
      state = States.ERROR.obs;
    }
  }
}

enum States { LOADING, SUCCESS, ERROR, INIT }
