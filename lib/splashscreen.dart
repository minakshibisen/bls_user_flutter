
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'checkpinscreen.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateScreen();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset('assets/images/ic_logo.png',
              width: 200, height: 200)),
    );
  }


Future<void> _navigateScreen() async {
  var prefrance = await SharedPreferences.getInstance();

  var id = prefrance.getString("id");

  await Future.delayed(const Duration(seconds: 3), () {});
  if (id == null || id.isEmpty) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>  LoginScreen()), // Your Home Screen
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const CheckPinScreen()), // Your Home Screen
    );
  }
}
}