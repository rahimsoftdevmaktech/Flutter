import 'package:email_auth_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xfff5f7fb),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.lock_outline, size: 55, color: Colors.blue),

                  const SizedBox(height: 20),

                  const Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    controller.isLogin.value
                        ? 'Sign in to continue'
                        : 'Create an account to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  Form(
                    key: controller.key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return "Please enter an email";
                            }
                            if (!value.contains('@')) {
                              return "Please enter a valid mail";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: controller.passController,
                          obscureText: !controller.isPasswordVisible.value,
                          textInputAction: controller.isLogin.value
                              ? TextInputAction.done
                              : TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.showPassword();
                              },
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return "Please enter a password";
                            }
                            if (value.length < 6) {
                              return "Please enter password at least with 6 digit";
                            }
                            return null;
                          },
                        ),
                        if (controller.isLogin.value) ...[
                          SizedBox(height: 10),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("Forget Password?"),
                          ),
                        ],

                        if (!controller.isLogin.value) ...[
                          SizedBox(height: 18),
                          TextFormField(
                            controller: controller.confirmPassController,
                            obscureText:
                                !controller.isConfirmPasswordVisible.value,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showConfirmPass();
                                },
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null && value!.isEmpty) {
                                return "Please enter a password";
                              }
                              if (value.length < 6) {
                                return "Please enter password at least with 6 digit";
                              }
                              if (controller.passController.text.trim() !=
                                  controller.confirmPassController.text
                                      .trim()) {
                                return "Password are not equal to confirm password";
                              }
                              return null;
                            },
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: () {
                      controller.onSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      controller.isLogin.value ? 'Sign In' : "Sign Up",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.isLogin.value
                            ? "Don't have an account? "
                            : "Already have an account?",
                      ),

                      TextButton(
                        onPressed: () {
                          controller.resetState();
                        },
                        child: Text(
                          controller.isLogin.value ? 'Sign Up' : 'Sign In',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
