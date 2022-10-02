import 'package:flutter/services.dart';


 Future<String> loadLetter(String path) async {
return await rootBundle.loadString(path);
}