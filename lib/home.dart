import 'package:flutter/material.dart';
import 'package:primera_app_8_9/utils/personas.dart';
import 'package:primera_app_8_9/utils/constants.dart' as con;
import 'package:primera_app_8_9/utils/singleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista = [];
  int count = 0;

  final _nombreController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _edadController = TextEditingController();
  final _direccionController = TextEditingController();
  final _imagenController = TextEditingController();

  @override
  ///Cada inicie la vista carga/actualiza las variables
  ///primera acción antes de cargar toda la vista
  void initState() {
    //lista = con.lista; ///Lista inmutable o de tipo que no permita tener cambios
    //lista = List.from(con.lista); // Crea una copia mutable de la lista original
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
                  //Text(singleton.userName),
                   lista.length > 0 ? Container(
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

                        return Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: int.parse(datos[5]) % 2 == 0 ?
                              createCard(
                                txtNegritas: datos[1],
                                txtNormal1: datos[2],
                                txtNormal2: datos[3],
                                numero: datos[4],
                                id: datos[0],
                                ///int i = 0;
                                ///i.toString();
                              ) : Container(),
                            ),
                            Expanded(
                              flex:6,
                              child: int.parse(datos[5]) % 2 != 0 ?
                              createCard(
                                txtNegritas: datos[1],
                                txtNormal1: datos[2],
                                txtNormal2: datos[3],
                                numero: datos[4],
                                id: datos[0],
                                ///int i = 0;
                                ///i.toString();
                              ) : Container(),
                            )
                          ],
                        );
                          int.parse(datos[5]) % 2 == 0 ? createCard(
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
                  ) : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        ///Colores con RGBO (red, green, blue, opacidad)
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment', ///Etiqueta unica (solo se usa si hay más de un btn)
        onPressed: (){
          setState(() {
            showDialogForm(context, '');
            count = count + 1;
            //lista.add('$count#Texto $count#Texto $count#Texto $count#$count#$count');
          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  ///Alertas
  showDialogForm(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(26.0))
            ),
            title: const Text('Añadir un nuevo usuario',
                style: TextStyle(color: Colors.red)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nombreController,
                ), TextFormField(
                  
                ), TextFormField()
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    /*lista.add(
                      Persona(
                        nombre: _nombreController.text,
                        apellidos: _apellidosController.text,
                        edad: _edadController.text,
                        direccion: _direccionController.text,
                        imagen: _imagenController.text,
                      ),
                    );

                    // Limpiar los campos después de agregar
                    _nombreController.clear();
                    _apellidosController.clear();
                    _edadController.clear();
                    _direccionController.clear();
                    _imagenController.clear();*/
                    lista.add('${_nombreController.text}#Texto $count#Texto $count#Texto $count#$count#$count');

                    Navigator.of(context).pop(true);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  ' Agregar ', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }
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
      margin: EdgeInsets.only(bottom: 20.0),
      ///color: Colors.grey, /// -------------------------------------->  Estos dos atributos
      decoration: BoxDecoration(      ///                                juntos, marcará un error por
        borderRadius: BorderRadius.circular(40),    ///                  incompatibilidad de atributos
        color: Colors.black54, /// ------------------------------------>
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage('https://domain.net/saintseiya/images/some.jpg'),
              radius: 50,
            ),
          ),
          Text(txtNegritas),
          Text(txtNormal1),
          Text(txtNormal2),
          Row(
            children: [
              Icon(Icons.edit),
              Icon(Icons.delete),
            ],
          )
        ],
      )
      /*Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage('https://domain.net/saintseiya/images/some.jpg'),
                radius: 50,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            ///Convertir cualquier widget con acción de boton
            child: InkWell(
              onTap: () {
                print("Se edita el dato del id: $id");
              },
              child: Icon(Icons.edit)
            ),
          ),
          Expanded(
            flex:3,
            child: Icon(Icons.delete),
          ),
        ],
      ),*/
    );
  }
}
