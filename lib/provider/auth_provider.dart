import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Account

  //Sign in user

  //Reset Password

  //SignOut
  void signOut() {
    auth.signOut();
  }

  //Google Auth
  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//Facebook
}
