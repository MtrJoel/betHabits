import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class usersPreferences {
  static late SharedPreferences _prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'Login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
  // Método para guardar el correo electrónico
  String? get email {
    return _prefs.getString('email');
  }

  set email(String? value) {
    if (value != null) {
      _prefs.setString('email', value);
    } else {
      _prefs.remove('email');
    }
  }

  // Método para guardar el token de autenticación
  String? get authToken {
    return _prefs.getString('authToken');
  }

  set authToken(String? value) {
    if (value != null) {
      _prefs.setString('authToken', value);
    } else {
      _prefs.remove('authToken');
    }
  }

  // Método para limpiar las preferencias (para logout)
  void clearPreferences() {
    _prefs.clear();
  }
}
