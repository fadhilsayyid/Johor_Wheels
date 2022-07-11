import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<AuthStatus> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // User firebaseUser = result.user;
      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return AuthExceptionHandler.handleAuthException(e);
    }
  }

  Future<AuthStatus> signUp(String email, String password, String role) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'password': password,
          'role': role
        });
      });
      // User firebaseUser = result.user;
      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return AuthExceptionHandler.handleAuthException(e);
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  // Future<AuthStatus> resetPassword({String email}) async {
  //   await _auth
  //       .sendPasswordResetEmail(email: email)
  //       .then((value) => _status = AuthStatus.successful)
  //       .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
  //   return _status;
  // }
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}
