import 'package:flutter/material.dart';

/// PARA CONTENER O AYUDAR A LOS CAMBIOS DE ESTADO
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///Apartado para crear variables
  final usuario = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///STACK: Constructor que cada widget que usemos los colocara uno ensima de otro
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 100, left: 50, bottom: 10, right: 20),
              child: Container(
                //color: Colors.grey,
                child:  Column(
                  mainAxisSize: MainAxisSize.min, ///Toma el tamaño de sus hijos widgets
                  children: [
                    const Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 50.0,),
                    const Text('Usuario:'),
                    TextFormField(
                      controller: usuario,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: 'Agrega tu usuario', ///Texto de apoyo en el interior del input
                          prefixIcon: Icon(Icons.verified_user), ///Agrega un icon al interior del input
                          fillColor: Colors.red,
                          border: OutlineInputBorder( ///Bordes para el input
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                //color: Colors.red,
                                  width: 5,
                                  style: BorderStyle.solid
                              )
                          )
                      ),
                    ),
                    Text('Contraseña:'),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                    ),
                    const SizedBox(height: 150.0,),
                    ElevatedButton(
                      onPressed: (){
                        validaUser();
                      }, ///(){} = Función interna
                      child: Text('INGRESAR'),
                    )
                    //Icon(Icons.home),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  void validaUser() {
    ///Detectar y actualizar el estado de la vista actual
    setState(() {
      print('Usuario: ${usuario.text}');
      print("Contraseña: "+pass.text);
      //solo puede ingresar si escribi user = User01 y pass = Pass02
      //un mensaje si es valido o incorrecto
      if(usuario.text == 'User01' && pass.text == 'Pass02'){
        print('Usuario valido');
      } else {
        print('usuario invalido');
      }
    });
  }
}
