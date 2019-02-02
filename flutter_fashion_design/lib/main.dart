import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Discovery',
          style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera),
            color: Colors.grey,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
        ),
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                SizedBox(width: 35.0),
                listItem('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                SizedBox(width: 35.0),
                listItem('assets/model3.jpeg', 'assets/chloelogo.png'),
                SizedBox(width: 35.0),
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                
              ],
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 4.0,
              child: Container(
                height: 450.0,
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(String imgPath, String logo) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[

            //사람 사진 담을 것
            Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),

            // 디자인회사 로고
            Positioned(
              top: 50.0,
              left: 50.0,
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    image: DecorationImage(
                        image: AssetImage(logo), fit: BoxFit.cover)),
              ),
            )
          ],
        ),
        
        SizedBox(height: 10.0,),

        Container(
          height: 30.0,
          width: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Color(0xFF916144),
          ),
          child: Center(
            child: Text('Follow', style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.white),),
          ),
        )
      ],
    );
  }
}
