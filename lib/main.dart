import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowers_app/auth/login.dart';
import 'package:flowers_app/screens/home.dart';
import 'package:flowers_app/auth/register.dart';
import 'package:flowers_app/provider/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setLanguageCode('en');
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out! =====================================');
      } else {
        print('User is signed in! ================================================');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ? const Home() : const Login(),
        routes: {
          "signup": (context) => const Register(),
          "login": (context) => const Login(),
          "home": (context) => const Home(),
        },
      ),
    );
  }
}
