// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/database/user_data/address_db.dart';

class AddressController extends GetxController {
  //TODO: Implement ProfileController

  AddressDatabase addressDatabase = Get.find<AddressDatabase>();

  @override
  void onInit() {
    super.onInit();
    addressDatabase.fetchUserAddress();

    // print(addressDatabase.addressList.length);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
