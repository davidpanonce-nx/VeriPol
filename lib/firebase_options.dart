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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyANN9STf8xWx8U6bPPIKN_qnI5jEJzNHQY',
    appId: '1:481305738477:web:4cf97351689d21779be0e4',
    messagingSenderId: '481305738477',
    projectId: 'veripol-156e4',
    authDomain: 'veripol-156e4.firebaseapp.com',
    storageBucket: 'veripol-156e4.appspot.com',
    measurementId: 'G-CSBZ1SFPE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKJ_MUdVnqZSIpoVLsMJbutIZjM_hvblM',
    appId: '1:481305738477:android:0bbfba0c68196b8a9be0e4',
    messagingSenderId: '481305738477',
    projectId: 'veripol-156e4',
    storageBucket: 'veripol-156e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHKUZBcIt4WOjBBO_Wx_MCG1XF3PRyE8M',
    appId: '1:481305738477:ios:c17d74f9a6dd5bff9be0e4',
    messagingSenderId: '481305738477',
    projectId: 'veripol-156e4',
    storageBucket: 'veripol-156e4.appspot.com',
    androidClientId: '481305738477-4fhmmt4ooudoed3h2cuhmo435bb5njr8.apps.googleusercontent.com',
    iosClientId: '481305738477-8bt49cicr8a3c7b2iks18or8eut94f2h.apps.googleusercontent.com',
    iosBundleId: 'com.datospilipinas.veripol.dev',
  );
}