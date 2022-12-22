import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meau_app/screens/Introduction/index.dart';
import 'package:meau_app/screens/Login/index.dart';
import 'package:meau_app/services/auth/index.dart';
import 'package:meau_app/wrapper.dart';
import 'package:provider/provider.dart';

import 'utils/firebase_options.dart';
import 'screens/SplashScreen/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meau',
          initialRoute: '/',
          routes: {
            '/': (context) => const Wrapper(),
            '/intro': (context) => const IntroScreen(),
            '/login': ((context) => const LoginScreen()),
            '/home': (context) => const IntroductionScreen(),
          },
        ));
  }
}
