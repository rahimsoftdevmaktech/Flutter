import 'package:flutter/material.dart';
import 'package:new_app/screens/currency_converter_screen/currency_converter_screen.dart';

void main() {
  runApp(MyCurrencyConverterApp());
}

class MyCurrencyConverterApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Converter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade300),
      home: CurrecyConverterScreen(),
    );
  }
}
