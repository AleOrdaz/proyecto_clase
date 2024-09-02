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
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Text('Row1'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Icon(Icons.edit),
                      ),
                      Expanded(
                        flex:2,
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(height: 50, width: 50, color: Colors.red,),
                              ),
                              Expanded(
                                  flex: 6,
                                  child: Column(
                                    ///Toma el tamaño de los widgets hijos
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Hola'),
                                      Text('mundo')
                                    ],
                                  )
                              )

                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 2, child: Text('#'),),
                              Expanded(flex: 5, child: Icon(Icons.edit),),
                              Expanded(flex: 5,child: Icon(Icons.delete),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
