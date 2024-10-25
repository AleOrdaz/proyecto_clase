import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:primera_app_8_9/api.dart';
import 'package:primera_app_8_9/home.dart';
import 'package:primera_app_8_9/login.dart';
import 'package:primera_app_8_9/sqlite.dart';
import 'package:primera_app_8_9/utils/singleton.dart';
import 'package:primera_app_8_9/utils/util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'mapa.dart';

Future<void> main() async {
  sqfliteFfiInit();
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
      home: const Mapa(),
    );
  }
}
