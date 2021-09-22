import 'package:flutter/material.dart';
import 'package:medicine_notifier/view/home/medicine_screen.dart';
import 'package:medicine_notifier/view/home/progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (pageIndex) {
          setState(() {
            _currentPageIndex = pageIndex;
          });
        },
        itemBuilder: (conext, index) =>
            index == 0 ? ProgressScreen() : MedicineScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
              print('Page index  : $index');
            });
            _controller.jumpToPage(_currentPageIndex);
          },
          selectedItemColor: Colors.amber.shade900,
          elevation: 0,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.black54,
          currentIndex: _currentPageIndex,
          items: [
            BottomNavigationBarItem(
                title: Text('Progress'), icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                title: Text('Add Medicine'), icon: Icon(Icons.medication))
          ]),
    );
  }
}
