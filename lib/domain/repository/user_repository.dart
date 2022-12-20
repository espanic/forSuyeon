import 'dart:io';

import 'package:for_suyeon/domain/provider/user_provider.dart';
import 'package:for_suyeon/model/user.dart';

class UserRepository {
  final _provider = UserProvider();

  Future<MyUser> login(String email, String password) async {
    var doc = await _provider.login(email, password);
    final id = doc.id;
    var data = doc.data()!;
    data['id'] = id;
    return MyUser.fromJson(data);
  }



  Future<void> logout() async {
    await _provider.logout();
  }

  Future<MyUser> getData(String uid) async {
    var doc = await _provider.getData(uid);
    final id = doc.id;
    var data = doc.data()!;
    data['id'] = id;
    return MyUser.fromJson(data);
  }

  Future<Map<String, dynamic>> saveProfile(String nickName, String uid, File imageFile) async{
    Map<String, dynamic> data = {"nickname" : nickName};
    return await _provider.saveProfile(data, uid, imageFile);
  }

}
