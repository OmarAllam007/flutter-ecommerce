import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/cart_product_model.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/views/widgets/custom_button.dart';
import 'package:shopapp/views/widgets/custom_text.dart';

import '../../core/view_model/cart_view_model.dart';

class DetailsScreen extends StatelessWidget {
  Product? product;

  DetailsScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  product!.image ?? '',
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: product?.name ?? '',
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Size"),
                                CustomText(text: product?.size ?? ''),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Color"),
                                Container(
                                  width: 35,
                                  height: 25,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: product?.color,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Details",
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: product?.description ?? '',
                        fontSize: 18,
                        height: 2.2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: "PRICE",color: primaryColor,fontSize: 18,),
                      CustomText(text: "\$${product?.price}"),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder:(controller)=> Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width / 2.5,

                      child: CustomButton(text: "Add", onPressed: () {
                        controller.addProductToCart(CartProductModel(
                          name: product?.name ?? '',
                          image: product?.image ?? '',
                          price: product?.price ?? '',
                          quantity: 1,
                          productId: product?.productId ?? '',
                        ));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
