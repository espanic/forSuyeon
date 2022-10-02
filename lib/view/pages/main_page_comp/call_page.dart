import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/view/components/page_title.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(mainPadVal),
        child: Column(
          children: [
            const PageTitle(titleText: "호두랑 얘기하기"),
            const SizedBox(
              height: 40,
            ),
            Flexible(child: Image.asset("assets/pw/waitingyou.png")),
            ElevatedButton(
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: yunhoPhone,
                  );
                  await launchUrl(launchUri);
                },
                child: const Icon(Icons.call)),
            const SizedBox(
              height: 10,
            ),
            Flexible(child: Image.asset("assets/pw/peanut_call.png")),
          ],
        ),
      ),
    );
  }
}
