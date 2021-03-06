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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBtcV38vEEJ2qmnxAwLgC9R-HCtss_83jA',
    appId: '1:559194613522:web:e15f5e90791247a5b1b5cb',
    messagingSenderId: '559194613522',
    projectId: 'hesap-app',
    authDomain: 'hesap-app.firebaseapp.com',
    storageBucket: 'hesap-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfN_4HfaG5c6o6qAUEC0Okk-R55e-kjMY',
    appId: '1:559194613522:android:b69657f6c8695e2cb1b5cb',
    messagingSenderId: '559194613522',
    projectId: 'hesap-app',
    storageBucket: 'hesap-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsZv9seg9ElZjuAZ7aR_vymkfIVQkvvA8',
    appId: '1:559194613522:ios:9c959a1354f4f27cb1b5cb',
    messagingSenderId: '559194613522',
    projectId: 'hesap-app',
    storageBucket: 'hesap-app.appspot.com',
    iosClientId: '559194613522-sfgafef6j6atfv9nbktqnvf7tbqld3p2.apps.googleusercontent.com',
    iosBundleId: 'com.yirmidort.hesap',
  );
}
