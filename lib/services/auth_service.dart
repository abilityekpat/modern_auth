import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modern_authentication/widgets/toast.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      dynamic user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      Toast.errorToast(e.toString());
    }
    return false;
  }

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      dynamic User = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      Toast.errorToast(e.toString());
    }
    return false;
  }
}
