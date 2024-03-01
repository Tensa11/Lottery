import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Under Construction'),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/lottie/UnderConstruction.json',
          // Replace this with your Lottie animation file path
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UnderConstructionPage(),
  ));
}
