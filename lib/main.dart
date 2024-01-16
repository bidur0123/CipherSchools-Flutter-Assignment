import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:managment/Screens/Get_Started/get_started.dart';
import 'package:managment/Screens/Home_Screen/home.dart';
import 'package:managment/Screens/auth/login_screen.dart';
import 'package:managment/Screens/auth/signup_screen.dart';
import 'package:managment/firebase_options.dart';
import 'package:managment/utils/const.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';
import 'data/model/add_date.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseAuth.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(const App());
    } else {
      runApp(const MyHomeApp());
    }
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}
class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CypherX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Bottom(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/Bottom': (context) => const Bottom(),
      },
    );
  }
}
