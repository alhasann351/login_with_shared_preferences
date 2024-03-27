import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_with_shared_preferences/login_screen.dart';
import 'package:login_with_shared_preferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = 'KEYLOGIN';

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: const Text(
            'Splash Screen',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void whereToGo() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(),),);
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
      }
    });
  }
}
