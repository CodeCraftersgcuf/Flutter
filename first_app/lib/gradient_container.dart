import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';


class GradientContainer extends StatelessWidget {
  // GradientContainer({key}): super(key:key);
 const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
