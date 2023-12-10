import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/bottomNavigation.dart';
import 'package:serviceprovder/pages/splashscreen.dart';

import 'authexception.dart';

class AuthController with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User? _fireBaseUser;

  User? get fireBaseUser => _fireBaseUser;

  AuthController() {
    _auth.authStateChanges().listen((user) {
      _fireBaseUser = user;
      notifyListeners();
    });
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> registerUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_fireBaseUser != null) {
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(
              builder: (context) => const BuildBottomNavigation()),
        );
      } else {
        navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (context) => const SplashScreen()));
      }
    } on FirebaseAuthException catch (e) {
      final error = SignandLoginFailure.code(e.code);
      // ignore: use_build_context_synchronously
      _showErrorSnackbar(context, error.failure, Colors.red);
    } catch (_) {
      const error = SignandLoginFailure();
      // ignore: use_build_context_synchronously
      _showSuccessSnackbar(context, error.failure, Colors.green);
    }
    notifyListeners();
  }

  Future<void> signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
          builder: (context) => const BuildBottomNavigation()));
    } on FirebaseAuthException catch (e) {
      final error = SignandLoginFailure.code(e.code);
      // ignore: use_build_context_synchronously
      _showErrorSnackbar(context, error.failure, Colors.red);
    } catch (_) {
      const error = SignandLoginFailure();
      // ignore: use_build_context_synchronously
      _showSuccessSnackbar(context, error.failure, Colors.green);
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  void _showErrorSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSuccessSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
