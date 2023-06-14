import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Olá Mundo!',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.red,
                child: const Center(
                  child: Text('Container 1'),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.purple,
                  child: const Center(
                    child: Text('Container 2'),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
