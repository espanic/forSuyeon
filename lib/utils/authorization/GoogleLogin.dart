
import 'package:firebase_auth/firebase_auth.dart';
import 'package:for_suyeon/utils/authorization/social_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin implements SocialLogin {
  @override
  Future<UserCredential> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<bool> logout() async {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
  }



}