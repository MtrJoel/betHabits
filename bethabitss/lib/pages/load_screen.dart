import 'package:bethabitss/pages/login_pages.dart';
import 'package:bethabitss/routes/callroutes.dart';
import 'package:bethabitss/servers/pref_users.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Verificar el auto-login después de que el contexto esté completamente construido
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAutoLogin(context);
    });

    return Scaffold(
       body: Center(
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: Colors.yellow, end: Colors.blue),
          duration: const Duration(seconds: 2), // Duración de la animación
          builder: (context, color, child) {
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.yellow),
            );
          },
        ),
      ),
    );
  }
}

void checkAutoLogin(BuildContext context) {
  usersPreferences prefs = usersPreferences();
  if (prefs.authToken != null && prefs.email != null) {
    // Credenciales disponibles, redirigir a la HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const CallRoutes()), // Redirige a la página principal
    );
  } else {
    // No hay credenciales, redirigir a la página de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const LoginPages()), // Redirige a la página de login
    );
  }
}
