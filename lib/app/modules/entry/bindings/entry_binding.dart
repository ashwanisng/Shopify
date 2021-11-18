import 'package:get/get.dart';

import 'package:shopify/app/modules/entry/controllers/entry_controller.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(
      () => EntryController(),
    );
  }
}
