import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB7Nx1UzkxElu_2-lYtHz8QosgkQP24CLI",
            authDomain: "mondaha-be2293.firebaseapp.com",
            projectId: "mondaha-be2293",
            storageBucket: "mondaha-be2293.firebasestorage.app",
            messagingSenderId: "970782100600",
            appId: "1:970782100600:web:91a79e2215d2d936f2b18d"));
  } else {
    await Firebase.initializeApp();
  }
}
