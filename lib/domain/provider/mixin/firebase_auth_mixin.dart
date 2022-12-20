import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuthMixin {
  final firebaseAuth = FirebaseAuth.instance;
}