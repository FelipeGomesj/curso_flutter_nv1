import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nv1/controllers/login_controller.dart';

class CustomButtonLogin extends StatelessWidget {
   CustomButtonLogin(this.loginController);

   final LoginController  loginController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.loading,
      builder: (BuildContext _, loadingValue, __) => loadingValue ==
          false
          ? ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.green)),
          onPressed: () async {
            if (await loginController
                .auth()
                .then((retorno) => retorno == true)) {
              Navigator.of(context).pushReplacementNamed('/home');
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                content: Text(
                  'Credenciais inválidas, por favor verifique-as e tente novamente.', style: TextStyle(
                    fontSize: 18
                ),),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: const Text('Login'))
          : CircularProgressIndicator(
        backgroundColor: Colors.green.shade300,
        color: Colors.green,
      ),
    );
  }
}
