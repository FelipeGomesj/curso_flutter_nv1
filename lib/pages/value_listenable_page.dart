import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenablePage extends StatefulWidget {
  const ValueListenablePage({Key? key}) : super(key: key);

  @override
  State<ValueListenablePage> createState() => _ValueListenablePageState();
}

ValueNotifier<int> _numeroAleatorio = ValueNotifier<int>(0);
int _vezesRebuild = 1;

class _ValueListenablePageState extends State<ValueListenablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
              title: const Center(
                child:  Text('Gerenciamento de Estado'),
              ),
        leading: Navigator.of(context).canPop() ? IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)) : Container(),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _numeroAleatorio,
              builder: (_, value, __) => Text(
                'Números aleatórios: $value',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () => _findRandomNumbers(),
              child: Text(
                'toque',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _findRandomNumbers() async {
    for (int i = 0; i < 10; i++) {
      _numeroAleatorio.value = Random().nextInt(1000);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
