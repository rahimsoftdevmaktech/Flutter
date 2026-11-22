import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key, required this.amount,
  });
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Image.asset('assets/images/taka_symbol.png', height: 80),
        Text(
          amount,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}