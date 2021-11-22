// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopify/app/global/firebase/database/user_data/address_db.dart';

class EditAddressController extends GetxController {
  //TODO: Implement ProfileController

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  AddressDatabase addressDatabase = Get.find<AddressDatabase>();

  @override
  void onInit() {
    super.onInit();
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
