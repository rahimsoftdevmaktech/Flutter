import 'package:email_auth_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  late GlobalKey<FormState> key;

  RxBool isLogin = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    key = GlobalKey<FormState>();
  }

  Future<void> signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      print("👉👉SignIn Successfull: ${credential.user?.uid}");

      // if (!isClosed) return;
      Get.snackbar("Sucess", 'Sign In Successfull');

      Get.offAll(HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> signUp() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          );

      print("👉👉SignUp Successfull: ${credential.user?.uid}");

      // if (!isClosed) return;
      Get.snackbar("Sucess", 'Sign In Successfull');

      isLogin.toggle();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void onSubmit() {
    if (key.currentState!.validate()) {
      if (isLogin.value) {
        signIn();
      } else {
        signUp();
      }
    }
  }

  void showPassword() {
    isPasswordVisible.toggle();
  }

  void showConfirmPass() {
    isConfirmPasswordVisible.toggle();
  }

  void resetState() {
    key.currentState?.reset();
    isLogin.toggle();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
