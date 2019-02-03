import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/bottom_page.dart';
import 'package:flutter_fashion_design/profile_page.dart';
import 'dart:async';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

// https://jsonplaceholder.typicode.com/users

/**
 * {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
      "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
      }
    },

    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
    }
    },
 *
 *
 */

class User {
  final String name;
  final String userName;
  final String userEmail;
  final String phone;

  User(this.name, this.userName, this.userEmail, this.phone);
}

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DBPage(),
    );
  }
}

class DBPage extends StatefulWidget {
  @override
  _DBPageState createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {

  var _selectedItem = 0;

  Future<List<User>> _getUser() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
//    print(response.body);

    var jsonData = json.jsonDecode(response.body);

    List<User> userList = [];

    for (var u in jsonData) {
      User user = User(u["name"], u["username"], u["email"], u["phone"]);
      userList.add(user);
    }
    print(userList.length);

    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomHomePage()));
            }),
      ),

      body: Container(
        child: FutureBuilder(
            future: _getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),

                    ),
//                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(

                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailPage(snapshot.data[index])));
                        },
                        leading: CircleAvatar(

                          backgroundColor: Colors.grey,
                          child: Text(snapshot.data[index].userName[0],
                            style: TextStyle(color: Colors.white),),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].userEmail),
                      );
                    });
              }
            }),
      ),

//      body: Center(
//        child: Text("dashBoard", style: TextStyle(fontSize: 45.0),),
//      ),

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
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ))
          ]),
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
        case 2:
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserProfilePage()));

          return;
      }
    });
  }


}

class UserDetailPage extends StatelessWidget {

  final User user;
  UserDetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(user.name, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
    );
  }
}

