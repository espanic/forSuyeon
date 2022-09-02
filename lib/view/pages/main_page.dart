import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/view/pages/main_page_comp/call_page.dart';
import 'package:for_suyeon/view/pages/main_page_comp/history_page.dart';
import 'package:for_suyeon/view/pages/main_page_comp/letter_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _indexItems = const [
    LetterPage2(),
    HistoryPage(),
    CallPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.envelope_fill),
              label: 'letter',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.envelope_fill),
              label: 'history',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.envelope_fill),
              label: 'call',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: _indexItems[_selectedIndex],
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
