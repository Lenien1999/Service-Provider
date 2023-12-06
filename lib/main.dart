import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/controller.dart';
import 'package:serviceprovder/controller/mainscreencontroller.dart';
import 'package:serviceprovder/firebaseController/firbaseAuth/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:serviceprovder/pages/splashscreen.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return MainScreenController();
      }),
      ChangeNotifierProvider(create: (context) {
        return PageNotifier();
      }),
      ChangeNotifierProvider(create: (context) {
        return AuthProvider();
      })
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(95, 96, 185, 1)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
