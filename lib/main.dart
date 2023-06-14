import 'package:flutter/material.dart';
import 'package:flutter_nv1/helpers/my_colors.dart';
import 'package:flutter_nv1/pages/home_page.dart';
import 'package:flutter_nv1/pages/http_page.dart';
import 'package:flutter_nv1/pages/login_page.dart';
import 'package:flutter_nv1/pages/navigator_page_2.dart';
import 'package:flutter_nv1/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.myPrimaryColor,
        //useMaterial3: true,
      ),
      home: HomePage(title: 'Home'),
      initialRoute: '/splash',
      routes: {
        "/home" : (context) =>  HomePage(title: 'Home'),
        "/navigator2" :  (context) => const NavigatorPage2(argumento: 'main',),
        "/http" : (context) => const HttpPage(),
        "/splash" : (context) => const SplashPage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
