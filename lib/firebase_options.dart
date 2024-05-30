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
    apiKey: 'AIzaSyBMs1mf2wQCbPF11zN99NGuYIehOorQrTk',
    appId: '1:15847640484:web:d68862e2b71ba2f33c0531',
    messagingSenderId: '15847640484',
    projectId: 'kuldiproject-firebase',
    authDomain: 'kuldiproject-firebase.firebaseapp.com',
    databaseURL: 'https://kuldiproject-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kuldiproject-firebase.appspot.com',
    measurementId: 'G-94DYNMTKYK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9W5Dx5NDix7XUoL-wT39KXmZ6hXF2P3g',
    appId: '1:15847640484:android:d70fb094e51c22103c0531',
    messagingSenderId: '15847640484',
    projectId: 'kuldiproject-firebase',
    databaseURL: 'https://kuldiproject-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kuldiproject-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxX1KYazBsbRc06xZ1-O_Msw2jWNJKBVw',
    appId: '1:15847640484:ios:0b3af9cc6cb53cec3c0531',
    messagingSenderId: '15847640484',
    projectId: 'kuldiproject-firebase',
    databaseURL: 'https://kuldiproject-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kuldiproject-firebase.appspot.com',
    iosBundleId: 'com.example.kuldiFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxX1KYazBsbRc06xZ1-O_Msw2jWNJKBVw',
    appId: '1:15847640484:ios:0b3af9cc6cb53cec3c0531',
    messagingSenderId: '15847640484',
    projectId: 'kuldiproject-firebase',
    databaseURL: 'https://kuldiproject-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kuldiproject-firebase.appspot.com',
    iosBundleId: 'com.example.kuldiFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMs1mf2wQCbPF11zN99NGuYIehOorQrTk',
    appId: '1:15847640484:web:9ad91f8e70e9591e3c0531',
    messagingSenderId: '15847640484',
    projectId: 'kuldiproject-firebase',
    authDomain: 'kuldiproject-firebase.firebaseapp.com',
    databaseURL: 'https://kuldiproject-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kuldiproject-firebase.appspot.com',
    measurementId: 'G-XV61E5Q315',
  );
}
