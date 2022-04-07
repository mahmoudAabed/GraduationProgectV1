//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation/core/services/database/cart_database_helper.dart';
// import 'package:graduation/model/cart_activity_model.dart';
//
// class CartViewModel extends GetxController{
//
//   List<CartActivityModel> _cartActivityModel =[];
//   List<CartActivityModel>get cartActivityModel =>_cartActivityModel;
//
//   CartViewModel()
//   {
//     getAllActivity();
//   }
//   getAllActivity()async
//   {
//        var dbHelper=CartDataBaseHelper.db;
// _cartActivityModel=await dbHelper.getAllActivity();
// print(_cartActivityModel.length);
// print('THIS IS LENGHT=========><');
//  update();
//
//   }
//   addActivity(CartActivityModel cartActivityModel)async
//   {
// var dbHelper=CartDataBaseHelper.db;
// await dbHelper.insert(cartActivityModel);
// update();
//   }
// }