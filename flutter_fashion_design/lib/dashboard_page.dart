import 'package:flutter/material.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),

        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
      ),
      
      body: Center(
        child: Text("dashBoard", style: TextStyle(fontSize: 45.0),),
      ),
    );
  }
}
