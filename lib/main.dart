import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopify/app/data/service/binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AllBinding(),
    ),
  );
}
