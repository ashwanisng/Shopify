import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';
import 'package:shopify/app/modules/profile/controllers/edit_address_controller.dart';
import 'package:shopify/app/utils/custom_button.dart';

class EditAddress extends GetView<EditAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adding Shipping Address",
          style: Env.textStyles.descriptionText.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller.nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "Full Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.addressController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "Address",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.cityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "City",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.stateController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "State/Province/Region",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.zipController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "Zip Code (Postal Code)",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.countryController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xffe7edeb),
                  hintText: "Country",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: "SAVE ADDRESS",
                onPressed: () {
                  controller.addressDatabase.addUserAddress(
                    address: controller.addressController.text.trim(),
                    city: controller.cityController.text.trim(),
                    country: controller.countryController.text.trim(),
                    fullName: controller.nameController.text.trim(),
                    state: controller.stateController.text.trim(),
                    zip: int.parse(controller.zipController.text.trim()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
