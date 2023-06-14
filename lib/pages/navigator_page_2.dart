import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorPage2 extends StatelessWidget {
  const NavigatorPage2({required this.argumento});

  final String argumento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(argumento),
            //// o Navigator.of(context).canPop() verifica se é possível voltar para a rota, ou seja, verifica se NÃO é um pushReplacementNamed, pois se for ele vai cair no null como programado
            ElevatedButton(
              onPressed: () => Navigator.of(context).canPop()
                  ? Navigator.of(context).pop('Retornando que foi chamado no .then da página navigator_page')
                  : null,
              child: Text('Navigator.of(context).pop()'),
            )
          ],
        ),
      ),
    );
  }
}
