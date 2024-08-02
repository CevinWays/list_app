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
    apiKey: 'AIzaSyDfhCGCZh7TGQpn7aeOA1PUFK9gIyEH9m4',
    appId: '1:375430683927:web:933bb60b127797cc84eb52',
    messagingSenderId: '375430683927',
    projectId: 'lilistapp',
    authDomain: 'lilistapp.firebaseapp.com',
    storageBucket: 'lilistapp.appspot.com',
    measurementId: 'G-TLVDQ4JTWL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLwSBoTX6z73L1LHg7om0OX_Ww8DqERpA',
    appId: '1:375430683927:android:b16d681ce9d4f45684eb52',
    messagingSenderId: '375430683927',
    projectId: 'lilistapp',
    storageBucket: 'lilistapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJmm9gfeR2wnXesuwg6haxtBBJahvB_RI',
    appId: '1:375430683927:ios:a4b501efc31b690084eb52',
    messagingSenderId: '375430683927',
    projectId: 'lilistapp',
    storageBucket: 'lilistapp.appspot.com',
    iosBundleId: 'com.example.listApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJmm9gfeR2wnXesuwg6haxtBBJahvB_RI',
    appId: '1:375430683927:ios:a4b501efc31b690084eb52',
    messagingSenderId: '375430683927',
    projectId: 'lilistapp',
    storageBucket: 'lilistapp.appspot.com',
    iosBundleId: 'com.example.listApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfhCGCZh7TGQpn7aeOA1PUFK9gIyEH9m4',
    appId: '1:375430683927:web:ba7e8f0c434db8cd84eb52',
    messagingSenderId: '375430683927',
    projectId: 'lilistapp',
    authDomain: 'lilistapp.firebaseapp.com',
    storageBucket: 'lilistapp.appspot.com',
    measurementId: 'G-G7BHBQXWS8',
  );
}
