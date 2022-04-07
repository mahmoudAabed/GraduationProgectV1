
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/view/auth/register_view.dart';
import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
 final GlobalKey<FormState> _key=GlobalKey<FormState>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
             children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const CustomText(
                    text: 'Welcome',
                    fontSize: 30,
                    color: Colors.black,
                    alignment: Alignment.topLeft,
                  ),
                  GestureDetector(
                    onTap:(){ Get.to( RegisterView());},
                    child: const CustomText(
                      text: 'sing Up',
                      fontSize: 20,
                      color: primaryColor,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Sing in to continue',
                      fontSize: 15,
                      color: Colors.grey,
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText(
                        text: 'Email', fontSize: 14, color: Colors.grey.shade900),
                    TextFormField(
                      onSaved: (val) {
                        if(val!=null)
                          {
                            controller.email=val;
                          }
                        else
                          {
                            Get.snackbar('ERROR','PLZ ENTER EMAIL!!');
                          }
                      },
                      validator: (val) {
                        if(val==null)
                          print('---------ERROR-------');
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
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: const CustomText(
                        text: 'Forget password?',
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
                            controller.loginInPassAndEmail();

                          }
                      },
                      child: const Text(
                        'Sing in',
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
              const CustomText(text: '-OR-',alignment: Alignment.center,fontSize: 20,),
              FlatButton(
                child: Row(children: const [
                  Icon(Icons.email,color: Colors.blueAccent,size: 25,),
                  SizedBox(width: 45,),
                  Text('Sing in whit google',style: TextStyle(fontSize: 20),)
                ],),
                onPressed: (){
                  controller.loginInPassAndEmail();
                },
              ),
               const SizedBox(height: 20,),
               FlatButton(
                 child: Row(children: const [
                   Icon(Icons.phone,color: Colors.blueAccent,size: 25,),
                   SizedBox(width: 45,),
                   Text('Sing in whit phone',style: TextStyle(fontSize: 20),)
                 ],),
                 onPressed: (){},
               )


             ],
          ),
        ),
      ),
    );
  }
}
