import 'package:get/get.dart';
import 'package:trade_zilla/controllers/bottomNavController.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
  }
}
