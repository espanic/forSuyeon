import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:for_suyeon/domain/repository/user_repository.dart';
import 'package:for_suyeon/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _repository = UserRepository();
  final Rxn<MyUser> _user = Rxn<MyUser>();
  final RxBool isProfileAlreadySet = false.obs;

  MyUser? get user => _user.value;



  @override
  Future<void> onInit() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    // if(currentUser!= null){
    //   await getData(currentUser.uid);
    //   if(user!.nickName != null && user!.profileImage != null){
    //     _isProfileAlreadySet.value = true;
    //   }
    // }
    super.onInit();
  }

  Future<bool> login(String email, String password) async {
    try {
      _user.value = await _repository.login(email, password);
      return true;
    } catch (e) {
      e.printError();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _repository.logout();
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
