import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCBQvJKj8atbxqmxrbUQ5weKmu6kyTa76E",
            authDomain: "pillbox-3e02f.firebaseapp.com",
            projectId: "pillbox-3e02f",
            storageBucket: "pillbox-3e02f.appspot.com",
            messagingSenderId: "532816096845",
            appId: "1:532816096845:web:43f8a52e5ee9d508bf3604"));
  } else {
    await Firebase.initializeApp();
  }
}
