import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Sign Up with Email & Password
  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign In with Email & Password
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


  // Reset Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  // Get current user
  User? getCurrentUser() {
    return auth.currentUser;
  }

  // Update Password
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = googleSignIn.currentUser;
    if (googleUser == null) {
      googleUser = await googleSignIn.signInSilently();
    }
    if (googleUser == null) {
      googleUser = await googleSignIn.signIn();
    }
    if (googleUser == null) {
      throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final OAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user = await auth.signInWithCredential(googleCredential);
    // Link the existing email/password account to the Google account
    // AuthCredential emailCredential =
    //     EmailAuthProvider.credential(email: email, password: password);
    // await user.user!.linkWithCredential(emailCredential);
    return user;
  }

  // Create User with Email and Password, and link with Google if email already in use
  Future<UserCredential> createUserWithEmailAndLinkGoogle(
      String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

// Link Email/Password with Google account
  Future<UserCredential?> linkGoogleToExistingEmail(
      String email, String password) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential googleUserCredential =
          await auth.signInWithCredential(googleCredential);
      AuthCredential emailCredential =
          EmailAuthProvider.credential(email: email, password: password);
      return await googleUserCredential.user!
          .linkWithCredential(emailCredential);
    } catch (e) {
      print('Failed to link Google account with email/password: $e');
    }
    return null;
  }

// Sign out from Firebase and Google
  Future<void> signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      print('User signed out.');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
