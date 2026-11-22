import 'package:flutter/material.dart';

import 'widget/custom_elevated_button.dart';
import 'widget/custom_textform_field.dart';
import 'widget/header_widget.dart';

class CurrecyConverterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CurrecyConverterScreen> createState() => _CurrecyConverterScreenState();
}

class _CurrecyConverterScreenState extends State<CurrecyConverterScreen> {
  late final TextEditingController controller;
  late final GlobalKey<FormState> key;
  double amount = 0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    key = GlobalKey<FormState>();
  }

  void submit() {
    if (key.currentState!.validate()) {
      debugPrint('Nothing wrong');

      amount = double.parse(controller.text.trim());

      amount *= 122;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: HeaderWidget(amount: '$amount'),
              ),

              SizedBox(height: 20),

              Form(
                key: key,
                child: CustomTextFormField(textEditingController: controller),
              ),

              SizedBox(height: 16),

              CustomElevatedButton(buttonText: 'Enter', onPressed: submit),
            ],
          ),
        ),
      ),
    );
  }
}
