import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/db/data_controller.dart';
import 'package:for_suyeon/view/pages/main_subpages/MyInfoPage.dart';
import 'package:for_suyeon/view/pages/main_subpages/chat_page.dart';
import 'package:get/get.dart';
import 'main_subpages/call_page.dart';
import 'main_subpages/history_page.dart';
import 'main_subpages/letter_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  final List<Widget> _indexItems = [
    const LetterPage(),
    HistoryPage(),
    const ChatPage(),
    const CallPage(),
    const MyInfoPage(),
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          elevation: 0,
          showSelectedLabels: false,
          selectedItemColor: buttonPrimary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.envelope_fill),
              label: '편지',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: '앨범',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_fill),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone_fill),
              label: '전화',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: '전화',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: widget._indexItems[_selectedIndex],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
