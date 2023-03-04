import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/core/view_model/home_view_model.dart';
import 'package:shopapp/views/auth/login_screen.dart';
import 'package:shopapp/views/screens/details_screen.dart';
import 'package:shopapp/views/widgets/custom_text.dart';

import '../core/view_model/control_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchFormField(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(text: "Categories"),
                      SizedBox(
                        height: 20,
                      ),
                      _categoriesView(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Seller",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See All",
                            fontSize: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            )),
      ),
    );
  }

  Widget _categoriesView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        controller.categoriesList[index].image ?? ''),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoriesList[index].name ?? 'N/A',
                  color: Colors.black,
                ),
              ],
            );
          },
          itemCount: controller.categoriesList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsScreen(
                    product: controller.productList[index],
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 220,
                        child: Image.network(
                          controller.productList[index].image ?? '',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productList[index].name ?? '',
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productList[index].description ?? '',
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "\$${controller.productList[index].price ?? ''}",
                      alignment: Alignment.bottomLeft,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: controller.productList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
