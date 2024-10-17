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
    apiKey: 'AIzaSyDGKlrv-nh_pZ0npXCOo01ubW8uLyL5jGs',
    appId: '1:323098627613:web:a0c2690e6bf385ea5900f4',
    messagingSenderId: '323098627613',
    projectId: 'moneyapp-aa07e',
    authDomain: 'moneyapp-aa07e.firebaseapp.com',
    storageBucket: 'moneyapp-aa07e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLHC4mL33B4mgwbd-o30rs0Mj-9DGSYug',
    appId: '1:323098627613:android:8a76625c050232bd5900f4',
    messagingSenderId: '323098627613',
    projectId: 'moneyapp-aa07e',
    storageBucket: 'moneyapp-aa07e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_GJx5k4ounzmPU94oXNiFi7YCMxlkVE8',
    appId: '1:323098627613:ios:76004202f9e633555900f4',
    messagingSenderId: '323098627613',
    projectId: 'moneyapp-aa07e',
    storageBucket: 'moneyapp-aa07e.appspot.com',
    iosBundleId: 'com.example.moneyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_GJx5k4ounzmPU94oXNiFi7YCMxlkVE8',
    appId: '1:323098627613:ios:76004202f9e633555900f4',
    messagingSenderId: '323098627613',
    projectId: 'moneyapp-aa07e',
    storageBucket: 'moneyapp-aa07e.appspot.com',
    iosBundleId: 'com.example.moneyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGKlrv-nh_pZ0npXCOo01ubW8uLyL5jGs',
    appId: '1:323098627613:web:d4838a3532c2d42b5900f4',
    messagingSenderId: '323098627613',
    projectId: 'moneyapp-aa07e',
    authDomain: 'moneyapp-aa07e.firebaseapp.com',
    storageBucket: 'moneyapp-aa07e.appspot.com',
  );
}
