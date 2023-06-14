import 'package:flutter/cupertino.dart';
import 'package:flutter_nv1/services/prefs_service.dart';

class LoginController{
  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setSenha(String value) => _pass = value;

  ValueNotifier<bool> loading = ValueNotifier(false);
  Future<bool> auth() async{
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
    if(_login == 'admin' && _pass == 'admin'){
      PrefsService.save(user: _login!);
      return true;
    }
    return false;
  }

}