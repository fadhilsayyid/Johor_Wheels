import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:johor_wheels/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:johor_wheels/services/auth_services.dart';

import 'DataHandler/appData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            initialData: null,
            create: (context) => context.read<AuthService>().authStateChanges,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Home",
          home: Wrapper(),
        ),
      ),
    );
  }
}
