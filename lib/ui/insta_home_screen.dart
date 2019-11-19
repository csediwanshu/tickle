import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/home_page.dart';


class InstaHomeScreen extends StatefulWidget {
  _InstaHomeScreenState createState() => _InstaHomeScreenState();
}

// PageController pageController;

class _InstaHomeScreenState extends State<InstaHomeScreen> {

  // // int _page = 0;

  // void navigationTapped(int page) {
  //   //Animating Page
  //   pageController.jumpToPage(page);
  // }

  // void onPageChanged(int page) {
  //   setState(() {
  //     // this._page = page;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   pageController = new PageController();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Text('TICKLE'),
          ),
        ),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: IconButton(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0.0,0.0,15.0,20.0),
                icon: Icon(Icons.add),
                onPressed: (){
                  addFriendToList;
                },
                color: Colors.white,
                iconSize: 30.0,
              ),
              
            ),
          ),
        ],

      ),
     body: homePage, 
    );
  }

 Widget  addFriendToList() {
   
  }
}


// Text('djvjdvjhdvjhjd hi  you got hard work'),
            // body: new PageView(
            //   children: [
            //     new Container(
            //       color: Colors.white,
            //       child: InstaFeedScreen(),
            //     ),
            //     new Container(color: Colors.white, child: InstaSearchScreen()),
            //     new Container(
            //       color: Colors.white,
            //       child: InstaAddScreen(),
            //     ),
            //     new Container(
            //         color: Colors.white, child: InstaActivityScreen()),
            //     new Container(
            //         color: Colors.white,
            //         child: InstaProfileScreen()),
            //   ],
            //   controller: pageController,
            //   physics: new NeverScrollableScrollPhysics(),
            //   onPageChanged: onPageChanged,
            // ),
            // bottomNavigationBar: new CupertinoTabBar(
            //   activeColor: Colors.orange,
            //   items: <BottomNavigationBarItem>[
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.home, color: (_page == 0) ? Colors.black : Colors.grey),
            //         title: new Container(height: 0.0),
            //         backgroundColor: Colors.white),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.search, color: (_page == 1) ? Colors.black : Colors.grey),
            //         title: new Container(height: 0.0),
            //         backgroundColor: Colors.white),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.add_circle, color: (_page == 2) ? Colors.black : Colors.grey),
            //         title: new Container(height: 0.0),
            //         backgroundColor: Colors.white),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.star, color: (_page == 3) ? Colors.black : Colors.grey),
            //         title: new Container(height: 0.0),
            //         backgroundColor: Colors.white),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.person, color: (_page == 4) ? Colors.black : Colors.grey),
            //         title: new Container(height: 0.0),
            //         backgroundColor: Colors.white),
            //   ],
            //   onTap: navigationTapped,
            //   currentIndex: _page,
            // ),