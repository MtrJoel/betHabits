// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyADDhCRaLSLdbAFpvAYjKLTJqKxFAN5Qa4',
    appId: '1:125118371755:web:d70695090bb9f20674a4ee',
    messagingSenderId: '125118371755',
    projectId: 'pomodoro-530bc',
    authDomain: 'pomodoro-530bc.firebaseapp.com',
    storageBucket: 'pomodoro-530bc.appspot.com',
    measurementId: 'G-FTRDX1RG52',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClcGc6ERcO5WMItqbSiuXRL45R_5w8nO0',
    appId: '1:125118371755:android:bdf84b09885c948f74a4ee',
    messagingSenderId: '125118371755',
    projectId: 'pomodoro-530bc',
    storageBucket: 'pomodoro-530bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADRpcqec9cYOqv5NbcER7UJxAK79dPb7g',
    appId: '1:125118371755:ios:f2e28a34ce84727674a4ee',
    messagingSenderId: '125118371755',
    projectId: 'pomodoro-530bc',
    storageBucket: 'pomodoro-530bc.appspot.com',
    iosBundleId: 'com.example.bethabitss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADRpcqec9cYOqv5NbcER7UJxAK79dPb7g',
    appId: '1:125118371755:ios:f2e28a34ce84727674a4ee',
    messagingSenderId: '125118371755',
    projectId: 'pomodoro-530bc',
    storageBucket: 'pomodoro-530bc.appspot.com',
    iosBundleId: 'com.example.bethabitss',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADDhCRaLSLdbAFpvAYjKLTJqKxFAN5Qa4',
    appId: '1:125118371755:web:70ca2fd12981062074a4ee',
    messagingSenderId: '125118371755',
    projectId: 'pomodoro-530bc',
    authDomain: 'pomodoro-530bc.firebaseapp.com',
    storageBucket: 'pomodoro-530bc.appspot.com',
    measurementId: 'G-LKVXM0ZBKB',
  );
}
