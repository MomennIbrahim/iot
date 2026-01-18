import 'package:flutter/material.dart';

class CustomAdaptiveLoading extends StatelessWidget {
  const CustomAdaptiveLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
