import 'package:flutter/material.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedValue = 'Option 1';  // Solo almacenamos el label como valor seleccionado
  List<Map<String, dynamic>> options = [
    {'label': 'Option 1', 'color': Colors.blue},
    {'label': 'Option 2', 'color': Colors.green},
    {'label': 'Option 3', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Menu Example"),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option['label'],  // Usamos solo el label como valor
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    color: option['color'],  // Mostramos el color correspondiente
                  ),
                  const SizedBox(width: 5),
                  Text(option['label']),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ),
    );
  }
}
