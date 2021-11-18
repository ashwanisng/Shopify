import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';
import 'package:shopify/app/modules/login/controllers/login_controller.dart';

import 'package:shopify/app/modules/signup/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );
  }
}
