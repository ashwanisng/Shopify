import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';
import 'package:shopify/app/modules/home/controllers/home_controller.dart';

import 'package:shopify/app/modules/login/controllers/login_controller.dart';
import 'package:shopify/app/modules/profile/controllers/setting_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
      fenix: true,
    );

    // Get.lazyPut<SettingController>(
    //   () => SettingController(),
    //   fenix: true,
    // );
  }
}
