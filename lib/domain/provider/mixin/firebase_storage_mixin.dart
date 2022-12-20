import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageMixin {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;
}