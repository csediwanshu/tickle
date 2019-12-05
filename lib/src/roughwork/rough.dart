// MaterialButton(

//       )
//       ,
//       GestureDetector(

//         onTap: (){
//           repository.signOut();
//         },
//       ),
//       AlertDialog(
//         title: Text('Confirm sign Out'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Yes'),
//             onPressed: (){
//               signOut();
//             },
//           ),
//           FlatButton(
//             child: Text('No'),
//           )
//         ],
//       ),

//       =================================


// Text('djvjdvjhdvjhjd hi  you got hard work'),
//             body: new PageView(
//               children: [
//                 new Container(
//                   color: Colors.white,
//                   child: InstaFeedScreen(),
//                 ),
//                 new Container(color: Colors.white, child: InstaSearchScreen()),
//                 new Container(
//                   color: Colors.white,
//                   child: InstaAddScreen(),
//                 ),
//                 new Container(
//                     color: Colors.white, child: InstaActivityScreen()),
//                 new Container(
//                     color: Colors.white,
//                     child: InstaProfileScreen()),
//               ],
//               controller: pageController,
//               physics: new NeverScrollableScrollPhysics(),
//               onPageChanged: onPageChanged,
//             ),
//             bottomNavigationBar: new CupertinoTabBar(
//               activeColor: Colors.orange,
//               items: <BottomNavigationBarItem>[
//                 new BottomNavigationBarItem(
//                     icon: new Icon(Icons.home, color: (_page == 0) ? Colors.black : Colors.grey),
//                     title: new Container(height: 0.0),
//                     backgroundColor: Colors.white),
//                 new BottomNavigationBarItem(
//                     icon: new Icon(Icons.search, color: (_page == 1) ? Colors.black : Colors.grey),
//                     title: new Container(height: 0.0),
//                     backgroundColor: Colors.white),
//                 new BottomNavigationBarItem(
//                     icon: new Icon(Icons.add_circle, color: (_page == 2) ? Colors.black : Colors.grey),
//                     title: new Container(height: 0.0),
//                     backgroundColor: Colors.white),
//                 new BottomNavigationBarItem(
//                     icon: new Icon(Icons.star, color: (_page == 3) ? Colors.black : Colors.grey),
//                     title: new Container(height: 0.0),
//                     backgroundColor: Colors.white),
//                 new BottomNavigationBarItem(
//                     icon: new Icon(Icons.person, color: (_page == 4) ? Colors.black : Colors.grey),
//                     title: new Container(height: 0.0),
//                     backgroundColor: Colors.white),
//               ],
//               onTap: navigationTapped,
//               currentIndex: _page,
//             ),





          
//  =========================== // 
// int _page = 0;

//   void navigationTapped(int page) {
//     //Animating Page
//     pageController.jumpToPage(page);
//   }

//   void onPageChanged(int page) {
//     setState(() {
//       // this._page = page;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     pageController = new PageController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pageController.dispose();
//   }

//   ===================================

//    int _selectedIndex = 0;
//     static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//     static const List<Widget> _widgetOptions = <Widget>[
//       Text(
//         'Index 0: Home',
//         style: optionStyle,
//       ),
//       Text(
//         'Index 1: Business',
//         style: optionStyle,
//       ),
      
//     ];

//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }


//      bottomNavigationBar:BottomNavigationBar(
//         elevation: 2.0,
//         backgroundColor: Colors.transparent,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             title: Text('Business'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             title: Text('Business'),
//           ),
         
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),

//       =====================