import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:primera_app_8_9/utils/get_api.dart';
import 'package:primera_app_8_9/utils/singleton.dart';
import 'package:primera_app_8_9/utils/util.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Singleton singleton = Singleton();
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _center = const LatLng(22.144596, -101.009064);

  //Origin
  static const LatLng sourceLocation = LatLng(22.144596, -101.009064);
  //Destino
  static const LatLng destination = LatLng(22.14973, -100.992221);

  //Guardar los puntos con las coordenadas (lat, lng)
  final List<LatLng> polyPoints = [];
  //Guardar las lineas sobre el mapa
  final Set<Polyline> polyLines = {};

  @override
  void initState() {
    getJsonData(); // Función que realiza el llamado a la api
    cambiaLatLng(); // Función para cambiar las coordenadas por las del dispositivo
    // TODO: implement initState
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void cambiaLatLng() {
    _center =  LatLng(singleton.latitud,singleton.longitud);
    _getAddress();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            polylines: polyLines, //Dibuja la polyline en el mapa
            //Función para actualizar la posisión del dispositivo si esta
            //en movimiento
            onCameraMove: (CameraPosition position) {
              setState(() {
                singleton.latitud = position.target.latitude;
                singleton.longitud = position.target.longitude;
                //_getAddress();
              });
            },
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0,),
            markers:{
              const Marker(
                markerId: MarkerId("source"),
                position: sourceLocation,
                infoWindow: InfoWindow(title: "Información inicio"),
              ),
              Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                  infoWindow: const InfoWindow(title: "Información destino"),
                  onTap: () {
                    setState(() {
                      //showAlertDialog(context);
                    });
                  },
              ),
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              singleton.direccion, style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  _getAddress() async {
    try {
      print('${singleton.latitud} ${singleton.longitud}');
      List<Placemark> p = await placemarkFromCoordinates(
          singleton.latitud,singleton.longitud);
      Placemark place = p[0];
      setState(() {
        print(place);
        singleton.direccion = "${place.street}, ${place.locality}";
        print(singleton.direccion);
      });

    } catch (e) {
      singleton.direccion = 'No se encontro información';
      print(e);
    }
  }

  Future<void> getJsonData() async {
    //Llamado a la clase
    NetworkHelper networkHelper = NetworkHelper(
      startLat: 22.144596,
      startLng: -101.009064,
      endLat: 22.149730,
      endLng: -100.992221,
    );

    try {
      //print(data['features'][0]['geometry']['coordinates']); // 3er
      var data;
      //LLamado a la funcion que solicita a la api las coordenadas
      data = await networkHelper.getData();
      print('data: $data'); //json completo
      print(data['features'][0]['geometry']);
      //Lista de de tipo lineString (tipo que llega en la api)
      LineString ls = LineString(data['features'][0]['geometry']['coordinates']);
      //Se separa por coordenada para crear la lista de puntos
      for(int i = 0; i < ls.lineString.length; i++){
        print('${ls.lineString[i][1]}, ${ls.lineString[i][0]}');
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if(polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }

    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }

  //Función que crea la lista de lineas
  setPolyLines() {
    setState(() {
      ///p1 --------- p2 ------- p3
      Polyline polyline = Polyline(
          polylineId: const PolylineId('polilyne'),
          color: Colors.red,
          width: 5, //pixeles
          points: polyPoints
      );
      polyLines.add(polyline);
    });
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
