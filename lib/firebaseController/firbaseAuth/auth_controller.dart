import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/bottomNavigation.dart';
import 'package:serviceprovder/pages/splashscreen.dart';

import 'authexception.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _fireBaseUser;

  User? get fireBaseUser => _fireBaseUser;

  Future<void> initializeUser(BuildContext context) async {
    _fireBaseUser = _auth.currentUser;
    _auth.authStateChanges().listen((user) {
      _fireBaseUser = user;
      notifyListeners();
    });
    setInitialScreen(context);
  }

  void setInitialScreen(BuildContext context) {
    if (_fireBaseUser == null) {
      // If user is not logged in, navigate to LoginScreen
      Navigator.push(context, MaterialPageRoute(builder: (__) {
        return const SplashScreen();
      }));
    } else {
      // If user is logged in, navigate to BottomNavigation
      Navigator.push(context, MaterialPageRoute(builder: (__) {
        return BuildBottomNavigation();
      }));
    }
  }

  // Other methods like registerUser, signInUser, resetPassword, and logout remain the same

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
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (__) {
          return BuildBottomNavigation();
        }));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (__) {
          return const SplashScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication exceptions
    } catch (_) {
      // Handle other exceptions
    }
    notifyListeners();
  }

  Future<void> signInUser({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  Future<void> resetPassword(String email, BuildContext context) async {
    // Reset password functionality
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
