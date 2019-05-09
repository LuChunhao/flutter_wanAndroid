import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/view/pages/found_page.dart';
import 'package:flutter_wanandroid/view/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  final _widgetOptions = [
    Text('首页'),
    Text('发现'),
    Text('福利'),
    Text('我的'),
  ];

  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: _widgetOptions[0],
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: _widgetOptions[1],
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.directions_car),
        title: _widgetOptions[2],
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: _widgetOptions[3],
        backgroundColor: Colors.blue,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
        centerTitle: false,
      ),
      body: Center(
        child: IndexedStack(
          children: <Widget>[HomePage(), FoundPage(), FoundPage(), FoundPage()],
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: _widgetOptions.elementAt(0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_photo_alternate),
            title: _widgetOptions.elementAt(1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle),
            title: _widgetOptions.elementAt(2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: _widgetOptions.elementAt(3),
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: _navigationViews
//            .map((BottomNavigationBarItem navigationView) => navigationView)
//            .toList(),
//        currentIndex: _selectedIndex,
//        type: BottomNavigationBarType.fixed,
//        onTap: (index) {
//          setState(() {
//            _selectedIndex = index;
//          });
//        },
//      ),
    );
  }
}
