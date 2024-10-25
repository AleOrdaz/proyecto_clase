import 'package:geolocator/geolocator.dart';

class Utils{
  // Función asincrona para obtener las coordenadas (lat y lon) del celular
  static Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Se revisa si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, no continúen
      // accediendo y solicitar al usuarios habilitar los servicios de ubicación.
      await Geolocator.openLocationSettings();
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados. La proxima vez que inicie la app se
        // volveran a pedir pero si son negados no permite continuar con el
        // flujo de la app.
        return Future.error('los permisos de ubicación fueron negados');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Los permisos se niegan para siempre.
      return Future.error(
          'Si los permisos de ubicación se niegan permanentemente, '
              'no podemos solicitar permisos.');
    }
    // Se otorgaron los permisos y podemos seguir accediendo a la posición
    // del dispositivo.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}