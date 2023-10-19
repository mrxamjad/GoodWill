import 'package:get/get.dart';
import 'package:good_will/getx/controller/networkController.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
