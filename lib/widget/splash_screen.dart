import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: Colors.blueAccent,
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Loading",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
