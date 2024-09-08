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
    apiKey: 'AIzaSyDccS2e6nslfmJqf1NprtxVByGOkMn2l3Y',
    appId: '1:77907890392:web:0fabdb135dad39c8e607ad',
    messagingSenderId: '77907890392',
    projectId: 'swiftcafe-6ddc6',
    authDomain: 'swiftcafe-6ddc6.firebaseapp.com',
    storageBucket: 'swiftcafe-6ddc6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVfSYuMWDmNWDFz_sBXTxwOuqZMqdqu24',
    appId: '1:77907890392:android:d8ffec41cb5dc701e607ad',
    messagingSenderId: '77907890392',
    projectId: 'swiftcafe-6ddc6',
    storageBucket: 'swiftcafe-6ddc6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1GyQhLHPQ1xPnAZTL5PqNaABdBqH3zjw',
    appId: '1:77907890392:ios:46d3fc0797ccb39ee607ad',
    messagingSenderId: '77907890392',
    projectId: 'swiftcafe-6ddc6',
    storageBucket: 'swiftcafe-6ddc6.appspot.com',
    iosBundleId: 'com.example.swiftCafe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1GyQhLHPQ1xPnAZTL5PqNaABdBqH3zjw',
    appId: '1:77907890392:ios:46d3fc0797ccb39ee607ad',
    messagingSenderId: '77907890392',
    projectId: 'swiftcafe-6ddc6',
    storageBucket: 'swiftcafe-6ddc6.appspot.com',
    iosBundleId: 'com.example.swiftCafe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDccS2e6nslfmJqf1NprtxVByGOkMn2l3Y',
    appId: '1:77907890392:web:41de338e855963b4e607ad',
    messagingSenderId: '77907890392',
    projectId: 'swiftcafe-6ddc6',
    authDomain: 'swiftcafe-6ddc6.firebaseapp.com',
    storageBucket: 'swiftcafe-6ddc6.appspot.com',
  );
}
