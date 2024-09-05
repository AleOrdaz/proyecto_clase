import 'package:flutter/material.dart';
import 'package:primera_app_8_9/utils/constants.dart' as con;

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
              padding: EdgeInsets.all(20.0),
              ///Crea un scrool
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    Container(
                      height: 800,
                      width: 400,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: con.lista.length,
                          itemBuilder: (BuildContext context, int index) {
                            ///tipo var es una variable que se adapta o toma el
                            ///tipo de dato que se le asigna
                            var datos = con.lista[index].toString().split('#'); ///$ - no usar
                            print('ID: ${datos[0]}');

                            return createCard(
                              txtNegritas: datos[1],
                              txtNormal1: datos[2],
                              txtNormal2: datos[3],
                              numero: datos[4],
                            );
                          }
                        //const SizedBox(height: 35.0,),
                      ),
                    )

                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class createCard extends StatelessWidget {
  ///Variable con final es decir que se le asignará valor más adelante
  final String txtNegritas;
  final String txtNormal1;
  final String txtNormal2;
  final String numero;
  const createCard({
    super.key, required this.txtNegritas, required this.txtNormal1,
    required this.txtNormal2, required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      ///color: Colors.grey, /// -------------------------------------->  Estos dos atributos
      decoration: BoxDecoration(      ///                                juntos, marcará un error por
        borderRadius: BorderRadius.circular(40),    ///                  incompatibilidad de atributos
        color: Colors.black54, /// ------------------------------------>
      ),
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
    );
  }
}
