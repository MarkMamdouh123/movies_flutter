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
    apiKey: 'AIzaSyDy7Wjy_7Q8gCXmYfe6MXcTgYj__FPESDk',
    appId: '1:902708911551:web:767db4b9e1234c7fd2550a',
    messagingSenderId: '902708911551',
    projectId: 'movies-3824a',
    authDomain: 'movies-3824a.firebaseapp.com',
    storageBucket: 'movies-3824a.appspot.com',
    measurementId: 'G-5M4THQTR0B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd220SdS7jDGvLZAe7MP1EKd9UuibtvKk',
    appId: '1:902708911551:android:e0903afab471ffb5d2550a',
    messagingSenderId: '902708911551',
    projectId: 'movies-3824a',
    storageBucket: 'movies-3824a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxt5U4qwtIfbxdnDEwaLGHik9BOutdYcc',
    appId: '1:902708911551:ios:7b3f4139c4487da6d2550a',
    messagingSenderId: '902708911551',
    projectId: 'movies-3824a',
    storageBucket: 'movies-3824a.appspot.com',
    iosBundleId: 'com.example.movies',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxt5U4qwtIfbxdnDEwaLGHik9BOutdYcc',
    appId: '1:902708911551:ios:9ad3dee438e36ceed2550a',
    messagingSenderId: '902708911551',
    projectId: 'movies-3824a',
    storageBucket: 'movies-3824a.appspot.com',
    iosBundleId: 'com.example.movies.RunnerTests',
  );
}
