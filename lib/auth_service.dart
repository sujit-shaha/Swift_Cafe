import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithUsername(String username, String password) async {
    if (username.contains(' ')) {
      throw Exception('Username should not contain spaces.');
    }

    String trimmedUsername = username.trim();

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: '$trimmedUsername@gmail.com',  // Using trimmed username to create a pseudo-email
        password: password,
      );

      print('User created: ${userCredential.user?.email}');
    } catch (e) {
      print('Failed to create user: $e');
      throw e;
    }
  }

  Future<User?> signInWithUsername(String username, String password) async {
    if (username.contains(' ')) {
      throw Exception('Username should not contain spaces.');
    }
    String trimmedUsername = username.trim();
    try {




      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: '$username@gmail.com',
        password: password,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<String?> getCurrentUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}
