import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_suyeon/const.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({Key? key}) : super(key: key);

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  bool letterReady = false;
  @override
  Widget build(BuildContext context) {
    Future<String> letter = _loadLetter('assets/letter/txt');
    letter.then((value) {setState(() {
      letterReady = true;
    });});
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(mainPadVal),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "월넛에게",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset("assets/pw/yu.png", fit: BoxFit.contain,width: 150,),
                        ],
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _loadLetter(String path) async {
    return await rootBundle.loadString(path);
  }
}
