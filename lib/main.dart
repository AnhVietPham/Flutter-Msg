import 'package:flutter/material.dart';
import 'sceens/home.dart';
import 'sceens/camera.dart';
import 'sceens/contact.dart';
import 'sceens/stories.dart';
import 'sceens/calls.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anh Viet Pham',
      theme: ThemeData(
          primaryColor: Color(0xFF2845E7),
          primaryColorDark: Color(0xFF2845E7)),
      home: DashboardScreenState(title: ''),
    );
  }
}

class DashboardScreenState extends StatefulWidget {
  final String title;

  DashboardScreenState({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreenState> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Home("Home"),
          Calls("Calls"),
          Camera("Camera Screen"),
          Stories("Stories Screen"),
          Contact("Contacts screen")
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: const Color(0xFF2845E7),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call), title: Text("Calls")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera), title: Text("Camera")),
              BottomNavigationBarItem(
                  icon: Stack(
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Positioned(
                        top: -1.0,
                        right: -1.0,
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.brightness_1,
                              size: 12.0,
                              color: const Color(0xFF2845E7),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  title: Text("Stories")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text("Contacts"))
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          )),
    );
  }
}
