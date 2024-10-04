///Punto acceso global para acceder a las variables que guardan información
///Pero se almacena si la app esta en uso
class Singleton {
  static Singleton? _instance;

  Singleton._internal() {
    _instance = this;
  }

  // Verifica si singleton es null, si es crea la instancia nueva y
  // si no devuelve la instancia del cache
  factory Singleton() => _instance ?? Singleton._internal();


  String userName = '';
}
late final Singleton singleton;


/*
Singleton
SHARED PREFERENCES (PREFERENCIAS DEL USUARIO)
5 DEPENDENCIAS
BD SQLITE O FIREBASE
MAPA
API (OPCIONAL)

LOGIN Y REGISTRO
4 VISTAS POR ALUMNO
*/
