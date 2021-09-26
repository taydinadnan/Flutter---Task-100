import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tech387task/Models/user2_info.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignInNow = GoogleSignIn();

  UserDetailsModel? userDetailsModel;

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

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignInNow.signIn();

    userDetailsModel = UserDetailsModel(
        displayName: googleSignInAccount!.displayName,
        email: googleSignInAccount.email,
        photoURL: googleSignInAccount.photoUrl);

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//Facebook
  Future<UserCredential> signInWithFacebook() async {
    final AccessToken result =
        (await FacebookAuth.instance.login()) as AccessToken;

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  userLogin() {}
}
