
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_text.dart';
import 'login_screen.dart';

class RegisterView extends GetWidget<AuthViewModel> {
    RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
          leading: IconButton(icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed:(){Get.offAll(LoginScreen());} ,),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children:  [

            const SizedBox(height: 30,),
            const CustomText(
              text: 'Sing Up',
              fontSize: 30,
              color: Colors.black,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 30,),

            Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                      text: 'Name', fontSize: 14, color: Colors.grey.shade900),
                  TextFormField(
                    onSaved: (val) {
                      if(val!=null)
                      {
                        controller.name=val;
                      }
                      else
                      {
                        Get.snackbar('ERROR','PLZ ENTER EMAIL!!');
                      }
                    },
                    validator: (val) {
                      if(val==null) {
                        print('---------ERROR-------');
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Mahmoud',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                      text: 'Email',
                      fontSize: 14,
                      color: Colors.grey.shade900),
                  TextFormField(
                    onSaved: (val) {
                      controller.email=val;
                    },
                    validator: (val) {
                      if(val==null) {
                        print('---------ERROR-------');
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: 'Email@xxx.com',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                      text: 'Password',
                      fontSize: 14,
                      color: Colors.grey.shade900),
                  TextFormField(
                    onSaved: (val) {
                      controller.password=val;
                    },
                    validator: (val) {
                      if(val==null)
                        print('---------ERROR-------');
                    },
                    decoration: const InputDecoration(
                        hintText: '******',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: () {
                      _key.currentState!.save();

                      if(_key.currentState!.validate())
                      {
                        controller.sinUpInPassAndEmail();

                      }
                    },
                    child: const Text(
                      'Sing Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: primaryColor,
                    padding: const EdgeInsets.all(10),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),


          ],
        ),
      ),
    ),
    );
  }
}
