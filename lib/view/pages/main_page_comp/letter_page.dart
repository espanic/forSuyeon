import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/view/components/page_title.dart';
import 'package:url_launcher/url_launcher.dart';

class LetterPage extends StatelessWidget {
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
                    titleText: "피넛에게", imagePath: "assets/pw/yu.png"),
                const SizedBox(
                  height: 32,
                ),
                FutureBuilder(
                  future: _loadLetter('assets/letter/letter.txt'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteHalf,
                            borderRadius: BorderRadius.circular(circularRadius),
                          ),
                          padding: const EdgeInsets.all(letterPadVal),
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                InkWell(
                                  child: Text(
                                    "소스링크",
                                    style:
                                    TextStyle(
                                        fontFamily: "BinggraeSamanco",
                                        color: Colors.purple, fontSize: 32, fontWeight: FontWeight.normal),
                                  ),
                                  onTap: () async {
                                    await launch('https://github.com/espanic/forSuyeon');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> _loadLetter(String path) async {
    Future<String> s =
        Future.delayed(const Duration(milliseconds: 0), () async {
      return await rootBundle.loadString(path);
    });
    return s;
  }
}
