import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/auth/auth.dart';
import 'package:shopify/app/modules/login/controllers/login_controller.dart';

import 'package:shopify/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopify/app/modules/signup/controllers/signup_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );

    Get.lazyPut<SignupController>(
      () => SignupController(),
      fenix: true,
    );

    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
      fenix: true,
    );
  }
}
