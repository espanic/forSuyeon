import 'package:cached_network_image/cached_network_image.dart';

class MyUser {
  String? nickName;
  String? avatarUrl;
  String id;
  CachedNetworkImage? profileImage;

  MyUser.fromJson(Map<String, dynamic> data)
      : nickName = data['nickname'],
        avatarUrl = data['avatarUrl'],
        id = data['id'] {
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      profileImage = CachedNetworkImage(imageUrl: avatarUrl!);
    }
  }

  toJson()=> {
    'nickname':nickName,
    'avatarUrl':avatarUrl,
  };
}
