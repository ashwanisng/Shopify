import 'package:get/get.dart';
import 'package:shopify/app/modules/login/controllers/login_controller.dart';

import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
  }
}
