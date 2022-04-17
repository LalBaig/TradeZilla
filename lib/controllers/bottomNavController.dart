import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var tabindex = 0;
  void changetabindex(int index) {
    tabindex = index;
    update();
  }
}
