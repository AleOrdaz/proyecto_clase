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
    ///Forma de obtener el tamaño de nuestra pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.all(20.0),
              ///Crea un scrool
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ///Actualiza el estado de la vista
                        setState(() {
                          bandCambiarDeEstado = bandCambiarDeEstado ? false : true;
                        });
                      },
                      child: bandCambiarDeEstado ? Container(
                        width: 100,
                        height: bandCambiarDeEstado ? 100 : 50,
                        color: bandCambiarDeEstado ? Colors.red : Colors.green,
                      ) : Text('Hola'),
                    ),
                    Container(
                      ///MediaQuery.of(context).size.height * 0.5 = /2 -> 50%
                      ///MediaQuery.of(context).size.height * 0.25 = /4 -> 25%
                      height: size.height * .5, ///100%
                      width: size.width, ///100%
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
                              id: datos[0],
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
  final String id;
  const createCard({
    super.key, required this.txtNegritas, required this.txtNormal1,
    required this.txtNormal2, required this.numero, required this.id,
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
            child: Text(txtNegritas),
          ),
          Expanded(
            flex: 2,
            ///Convertir cualquier widget con acción de boton
            child: InkWell(
              onTap: () {
                print("Se edita el dato del id: $id");
              },
              child: Icon(Icons.edit)
            ),
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
