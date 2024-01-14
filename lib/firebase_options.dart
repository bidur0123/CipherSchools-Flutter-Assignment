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
        return macos;
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
    apiKey: 'AIzaSyDcbNAcqzYT69xTe35-7mfB5IvWZSM-Bos',
    appId: '1:517892833755:web:6234cd713d9da7eca5e7fe',
    messagingSenderId: '517892833755',
    projectId: 'finance-fd0e9',
    authDomain: 'finance-fd0e9.firebaseapp.com',
    storageBucket: 'finance-fd0e9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtFIjBCpMZL9SqSasLyzWHj1i5AbCN37c',
    appId: '1:517892833755:android:b5bc868a8fc69974a5e7fe',
    messagingSenderId: '517892833755',
    projectId: 'finance-fd0e9',
    storageBucket: 'finance-fd0e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlh3jGTsgCDEpgoFvDOg6A_z5TppKKE2k',
    appId: '1:517892833755:ios:1a303444e2a07143a5e7fe',
    messagingSenderId: '517892833755',
    projectId: 'finance-fd0e9',
    storageBucket: 'finance-fd0e9.appspot.com',
    iosBundleId: 'com.example.managment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlh3jGTsgCDEpgoFvDOg6A_z5TppKKE2k',
    appId: '1:517892833755:ios:1a303444e2a07143a5e7fe',
    messagingSenderId: '517892833755',
    projectId: 'finance-fd0e9',
    storageBucket: 'finance-fd0e9.appspot.com',
    iosBundleId: 'com.example.managment',
  );
}
