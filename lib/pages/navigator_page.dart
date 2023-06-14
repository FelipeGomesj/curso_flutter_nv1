import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigator_page_2.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          //maneira sem nomear a rota:
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigatorPage2(argumento: 'materialPageRoute',)));
          //Navigator.of(context).pushNamed('/navigator2');
          Navigator.of(context).pushNamed('/navigator2').then((value) => print(value)); //.then aguarda algum valor de retorno após, ele voltar da navigator2
        }, child: const Text('Página de exemplo 1'),),
      ),
    );
  }
}
