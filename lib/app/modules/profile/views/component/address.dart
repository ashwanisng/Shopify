import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/app/core/enviroment/env.dart';
import 'package:shopify/app/modules/profile/controllers/address_controller.dart';
import 'package:shopify/app/modules/profile/views/component/edit_address.dart';

class AddressView extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shipping Addresses',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: controller.addressDatabase.addressList.length,
        itemBuilder: (context, index) {
          var data = controller.addressDatabase.addressList[index];
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data["fullName"],
                              style: Env.textStyles.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: Env.textStyles.smallText.copyWith(
                                  color: Env.colors.primaryRed,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data["address"],
                          style: Env.textStyles.smallText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${data["city"]}, ${data["state"]}, ${data["zip"]}",
                          style: Env.textStyles.smallText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(() => EditAddress());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
