import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_suyeon/db/data_controller.dart';
import 'package:for_suyeon/theme.dart';
import 'package:for_suyeon/utils/util_functions.dart';
import 'package:for_suyeon/view/pages/prev_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      checkerboardOffscreenLayers: true,
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      onInit: _initialize,
      home: PrevPage(),
    );
  }

  Future<void> _initialize() async {
    final controller = Get.put(DataController());
    final prefs = await SharedPreferences.getInstance();
    final bool? alreadyInstall = prefs.getBool('alreadyInstall');
    if (alreadyInstall != true){
      final content = await loadLetter('assets/example/example.txt');
      var bytes = await rootBundle.load('assets/example/example.jpg');
      final id = DateTime.now().millisecondsSinceEpoch;
      await controller.insertDataInitial(id, content, bytes);
      prefs.setBool('alreadyInstall', true);
    }
    await controller.getData();
  }
}
