import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:primera_app_8_9/api.dart';
import 'package:primera_app_8_9/home.dart';
import 'package:primera_app_8_9/login.dart';
import 'package:primera_app_8_9/new_widget.dart';
import 'package:primera_app_8_9/sqlite.dart';
import 'package:primera_app_8_9/utils/singleton.dart';
import 'package:primera_app_8_9/utils/util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //inicia widgets
  HttpOverrides.global = MyHttpOverrides();
  sqfliteFfiInit();

  //await Firebase.initializeApp();
  //final FirebaseFirestore db = FirebaseFirestore.instance; //instancia de BD
  //final CollectionReference users = db.collection('users'); //Referencia de la tabla
  print('');
  print('users');

  /// Función de agregar
  /*final Map<String, dynamic> userFields = {
    'name': 'alejandro2',
    'last_name': 'ordaz',
    'age': '28'
  };
  await users.doc().set(userFields);*/
  ///fin de función de agregar

  /*
  ///Función editar
  final Map<String, dynamic> userFields = {
    'name': 'oscar alejandro',
  };
  await users.doc('newUser').update(userFields);
  ///fin de funcion de editar

  ///Función de eliminar
  await users.doc('newUser').delete;*/

  Singleton singleton = Singleton();
  //Obtener las coorddenadas del dispositivo
  try {
    //Solicitamos los permisos de la geolocalización
    //obtenemos la información
    Position position = await Utils.getGeoLocationPosition();

    singleton.latitud = position.latitude;
    singleton.longitud = position.longitude;
  } catch(e){
    //Asignar valor por default
    singleton.latitud = 22.123456;
    singleton.longitud = -101.123456;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApp2(),
    );
  }
}
