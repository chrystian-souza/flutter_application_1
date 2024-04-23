import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 166, 212),
          ),
          child: Center(
            child: Text(
              'Olá, mundo!',
              style: TextStyle(
                  color: const Color.fromARGB(255, 244, 241, 240),
                  fontSize: 30),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.yellow,
              width: 150,
              height: 100,
              child: Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 9, 9), fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 246, 5, 29),
              width: 150,
              height: 100,
              child: Center(
                child: Text(
                  'Container 2',
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 9, 9), fontSize: 20),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
