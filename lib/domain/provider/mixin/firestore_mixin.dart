import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreMixin {
  final fireStore = FirebaseFirestore.instance;
}