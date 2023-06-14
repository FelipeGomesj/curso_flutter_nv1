import 'package:flutter/material.dart';
import 'package:flutter_nv1/components/login/custom_button_login.dart';
import 'package:flutter_nv1/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> _showPassword = ValueNotifier<bool>(true);
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: MediaQuery.of(context).size.width * 0.4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: _loginController.setLogin,
                  decoration: const InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ValueListenableBuilder(
                  valueListenable: _showPassword,
                  builder: (_, value, __) => TextField(
                      onChanged: _loginController.setSenha,
                      obscureText: _showPassword.value,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () =>
                                _showPassword.value = !_showPassword.value,
                            child: _showPassword.value == false
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          labelText: 'Senha',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide()))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtonLogin(
                _loginController
              ),
            ],
          ),
        ),
      ),
    );
  }
}
