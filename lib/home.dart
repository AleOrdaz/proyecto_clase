import 'package:flutter/material.dart';
import 'package:primera_app_8_9/utils/constants.dart' as con;
import 'package:primera_app_8_9/utils/singleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  ///Cada inicie la vista carga/actualiza las variables
  ///primera acción antes de cargar toda la vista
  void initState() {
    //lista = con.lista; ///Lista inmutable o de tipo que no permita tener cambios
    lista = List.from(con.lista); // Crea una copia mutable de la lista original
    // TODO: implement initState
    super.initState();
  }

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
                  Text(singleton.userName),
                  Container(
                    ///MediaQuery.of(context).size.height * 0.5 = /2 -> 50%
                    ///MediaQuery.of(context).size.height * 0.25 = /4 -> 25%
                    height: size.height, ///100%
                    width: size.width, ///100%
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        ///tipo var es una variable que se adapta o toma el
                        ///tipo de dato que se le asigna
                        var datos = lista[index].toString().split('#'); ///$ - no usar
                        print('ID: ${datos[0]}');

                        return datos[5] == '1' ? createCard(
                          txtNegritas: datos[1],
                          txtNormal1: datos[2],
                          txtNormal2: datos[3],
                          numero: datos[4],
                          id: datos[0],
                          ///int i = 0;
                          ///i.toString();
                        ) : createdCard2(datos[1],datos[2], int.parse(datos[0]));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container createdCard2(String txtNegritas, String txt, int id) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom: 20.0),
      ///color: Colors.grey, /// -------------------------------------->  Estos dos atributos
      decoration: BoxDecoration(      ///                                juntos, marcará un error por
        borderRadius: BorderRadius.circular(40),    ///                  incompatibilidad de atributos
        color: Colors.black54, /// ------------------------------------>
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(txtNegritas),
                Text(txt),
              ],
            )
          ),
          Expanded(
            flex: 2,
            ///Convertir cualquier widget con acción de boton
            child: InkWell(
              onTap: () {
                print("Se edita el dato del id: $id");
              },
              child: Icon(Icons.edit),
            ),
          ),
          Expanded(
            flex:2,
            child: IconButton(
              onPressed: () {
                setState(() {
                  lista.removeAt(id); ///Eliminar un dato de la lista
                  showSnackBar('Se elimino el elemento con el id: $id', 15);
                });
              },
              icon: const Icon(Icons.delete, color: Colors.white,),
            )
          ),
        ],
      ),
    );
  }

  ///AREA PARA LAS FUNCIONES
  void showSnackBar(String texto, int duracion) {
    final  snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {
          // Cualquier acción al dar clic sobre el widget
        },
        label: 'Cerrar',
      ),
    );

    // Muestra el SnackBar usando ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
