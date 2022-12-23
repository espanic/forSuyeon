import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:for_suyeon/domain/repository/user_repository.dart';
import 'package:for_suyeon/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _repository = UserRepository();
  final Rxn<MyUser> _user = Rxn<MyUser>();
  final RxBool isProfileAlreadySet = false.obs;
  final Rxn<User> _firebaseUser = Rxn<User>();



  MyUser? get user => _user.value;
  User? get firebaseUser => _firebaseUser.value;



  @override
  Future<void> onInit() async {
    super.onInit();
    _firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  Future<bool> login(String email, String password) async {
    try {
      _user.value = await _repository.login(email, password);
      if(_user.value!.nickName != null && _user.value!.avatarUrl != null){
        isProfileAlreadySet.value = true;
      }
      return true;
    } catch (e) {
      e.printError();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _repository.logout();
      _user.value = null;
      return true;
    } catch (e) {
      e.printError();
      return false;
    }
  }

  Future<bool> getData(String uid) async {
    try {
      _user.value = await _repository.getData(uid);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveProfile(String nickName, File imageFile) async{
    var data = await _repository.saveProfile(nickName, user!.id, imageFile);
    _user.value!.nickName = data['nickname'];
    _user.value!.avatarUrl = data['avatarUrl'];
    _user.refresh();

  }
}
