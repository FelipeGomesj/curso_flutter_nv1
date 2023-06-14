import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/home_page.dart';
import 'package:flutter_nv1/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([PrefsService.isAuth()]).then((value) => value[0] == true ? Navigator.of(context).pushNamed('/home') : Navigator.of(context).pushNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
