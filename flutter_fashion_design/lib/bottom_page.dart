import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/dashboard_page.dart';
import 'package:flutter_fashion_design/news_page.dart';
import 'package:flutter_fashion_design/profile_page.dart';
import 'dart:async';

class BottomHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigation(),
    );
  }
}

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedItem = 1;


  Future<bool> _onWillPop() {
    return showDialog(context: context,

        builder: (context) =>
            AlertDialog(
              title: Text("Are you Sure?"),
              content: Text("Do you want to exit an App??"),
              actions: <Widget>[

                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),

                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes"),
                ),

              ],
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onWillPop,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation:
          Theme
              .of(context)
              .platform == TargetPlatform.android ? 0.0 : 0.0,
          backgroundColor: Colors.white,

          actions: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.search, ),
                onPressed: (){},
              ),
            )
          ],
        ),
//      floatingActionButton: FloatingActionButton(onPressed: () {},
//        child: Icon(Icons.add),
//      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text(
                  "Dreamwalker",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text("aristojeff@gmail.com",
                    style: TextStyle(color: Colors.black)),
                currentAccountPicture: InkWell(
                  onTap: () {
//                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => UserProfilePage()));
                  },
                  child: CircleAvatar(
                    backgroundColor:
                    Theme
                        .of(context)
                        .platform == TargetPlatform.iOS
                        ? Colors.grey
                        : Colors.grey.withOpacity(0.4),
                    child: Text(
                      "D",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      "J",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
//            DrawerHeader(
//              child: Text('Dreamwalker'),
//              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
//            ),
              ListTile(
                title: Text("Dashboard"),
                onTap: () {
//                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashBoardPage()));
                },
              ),
              ListTile(
                title: Text("Menu Test 2"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Menu Test 3"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Menu Test 4"),
                onTap: () {},
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0)),
          backgroundColor: Colors.black,
          onPressed: () {
            final snackBar = SnackBar(
              content: Text("Data Saved"),
              action: SnackBarAction(label: "Undo", onPressed: () {}),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          },
          icon: Icon(Icons.save),
          label: Text("Save"),
          foregroundColor: Colors.white,
        ),

        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedItem,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.black),
                  )),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chrome_reader_mode,//flutter Icon....
                    color: Colors.black,
                  ),
                  title: Text(
                    "News",
                    style: TextStyle(color: Colors.black),
                  )),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(color: Colors.black),
                  ),
              ),

            ]),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;

      print(_selectedItem);

      switch (index) {
        case 0:
          return;
        case 1:
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoardPage()));
          return;

        case 2: // News Page
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsReadPage()));

          return;
        case 3:
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserProfilePage()));

          return;
      }
    });
  }
}
