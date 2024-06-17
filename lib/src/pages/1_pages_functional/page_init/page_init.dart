import 'package:flutter/material.dart';
import 'package:manugestao_app/src/pages/1_pages_functional/page_account/page_account.dart';
import 'package:manugestao_app/src/pages/1_pages_functional/page_historic/page_historic.dart';
import 'package:manugestao_app/src/pages/1_pages_functional/page_home/page_home.dart';

class PageInit extends StatefulWidget {
  const PageInit({super.key});

  @override
  State<PageInit> createState() => _PageInitState();
}

class _PageInitState extends State<PageInit> {
  final List<Widget> _pages = [
    const PageHome(),
    const PageHistoric(),
    const PageAccount(),
  ];
  int _index = 0;

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Histórico",
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: "Conta",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
