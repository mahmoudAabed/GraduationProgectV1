import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation/core/services/firestore_user.dart';
import 'package:graduation/model/activity.dart';
import 'package:graduation/model/cart_activity_model.dart';
import 'package:graduation/model/user_model.dart';

import '../../model/category_model.dart';
import '../services/home_service.dart';


class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<Activity> get activity => _activity;
  final List<Activity> _activity = [];

  List<UserModel> get userInfo => _userInfo;
  final List<UserModel> _userInfo = [];

  List<CartActivityModel> get cartActivity => _cartActivity;
  final List<CartActivityModel> _cartActivity = [];

  HomeViewModel() {
    getCategory();
    getActivity();
    getCart();
    getUserInfo();
  }

  getCategory() async {
    HomeService().getCategory().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
      }
      print(_categoryModel.length);
      print('------------------------');
      update();
    });
  }

  getActivity() async {
    HomeService().getActivity().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _activity.add(Activity.fromJson(value[i].data()));
      }
      print(_activity.length);
      print('------------------------');
      print('this is iiiiiiiiii');
      update();
    });
  }

  getUserInfo() async {
    FirestoreUser().getUserData().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _userInfo.add(UserModel.fromJson(value[i].data()));
      }
      print(_userInfo.length);
      print('------------------------');
      print('  print(_userInfo.length);');
      update();
    });
  }


  getCart() async {
    HomeService().getCart().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
         _cartActivity.add(CartActivityModel.fromJson(value[i].data()));
      }
      print(_cartActivity.length);
      print('------------------------');
      print('  print(_userInfo.length);');
      update();
    });
  }



}
