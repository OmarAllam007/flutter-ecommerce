import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/core/view_model/cart_view_model.dart';
import 'package:shopapp/views/widgets/custom_button.dart';
import 'package:shopapp/views/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),
            builder:(controller)=> Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: Image.network(
                              controller.cartProducts[index].image ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartProducts[index].name ?? '',
                                  fontSize: 24,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: '\$${controller.cartProducts[index].price ?? ''}',
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 140,
                                  color: Colors.grey.shade200,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          controller.increaseQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        text: controller.cartProducts[index].quantity.toString(),
                                        alignment: Alignment.center,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          onTap: (){
                                            controller.decreaseQuantity(index);
                                          },
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                },
                itemCount: controller.cartProducts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "TOTAL",
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10,),
                  GetBuilder<CartViewModel>(
                    init: Get.find<CartViewModel>(),
                    builder:(controller)=> CustomText(
                      text: "\$${controller.totalPrice}",
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 70,
                width: 180,
                child: CustomButton(text: "Checkout", onPressed: (){
                  
                }),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
