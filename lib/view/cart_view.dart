import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:graduation/view/widgets/custom_text.dart';
 import '../constance.dart';
import '../core/view_model/home_view_model.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GetBuilder<HomeViewModel>(
          builder: ((controller) => Column(
                children: [
                  Expanded(
                      child: Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          width: 50,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                child: Image.network(
                                    controller.cartActivity[index].image),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 15, top: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text:
                                            controller.cartActivity[index].name,
                                        fontSize: 15,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                            '\$${controller.cartActivity[index].cost}',
                                        fontSize: 20,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 1),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  CollectionReference
                                                      activityCart =
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'activityCart');

                                                  Future<void> deleteUser() {
                                                    return activityCart
                                                        .doc()
                                                        .delete()
                                                        .then((value) => print(
                                                            "User Deleted"))
                                                        .catchError((error) =>
                                                            print(
                                                                "Failed to delete user: $error"));
                                                  }

                                                  deleteUser();
                                                  print(
                                                      "cart.doc().delete()cart.doc().delete();");
                                                },
                                                icon: const Icon(Icons.delete))
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartActivity.length,
                      separatorBuilder: (BuildContext context, int index) {
                        Total(controller);
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const CustomText(
                                text: 'TOTAL',
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: '\$ ${Total(controller)}',
                                color: primaryColor,
                                fontSize: 18,
                              ),
                            ],
                          ),
                          Container(
                              height: 50,
                              width: 150,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor)),
                                  onPressed: () {
                                    Get.snackbar("Sucssful", " ",
                                        backgroundColor: Colors.black12,
                                        colorText: primaryColor,
                                        maxWidth: double.infinity,
                                        duration: const Duration(seconds: 30),
                                        snackPosition: SnackPosition.TOP,
                                        padding: const EdgeInsets.all(20),
                                        margin: const EdgeInsets.all(20),
                                        messageText: const CustomText(
                                          text: "thanks for booking",
                                          fontSize: 20,
                                          color: primaryColor,
                                        ));
                                  },
                                  child: const Text(
                                    'CHECKOUT',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )))
                        ],
                      ))
                ],
              )),
        ));
  }
}

String Total(HomeViewModel controller) {
  int total = 0;
  for (int i = 0; i < controller.cartActivity.length; i++) {
    total += controller.cartActivity[i].cost;
  }
  print(total);
  print('totalis=>>>>>>>>>>');
  return total.toString();
}
