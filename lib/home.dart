import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Text('HOLA MUNDO!!!!!!!!!!!!!!!!!!!!!!!!!!'),
          Text(
            'HOLA MUNDO 2!!!!!!!!!!!!!!!!!!!!!!!!!!',
            style: TextStyle(
              //color: Colors.brown
              color: Color(0xFF122BCB),
              fontSize: 20.5,
              fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    );
  }
}
