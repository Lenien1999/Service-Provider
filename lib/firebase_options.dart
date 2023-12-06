// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyASrTbp_U1bkwXjmlCkDFuktlZzlyOoj-k',
    appId: '1:1021612486104:web:60eb13ff69ddb5c259d6ad',
    messagingSenderId: '1021612486104',
    projectId: 'service-provider-e68bd',
    authDomain: 'service-provider-e68bd.firebaseapp.com',
    storageBucket: 'service-provider-e68bd.appspot.com',
    measurementId: 'G-S3BJ38Z342',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTBcCctsllR2O-wyInwDbls_jKqEJAcug',
    appId: '1:1021612486104:android:c5fc985b47677ce259d6ad',
    messagingSenderId: '1021612486104',
    projectId: 'service-provider-e68bd',
    storageBucket: 'service-provider-e68bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFr45mcHNQ9HY5COnJRVRLIN6bGPnIk84',
    appId: '1:1021612486104:ios:43e2b06e05495a5d59d6ad',
    messagingSenderId: '1021612486104',
    projectId: 'service-provider-e68bd',
    storageBucket: 'service-provider-e68bd.appspot.com',
    iosBundleId: 'com.example.serviceprovder',
  );
}