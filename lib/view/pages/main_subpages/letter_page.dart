import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/controller/letter_page_controller.dart';
import 'package:for_suyeon/utils/util_functions.dart';
import 'package:for_suyeon/view/components/common/page_title.dart';
import 'package:for_suyeon/view/components/letter/letterThumbNail.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LetterPage extends GetView<LetterPageController> {
  const LetterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(mainPadVal),
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset("assets/pw/all_love.png"),
              ),
            ),
            Column(
              children: [
                const PageTitle(
                    titleText: "νΌλμκ²", imagePath: "assets/pw/peanut_lying.png"),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteHalf,
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                    padding: const EdgeInsets.all(letterPadVal),
                    width: double.infinity,
                    child: GetX<LetterPageController>(
                      init: controller,
                      builder: (controller) {
                        if (controller.letter.isEmpty) {
                          return _showLetterList();
                        }
                        return _showLetter(context);
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _showLetterList() {
    return ListView(
      children: [
        LetterThumbNail(
          title: "μ²« νΈμ§!",
          subTitle: "μμ°μ΄ μμΌμΆνν~!",
          assetName: "assets/letter/walnut1.jpg",
          onTap: () async {
            await controller.loadLetter('assets/letter/letter.txt');
          },
        ),
        LetterThumbNail(
          title: "λλ²μ§Έ νΈμ§!",
          subTitle: "λ©λ¦¬ν¬λ¦¬μ€λ§μ€!!",
          assetName: "assets/letter/walnut2.jpg",
          onTap: () async {
            await controller.loadLetter('assets/letter/letter2.txt');
          },
        ),
      ],
    );
  }

  Widget _showLetter(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              controller.clearLetter();
            },
            child: const Text("λͺ©λ‘μΌλ‘ λμκ°κΈ°", style: TextStyle(color: secondary),),
          ),
          Text(
            controller.letter,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          InkWell(
            child: const Text(
              "μμ€λ§ν¬",
              style: TextStyle(
                  fontFamily: "BinggraeSamanco",
                  color: Colors.purple,
                  fontSize: 32,
                  fontWeight: FontWeight.normal),
            ),
            onTap: () async {
              await launch('https://github.com/espanic/forSuyeon');
            },
          )
        ],
      ),
    );
  }
}
