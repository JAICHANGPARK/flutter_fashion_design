import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/dashboard_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation:
            Theme.of(context).platform == TargetPlatform.android ? 0.0 : 0.0,
        backgroundColor: Colors.white,
      ),
//      floatingActionButton: FloatingActionButton(onPressed: () {},
//        child: Icon(Icons.add),
//      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Dreamwalker'),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5)
              ),
            ),
            ListTile(
              title: Text("Dashboard"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
              },
            ),

            ListTile(
              title: Text("Menu Test 2"),
              onTap: (){},
            ),

            ListTile(
              title: Text("Menu Test 3"),
              onTap: (){},
            ),

            ListTile(
              title: Text("Menu Test 4"),
              onTap: (){},
            ),

          ],

        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        backgroundColor: Colors.black,
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("Data Saved"),
            action: SnackBarAction(label: "Undo", onPressed: () {

            }),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
        foregroundColor: Colors.white,
      ),

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
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
                icon: Icon(Icons.dashboard), title: Text("Dashboard")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ]),
    );
  }
}
