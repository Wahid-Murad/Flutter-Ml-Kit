import 'package:get/get.dart';
import 'package:text_recognition/controller/home_controller.dart';

class AllControllerBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
