import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA-YH6y8b4KwK5w7dyyvKmnikRGyeTR1rA",
            authDomain: "universo-botonista-flutterflow.firebaseapp.com",
            projectId: "universo-botonista-flutterflow",
            storageBucket: "universo-botonista-flutterflow.appspot.com",
            messagingSenderId: "494160458755",
            appId: "1:494160458755:web:560d93c92d849f36a0ca36",
            measurementId: "G-T5MDF2R88C"));
  } else {
    await Firebase.initializeApp();
  }
}
