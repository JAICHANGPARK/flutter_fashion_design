import 'package:flutter/material.dart';


class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("My Profile", style: TextStyle(color: Colors.black),),
      ),
      
      body: Center(
        child: Text("A little Rest Time", style: TextStyle(fontSize: 24.0),),
      ),


    );
  }
}
