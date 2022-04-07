import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/user_model.dart';
import '../services/firestore_user.dart';
import '../../view/home_screen.dart';

class AuthViewModel extends GetxController {
  late final email, password, name;
  FirebaseAuth auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();

  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  //login whit email and pass

  Future<void> loginInPassAndEmail() async {
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value)async{
        saveUser(value);
        print('-----------:)'+value.user!.uid+'---------------------:(');
      });
      Get.offAll(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      Get.snackbar('error login ', e.message.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> sinUpInPassAndEmail() async {
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        saveUser(value);
        print('-----------:)'+value.user!.uid+'---------------------:(');
      });
      Get.offAll(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      Get.snackbar('error login ', e.message.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
  Future<void> saveUser(UserCredential value)
  async {
    await FirestoreUser().addUserToFireStore(UserModel(
      value.user!.uid,
      value.user!.uid,
      name ?? value.user!.displayName,
      '',
    ));
    print('-----------:)'+value.user!.uid+'---------------------:(');
  }
}
